/* This file is a deliberately trimmed-down replacement for upstream's
 * generated src/rnnoise_data.c (xiph/rnnoise, commit
 * 70f1d256acd4b34a572f999a05c87bf00b67730). Upstream's version of this
 * file is ~78MB of decimal float-literal arrays (the model's compiled-in
 * weights, guarded by `#ifndef USE_WEIGHTS_FILE`) followed by this one
 * function, init_rnnoise(), which is completely independent of that
 * array data -- it only wires named lookups (linear_init calls) against
 * whatever WeightArray* list it's handed.
 *
 * Koda ships the model weights as a separate compact binary blob
 * (weights_blob.bin, built by tool/build_rnnoise_weights_blob.js from
 * the same upstream model release, embedded as a Windows resource and
 * loaded at runtime via rnnoise_model_from_buffer + parse_weights) --
 * see audio_noise_suppressor.cc. That path and the compiled-in-array
 * path both bottom out in this same init_rnnoise() call, so behavior is
 * identical; only the giant literal-array text is avoided.
 *
 * This function's body is copied verbatim from upstream's generated
 * file (it is not itself generated -- the layer names/dimensions are a
 * fixed property of the model architecture, not the trained weights).
 */

#include "rnnoise_data.h"

int init_rnnoise(RNNoise *model, const WeightArray *arrays) {
    if (linear_init(&model->conv1, arrays, "conv1_bias", NULL, NULL,"conv1_weights_float", NULL, NULL, NULL, 195, 128)) return 1;
    if (linear_init(&model->conv2, arrays, "conv2_bias", "conv2_subias", "conv2_weights_int8","conv2_weights_float", NULL, NULL, "conv2_scale", 384, 384)) return 1;
    if (linear_init(&model->gru1_input, arrays, "gru1_input_bias", "gru1_input_subias", "gru1_input_weights_int8","gru1_input_weights_float", "gru1_input_weights_idx", NULL, "gru1_input_scale", 384, 1152)) return 1;
    if (linear_init(&model->gru1_recurrent, arrays, "gru1_recurrent_bias", "gru1_recurrent_subias", "gru1_recurrent_weights_int8","gru1_recurrent_weights_float", "gru1_recurrent_weights_idx", "gru1_recurrent_weights_diag", "gru1_recurrent_scale", 384, 1152)) return 1;
    if (linear_init(&model->gru2_input, arrays, "gru2_input_bias", "gru2_input_subias", "gru2_input_weights_int8","gru2_input_weights_float", "gru2_input_weights_idx", NULL, "gru2_input_scale", 384, 1152)) return 1;
    if (linear_init(&model->gru2_recurrent, arrays, "gru2_recurrent_bias", "gru2_recurrent_subias", "gru2_recurrent_weights_int8","gru2_recurrent_weights_float", "gru2_recurrent_weights_idx", "gru2_recurrent_weights_diag", "gru2_recurrent_scale", 384, 1152)) return 1;
    if (linear_init(&model->gru3_input, arrays, "gru3_input_bias", "gru3_input_subias", "gru3_input_weights_int8","gru3_input_weights_float", "gru3_input_weights_idx", NULL, "gru3_input_scale", 384, 1152)) return 1;
    if (linear_init(&model->gru3_recurrent, arrays, "gru3_recurrent_bias", "gru3_recurrent_subias", "gru3_recurrent_weights_int8","gru3_recurrent_weights_float", "gru3_recurrent_weights_idx", "gru3_recurrent_weights_diag", "gru3_recurrent_scale", 384, 1152)) return 1;
    if (linear_init(&model->dense_out, arrays, "dense_out_bias", NULL, NULL,"dense_out_weights_float", NULL, NULL, NULL, 1536, 32)) return 1;
    if (linear_init(&model->vad_dense, arrays, "vad_dense_bias", NULL, NULL,"vad_dense_weights_float", NULL, NULL, NULL, 1536, 1)) return 1;
    return 0;
}
