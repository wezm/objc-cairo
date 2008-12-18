#import "BTCairoImageSurface.h"

@implementation BTCairoImageSurface : BTCairoSurface

- (id)initWithFormat:(cairo_format_t)format width:(int)width height:(int)height
{
	if((self = [super init]) != nil)
	{
		surface = cairo_image_surface_create(format, width, height);
	}

        return self;
}

@end
