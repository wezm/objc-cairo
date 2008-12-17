#import <Foundation/Foundation.h>
#import <cairo.h>

@protocol BTCairoSurface

// Private
- (cairo_surface_t *)_surface;

@end