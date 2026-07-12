// lib/features/gallery/gallery_screen.dart
//
// Gallery channel view: two modes selectable via a tab bar at the top.
//   Feed    -- all posts in the channel, newest first, image grid
//   Collections -- browse by collection, then see that collection's posts
//
// Posting requires the post_media permission (or owner/admin).
// Creating/editing collections requires manage_channels (or owner/admin).
// Media is URL-based for this version; self-hosted uploads are a follow-up.

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api.dart';
import '../../core/uploader.dart';
import '../../core/theme.dart';
import '../../core/providers.dart';
import '../../shared/widgets.dart';

class GalleryScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> channel;
  const GalleryScreen({super.key, required this.channel});
  @override
  ConsumerState<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends ConsumerState<GalleryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;
  List<Map<String, dynamic>> _collections = [];
  List<Map<String, dynamic>> _feedPosts = [];
  Map<String, dynamic>? _activeCollection;
  List<Map<String, dynamic>> _collectionPosts = [];
  bool _loadingFeed = true;
  bool _loadingCollections = true;
  bool _loadingCollectionPosts = false;

  String get _channelId => widget.channel['id'] as String;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    _loadFeed();
    _loadCollections();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _loadFeed() async {
    setState(() => _loadingFeed = true);
    final posts = await KodaApi.instance.getGalleryPosts(_channelId);
    if (!mounted) return;
    setState(() { _feedPosts = posts; _loadingFeed = false; });
  }

  Future<void> _loadCollections() async {
    setState(() => _loadingCollections = true);
    final cols = await KodaApi.instance.getGalleryCollections(_channelId);
    if (!mounted) return;
    setState(() { _collections = cols; _loadingCollections = false; });
  }

  Future<void> _loadCollectionPosts(Map<String, dynamic> collection) async {
    setState(() {
      _activeCollection = collection;
      _loadingCollectionPosts = true;
      _collectionPosts = [];
    });
    final posts = await KodaApi.instance.getCollectionPosts(collection['id'] as String);
    if (!mounted) return;
    if (_activeCollection?['id'] == collection['id']) {
      setState(() { _collectionPosts = posts; _loadingCollectionPosts = false; });
    }
  }
