#import "BTCairoImageSurface.h"

@implementation BTCairoImageSurface : BTCairoSurface

- (id)initWithFormat:(cairo_format_t)format width:(int)width height:(int)height
{
	cairo_surface_t *cairo_surface = cairo_image_surface_create(format, width, height);
	return [self initWithCairoSurface:cairo_surface];
}

@end
