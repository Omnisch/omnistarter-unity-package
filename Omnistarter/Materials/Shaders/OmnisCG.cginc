#ifndef OmnisCG
#define OmnisCG

#include "UnityCG.cginc"

float4 ApplyGaussianKernel(sampler2D tex, float2 uv, float depth)
{
    float4 sum = float4(0, 0, 0, 0);

    sum += tex2D(tex, float2(uv.x - 5 * depth, uv.y + 3.0 * depth)) * 0.025;
    sum += tex2D(tex, float2(uv.x + 5 * depth, uv.y - 3.0 * depth)) * 0.025;
    sum += tex2D(tex, float2(uv.x - 4 * depth, uv.y + 2.5 * depth)) * 0.05;
    sum += tex2D(tex, float2(uv.x + 4 * depth, uv.y - 2.5 * depth)) * 0.05;
    sum += tex2D(tex, float2(uv.x - 3 * depth, uv.y + 2.0 * depth)) * 0.09;
    sum += tex2D(tex, float2(uv.x + 3 * depth, uv.y - 2.0 * depth)) * 0.09;
    sum += tex2D(tex, float2(uv.x - 2 * depth, uv.y + 1.5 * depth)) * 0.12;
    sum += tex2D(tex, float2(uv.x + 2 * depth, uv.y - 1.5 * depth)) * 0.12;
    sum += tex2D(tex, float2(uv.x - 1 * depth, uv.y + 1.0 * depth)) * 0.15;
    sum += tex2D(tex, float2(uv.x + 1 * depth, uv.y - 1.0 * depth)) * 0.15;

    sum += tex2D(tex, uv - 3.0 * depth) * 0.025;
    sum += tex2D(tex, uv - 2.5 * depth) * 0.05;
    sum += tex2D(tex, uv - 2.0 * depth) * 0.09;
    sum += tex2D(tex, uv - 1.5 * depth) * 0.12;
    sum += tex2D(tex, uv - 1.0 * depth) * 0.15;
    sum += tex2D(tex, uv) * 0.16;
    sum += tex2D(tex, uv + 3.0 * depth) * 0.15;
    sum += tex2D(tex, uv + 2.5 * depth) * 0.12;
    sum += tex2D(tex, uv + 2.0 * depth) * 0.09;
    sum += tex2D(tex, uv + 1.5 * depth) * 0.05;
    sum += tex2D(tex, uv + 1.0 * depth) * 0.025;

    return sum / 2;
}

#endif