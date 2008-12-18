#import "BTCairoImageSurface.h"

@implementation BTCairoImageSurface : BTCairoSurface

- (id)initWithFormat:(cairo_format_t)format width:(int)width height:(int)height
{
	cairo_surface_t *cairo_surface = cairo_image_surface_create(format, width, height);
	return [self initWithCairoSurface:cairo_surface];
}

- (id)initWithData:(NSMutableData *)data ofFormat:(cairo_format_t)format width:(int)width height:(int)height stride:(int)stride
{
	buffer = [data retain];
	cairo_surface_t *cairo_surface = cairo_image_surface_create_for_data([buffer mutableBytes], format, width, height, stride);
	return [self initWithCairoSurface:cairo_surface];
}

- (NSData *)getData
{
	if(buffer)
	{
		return buffer;
	}
	else
	{
		NSData *data;
		unsigned int length = [self getStride] * [self getHeight];
		void *raw_data = cairo_image_surface_get_data(surface);
		
		// get_data can return NULL if finish has been called
		if(raw_data != NULL)
		{
			data = [[NSData alloc] initWithBytesNoCopy:raw_data length:length freeWhenDone:NO];
			return [data autorelease];
		}
	}
	
	return NULL;
}

- (cairo_format_t)getFormat
{
	return cairo_image_surface_get_format(surface);
}

- (int)getWidth
{
	return cairo_image_surface_get_width(surface);
}

- (int)getHeight
{
	return cairo_image_surface_get_height(surface);
}

/*
- (BTCairoSize)getSize
{
	return cairo_image_surface_get_format(surface);
}
*/

- (int)getStride
{
	return cairo_image_surface_get_stride(surface);
}

#ifdef CAIRO_HAS_PNG_FUNCTIONS

- (id)initFromPNGFileAtPath:(NSString *)path
{
	cairo_surface_t *cairo_surface = cairo_image_surface_create_from_png([path UTF8String]);
	return [self initWithCairoSurface:cairo_surface];
}

- (cairo_status_t)writeToPNGAtPath:(NSString *)path
{
	return cairo_surface_write_to_png(surface, [path UTF8String]);
}

#endif

- (void)dealloc
{
	// Have to destroy surface before the buffer, set to NULL to prevent
	// double release in super class
	cairo_surface_destroy(surface);
	surface = NULL;
	if(buffer) [buffer release];
	[super dealloc];
}

@end
