#import <Foundation/Foundation.h>
#import <cairo.h>
#import "BTCairoGeometry.h"

@interface BTCairoSurface : NSObject {
    cairo_surface_t *surface;
}

- (id)initWithCairoSurface:(cairo_surface_t *)cairo_surface;
- (BTCairoSurface *)createSimilarWithContent:(cairo_content_t)content width:(int)width height:(int)height;
- (cairo_status_t)status;
- (void)finish;
- (void)flush;
//- (BTCairoFontOptions *)getFontOptions;
- (cairo_content_t)getContent;
- (void)markDirty;
- (void)markDirtyRectangle:(BTCairoRectangle)rect;
- (void)setDeviceOffset:(BTCairoPoint)offset;
- (BTCairoPoint)getDeviceOffset;
- (void)setFallbackResolution:(BTCairoPoint)resolution;
- (BTCairoPoint)getFallbackResolution;
- (cairo_surface_type_t)getType;
//- (cairo_status_t)setUserData:(void *)user_data forKey:(cairo_user_data_key_t *)key;
- (void *)getUserDataForKey:(const cairo_user_data_key_t *)key;
- (void)copyPage;
- (void)showPage;
- (BOOL)hasShowTextGlyphs;

// Private
- (cairo_surface_t *)_surface;

@end
