#import "BTCairoSurface.h"

@implementation BTCairoSurface : NSObject

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
