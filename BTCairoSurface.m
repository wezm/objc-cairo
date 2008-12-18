#import "BTCairoSurface.h"

@implementation BTCairoSurface : NSObject

- (id)initWithCairoSurface:(cairo_surface_t *)cairo_surface
{
	if((self = [super init]) != nil)
	{
		surface = cairo_surface;
	}
	
	return self;
}

- (BTCairoSurface *)createSimilarWithContent:(cairo_content_t)content width:(int)width height:(int)height
{
	cairo_surface_t *similar_cairo_surface = cairo_surface_create_similar(surface, content, width, height);
	return [[[[self class] alloc] initWithCairoSurface:similar_cairo_surface] autorelease];
}

- (cairo_status_t)status
{
	return cairo_surface_status(surface);
}

- (void)finish
{
	cairo_surface_finish(surface);
}

- (void)flush
{
	cairo_surface_flush(surface);
}

//- (BTCairoFontOptions *)getFontOptions;

- (cairo_content_t)getContent
{
	return cairo_surface_get_content(surface);
}

- (void)markDirty
{
	cairo_surface_mark_dirty(surface);
}

- (void)markDirtyRectangle:(BTCairoRectangle)rect
{
	cairo_surface_mark_dirty_rectangle(surface, rect.x, rect.y, rect.width, rect.height);
}

- (void)setDeviceOffset:(BTCairoPoint)offset
{
	cairo_surface_set_device_offset(surface, offset.x, offset.y);
}

- (BTCairoPoint)getDeviceOffset;
{
	BTCairoPoint offset;
	cairo_surface_get_device_offset(surface, &(offset.x), &(offset.y));
	return offset;
}

- (void)setFallbackResolution:(BTCairoSize)resolution
{
	cairo_surface_set_fallback_resolution(surface, resolution.x, resolution.y);
}

- (BTCairoSize)getFallbackResolution
{
	BTCairoSize resolution;
	cairo_surface_get_fallback_resolution(surface, &(resolution.x), &(resolution.y));
	return resolution;
}

- (cairo_surface_type_t)getType
{
	return cairo_surface_get_type(surface);
}

/*
- (cairo_status_t)setUserData:(void *)user_data forKey:(const cairo_user_data_key_t *)key
{
	cairo_surface_set_user_data(surface, key, user_data, <#cairo_destroy_func_t destroy#>)
*/

- (void *)getUserDataForKey:(const cairo_user_data_key_t *)key
{
	return cairo_surface_get_user_data(surface, key);
}

- (void)copyPage
{
	cairo_surface_copy_page(surface);
}

- (void)showPage
{
	cairo_surface_show_page(surface);
}

- (BOOL)hasShowTextGlyphs
{
	return cairo_surface_has_show_text_glyphs(surface) ? YES : NO;
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