Future<void> _showCreatePost({String? collectionId}) async {
    final urlCtrl     = TextEditingController();
    final captionCtrl = TextEditingController();
    String mediaType  = 'image';
    String? pickedFilePath;
    String? pickedFileName;
    bool uploading = false;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlg) => AlertDialog(
          backgroundColor: KodaColors.card,
          title: const Text('New Post', style: TextStyle(color: KodaColors.text1)),
          content: SizedBox(
            width: 400,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              // File picker button
              OutlinedButton.icon(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'mp4', 'mov', 'webm'],
                  );
                  if (result != null && result.files.single.path != null) {
                    setDlg(() {
                      pickedFilePath = result.files.single.path;
                      pickedFileName = result.files.single.name;
                      urlCtrl.clear();
                      // Auto-detect type from extension
                      final ext = result.files.single.extension?.toLowerCase() ?? '';
                      mediaType = ['mp4', 'mov', 'webm'].contains(ext) ? 'video' : 'image';
                    });
                  }
                },
                icon: const Icon(Icons.upload_file, size: 16),
                label: Text(pickedFileName ?? 'Choose File'),
              ),
              const SizedBox(height: 8),
              const Row(children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('or', style: TextStyle(color: KodaColors.text3, fontSize: 11)),
                ),
                Expanded(child: Divider()),
              ]),
              const SizedBox(height: 8),
              KodaTextField(
                controller: urlCtrl,
                hintText: 'Paste image/video URL',
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: mediaType,
                dropdownColor: KodaColors.card,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: 'image', child: Text('Image')),
                  DropdownMenuItem(value: 'video', child: Text('Video')),
                ],
                onChanged: (v) => setDlg(() => mediaType = v ?? 'image'),
              ),
              const SizedBox(height: 10),
              KodaTextField(
                controller: captionCtrl,
                hintText: 'Caption (optional)',
              ),
              if (uploading) ...[
                const SizedBox(height: 12),
                const Row(children: [
                  SizedBox(width: 16, height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2, color: KodaColors.koda)),
                  SizedBox(width: 8),
                  Text('Uploading...', style: TextStyle(color: KodaColors.text3, fontSize: 12)),
                ]),
              ],
            ]),
          ),
          actions: [
            TextButton(
              onPressed: uploading ? null : () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: uploading ? null : () => Navigator.pop(ctx, true),
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true) return;
    if (pickedFilePath == null && urlCtrl.text.trim().isEmpty) return;

    String mediaUrl;

    if (pickedFilePath != null) {
      // Detect content type from extension
      final ext = pickedFilePath!.split('.').last.toLowerCase();
      final contentType = switch (ext) {
        'jpg' || 'jpeg' => 'image/jpeg',
        'png'           => 'image/png',
        'gif'           => 'image/gif',
        'webp'          => 'image/webp',
        'mp4'           => 'video/mp4',
        'mov'           => 'video/quicktime',
        'webm'          => 'video/webm',
        _               => 'image/jpeg',
      };

      try {
        final result = await KodaUploader.instance.upload(
          file: File(pickedFilePath!),
          uploadType: 'gallery',
          contentType: contentType,
        );
        mediaUrl = result.cdnUrl;
      } on UploadException catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.message)));
        }
        return;
      }
    } else {
      mediaUrl = urlCtrl.text.trim();
    }

    final data = {
      'caption':       captionCtrl.text.trim().isEmpty ? null : captionCtrl.text.trim(),
      'collection_id': collectionId,
      'media': [{'url': mediaUrl, 'type': mediaType}],
    };

    final post = await KodaApi.instance.createGalleryPost(_channelId, data);
    if (post != null && mounted) {
      _loadFeed();
      if (collectionId != null && _activeCollection?['id'] == collectionId) {
        _loadCollectionPosts(_activeCollection!);
      }
    }
  }
  
  // -- Collection management --------------------------------------------------

  Future<void> _showCreateCollection() async {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: KodaColors.card,
        title: const Text('New Collection', style: TextStyle(color: KodaColors.text1)),
        content: SizedBox(
          width: 360,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            KodaTextField(controller: nameCtrl, hintText: 'Collection name'),
            const SizedBox(height: 10),
            KodaTextField(controller: descCtrl, hintText: 'Description (optional)'),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true),
              child: const Text('Create')),
        ],
      ),
    );

    if (confirmed != true || nameCtrl.text.trim().isEmpty) return;

    final data = {
      'name': nameCtrl.text.trim(),
      if (descCtrl.text.trim().isNotEmpty) 'description': descCtrl.text.trim(),
    };

    final col = await KodaApi.instance.createGalleryCollection(_channelId, data);
    if (col != null && mounted) _loadCollections();
  }

  Future<void> _deleteCollection(Map<String, dynamic> col) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: KodaColors.card,
        content: Text('Delete "${col['name']}"? Posts inside will become uncollected.',
            style: const TextStyle(color: KodaColors.text1)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Delete', style: TextStyle(color: KodaColors.accent))),
        ],
      ),
    );
    if (confirmed != true) return;
    await KodaApi.instance.deleteGalleryCollection(col['id'] as String);
    if (mounted) {
      if (_activeCollection?['id'] == col['id']) {
        setState(() { _activeCollection = null; _collectionPosts = []; });
      }
      _loadCollections();
    }
  }

  Future<void> _deletePost(Map<String, dynamic> post) async {
    await KodaApi.instance.deleteGalleryPost(post['id'] as String);
    _loadFeed();
    if (_activeCollection != null) _loadCollectionPosts(_activeCollection!);
  }

  // -- Helpers ----------------------------------------------------------------

  bool _canManage() {
    // Server owner check not available client-side; the server enforces it.
    // We show the buttons optimistically and let the server return 403 if
    // the user actually lacks the permission.
    return true;
  }

  String _firstImageUrl(Map<String, dynamic> post) {
    final media = post['media'] as List?;
    if (media == null || media.isEmpty) return '';
    final first = media.first as Map<String, dynamic>?;
    return first?['url'] as String? ?? '';
  }

  // -- Build ------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Header with tabs
      Container(
        color: KodaColors.card,
        child: Column(children: [
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: KodaColors.border))),
            child: Row(children: [
              const Icon(Icons.image_outlined, size: 16, color: KodaColors.text3),
              const SizedBox(width: 6),
              Expanded(
                child: Text(widget.channel['name'] as String? ?? '',
                    style: const TextStyle(color: KodaColors.text1,
                        fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              IconButton(
                icon: const Icon(Icons.add_photo_alternate_outlined,
                    size: 18, color: KodaColors.text3),
                tooltip: 'New Post',
                onPressed: () => _showCreatePost(
                    collectionId: _activeCollection?['id'] as String?),
              ),
            ]),
          ),
          TabBar(
            controller: _tabs,
            indicatorColor: KodaColors.koda,
            labelColor: KodaColors.text1,
            unselectedLabelColor: KodaColors.text3,
            tabs: const [Tab(text: 'Feed'), Tab(text: 'Collections')],
          ),
        ]),
      ),

      // Tab content
      Expanded(
        child: TabBarView(
          controller: _tabs,
          children: [_buildFeed(), _buildCollections()],
        ),
      ),
    ]);
  }

  Widget _buildFeed() {
    if (_loadingFeed) {
      return const Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    if (_feedPosts.isEmpty) {
      return const Center(
          child: Text('No posts yet', style: TextStyle(color: KodaColors.text3)));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _feedPosts.length,
      itemBuilder: (_, i) => _PostTile(
        post: _feedPosts[i],
        imageUrl: _firstImageUrl(_feedPosts[i]),
        onDelete: _canManage() ? () => _deletePost(_feedPosts[i]) : null,
      ),
    );
  }

  Widget _buildCollections() {
    if (_loadingCollections) {
      return const Center(child: CircularProgressIndicator(color: KodaColors.koda));
    }
    return Row(children: [
      // Collection list sidebar
      Container(
        width: 200,
        decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: KodaColors.border))),
        child: Column(children: [
          if (_canManage())
            TextButton.icon(
              onPressed: _showCreateCollection,
              icon: const Icon(Icons.add, size: 14),
              label: const Text('New Collection'),
            ),
          Expanded(
            child: _collections.isEmpty
                ? const Center(
                    child: Text('No collections yet',
                        style: TextStyle(color: KodaColors.text3, fontSize: 12),
                        textAlign: TextAlign.center))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    itemCount: _collections.length,
                    itemBuilder: (_, i) {
                      final col = _collections[i];
                      final active = _activeCollection?['id'] == col['id'];
                      return ListTile(
                        dense: true,
                        selected: active,
                        selectedTileColor: KodaColors.koda.withOpacity(0.1),
                        leading: const Icon(Icons.photo_album_outlined,
                            size: 16, color: KodaColors.text3),
                        title: Text(col['name'] as String? ?? '',
                            style: TextStyle(
                                color: active ? KodaColors.text1 : KodaColors.text2,
                                fontSize: 13),
                            overflow: TextOverflow.ellipsis),
                        trailing: _canManage()
                            ? PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert,
                                    size: 14, color: KodaColors.text3),
                                color: KodaColors.card,
                                onSelected: (v) {
                                  if (v == 'delete') _deleteCollection(col);
                                },
                                itemBuilder: (_) => const [
                                  PopupMenuItem(
                                      value: 'delete', child: Text('Delete')),
                                ],
                              )
                            : null,
                        onTap: () => _loadCollectionPosts(col),
                      );
                    },
                  ),
          ),
        ]),
      ),

      // Collection post grid
      Expanded(
        child: _activeCollection == null
            ? const Center(
                child: Text('Select a collection',
                    style: TextStyle(color: KodaColors.text3)))
            : _loadingCollectionPosts
                ? const Center(
                    child: CircularProgressIndicator(color: KodaColors.koda))
                : _collectionPosts.isEmpty
                    ? Center(
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          const Text('No posts in this collection',
                              style: TextStyle(color: KodaColors.text3)),
                          const SizedBox(height: 12),
                          OutlinedButton.icon(
                            onPressed: () => _showCreatePost(
                                collectionId: _activeCollection!['id'] as String),
                            icon: const Icon(Icons.add, size: 14),
                            label: const Text('Add Post'),
                          ),
                        ]),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: _collectionPosts.length,
                        itemBuilder: (_, i) => _PostTile(
                          post: _collectionPosts[i],
                          imageUrl: _firstImageUrl(_collectionPosts[i]),
                          onDelete: _canManage()
                              ? () => _deletePost(_collectionPosts[i])
                              : null,
                        ),
                      ),
      ),
    ]);
  }
}

