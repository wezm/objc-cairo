#import "BTCairoImageSurface.h"

@implementation BTCairoImageSurface : NSObject

- (id)initWithFormat:(cairo_format_t)format width:(int)width height:(int)height
{
	if((self = [super init]) != nil)
	{
		surface = cairo_image_surface_create(format, width, height);
	}
}

- (cairo_surface_t *)_surface
{
	return surface;
}

- (void)dealloc
{
	if(surface) cairo_surface_destroy(surface);
	[super dealloc];
}

@end