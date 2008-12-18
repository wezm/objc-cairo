#import <Foundation/Foundation.h>
#import <cairo.h>

@interface BTCairoSurface : NSObject {
    cairo_surface_t *surface;
}

// Private
- (cairo_surface_t *)_surface;

@end
