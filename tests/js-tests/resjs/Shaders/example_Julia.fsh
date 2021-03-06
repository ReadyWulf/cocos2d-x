// Shader from http://www.iquilezles.org/apps/shadertoy/

#ifdef GL_ES
precision highp float;
#endif

uniform vec2 center;
uniform vec2 resolution;

void main(void)
{
		float time = CC_Time[1];
    vec2 p = 2.0 * (gl_FragCoord.xy - center.xy) / resolution.xy;
    vec2 cc = vec2( cos(.25*time), sin(.25*time*1.423) );

    float dmin = 1000.0;
    vec2 z  = p*vec2(1.33,1.0);
    for( int i=0; i<64; i++ )
    {
        z = cc + vec2( z.x*z.x - z.y*z.y, 2.0*z.x*z.y );
        float m2 = dot(z,z);
        if( m2>100.0 ) break;
        dmin=min(dmin,m2);
        }

    float color = sqrt(sqrt(dmin))*0.7;
    gl_FragColor = vec4(color,color,color,1.0);
}

