// lib/shared/shipping_address_form.dart
//
// First physical-shipping address UI in the app (Printful merch orders
// are the first thing that ships a physical item -- everything else is
// digital/virtual). Built once here so any future physical-goods flow
// can reuse it rather than re-inventing an address form.

import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'widgets.dart';

/// Owns its own controllers and reports the current (possibly
/// incomplete) address on every change via [onChanged] -- the caller
/// decides when the address is "complete enough" to proceed (see
/// [isComplete]) rather than this widget gating anything itself.
class ShippingAddressForm extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>> onChanged;
  const ShippingAddressForm({super.key, required this.onChanged});

  /// True once every field required to actually ship something is filled.
  /// address2/phone are optional, matching how most checkout forms treat them.
  static bool isComplete(Map<String, dynamic> address) {
    for (final key in ['name', 'address1', 'city', 'state_code', 'zip', 'country_code']) {
      if ((address[key] as String? ?? '').trim().isEmpty) return false;
    }
    return true;
  }

  @override
  State<ShippingAddressForm> createState() => _ShippingAddressFormState();
}

class _ShippingAddressFormState extends State<ShippingAddressForm> {
  final _name = TextEditingController();
  final _address1 = TextEditingController();
  final _address2 = TextEditingController();
  final _city = TextEditingController();
  final _stateCode = TextEditingController();
  final _zip = TextEditingController();
  final _countryCode = TextEditingController(text: 'US');
  final _phone = TextEditingController();

  late final _controllers = [
    _name, _address1, _address2, _city, _stateCode, _zip, _countryCode, _phone,
  ];

  @override
  void initState() {
    super.initState();
    for (final c in _controllers) {
      c.addListener(_emit);
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _emit() {
    widget.onChanged({
      'name': _name.text,
      'address1': _address1.text,
      'address2': _address2.text,
      'city': _city.text,
      'state_code': _stateCode.text,
      'zip': _zip.text,
      'country_code': _countryCode.text,
      'phone': _phone.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      KodaTextField(controller: _name, hintText: 'Full name'),
      const SizedBox(height: 8),
      KodaTextField(controller: _address1, hintText: 'Address line 1'),
      const SizedBox(height: 8),
      KodaTextField(controller: _address2, hintText: 'Address line 2 (optional)'),
      const SizedBox(height: 8),
      KodaTextField(controller: _city, hintText: 'City'),
      const SizedBox(height: 8),
      Row(children: [
        Expanded(child: KodaTextField(controller: _stateCode, hintText: 'State')),
        const SizedBox(width: 8),
        Expanded(child: KodaTextField(controller: _zip, hintText: 'ZIP / postal code')),
      ]),
      const SizedBox(height: 8),
      Row(children: [
        Expanded(child: KodaTextField(controller: _countryCode, hintText: 'Country code (e.g. US)')),
        const SizedBox(width: 8),
        Expanded(child: KodaTextField(controller: _phone, hintText: 'Phone (optional)')),
      ]),
      const SizedBox(height: 4),
      Text(
        'Used only to ship this order -- see Printful\'s own privacy policy for how they handle it once the order is placed.',
        style: TextStyle(color: KodaColors.text3, fontSize: 11),
      ),
    ]);
  }
}