// -- Post tile widget ----------------------------------------------------------

class _PostTile extends StatefulWidget {
  final Map<String, dynamic> post;
  final String imageUrl;
  final VoidCallback? onDelete;
  const _PostTile({required this.post, required this.imageUrl, this.onDelete});

  @override
  State<_PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<_PostTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final caption  = widget.post['caption'] as String?;
    final creator  = widget.post['creator'] as Map<String, dynamic>?;
    final username = creator?['username'] as String? ?? '?';

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit:  (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => _showDetail(context),
        child: Stack(children: [
          // Image
          Positioned.fill(
            child: widget.imageUrl.isNotEmpty
                ? Image.network(widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _placeholder())
                : _placeholder(),
          ),

          // Hover overlay with caption + author
          if (_hover)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  if (caption != null && caption.isNotEmpty)
                    Text(caption,
                        style: const TextStyle(color: Colors.white, fontSize: 11),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  Text(username,
                      style: const TextStyle(
                          color: KodaColors.koda, fontSize: 10,
                          fontWeight: FontWeight.w600)),
                ]),
              ),
            ),

          // Delete button
          if (_hover && widget.onDelete != null)
            Positioned(
              top: 4, right: 4,
              child: GestureDetector(
                onTap: widget.onDelete,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: KodaColors.accent.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.delete_outline,
                      size: 14, color: Colors.white),
                ),
              ),
            ),
        ]),
      ),
    );
  }

  Widget _placeholder() => Container(
        color: KodaColors.elevated,
        child: const Center(
            child: Icon(Icons.image_outlined, color: KodaColors.text3, size: 32)),
      );

  void _showDetail(BuildContext context) {
    final caption  = widget.post['caption'] as String?;
    final creator  = widget.post['creator'] as Map<String, dynamic>?;
    final username = creator?['username'] as String? ?? '?';
    final media    = widget.post['media'] as List? ?? [];

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: KodaColors.card,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          child: Column(children: [
            // Images
            Expanded(
              child: media.isEmpty
                  ? _placeholder()
                  : PageView(
                      children: media.map<Widget>((m) {
                        final url = (m as Map<String, dynamic>)['url'] as String? ?? '';
                        return url.isNotEmpty
                            ? Image.network(url, fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => _placeholder())
                            : _placeholder();
                      }).toList(),
                    ),
            ),
            // Caption + author
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                KodaAvatar(username: username, size: 32),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(username,
                        style: const TextStyle(color: KodaColors.koda,
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    if (caption != null && caption.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(caption,
                          style: const TextStyle(color: KodaColors.text1,
                              fontSize: 13)),
                    ],
                  ]),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: KodaColors.text3, size: 18),
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
