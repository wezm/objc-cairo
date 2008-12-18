#import <Foundation/Foundation.h>
#import <cairo.h>
#import "BTCairoSurface.h"

@interface BTCairoContext : NSObject {
	cairo_t *context;
}

- (id)initWithSurface:(BTCairoSurface *)surface;

// Private
- (cairo_t *)_context;

@end
