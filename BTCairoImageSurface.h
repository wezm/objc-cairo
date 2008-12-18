#import <Foundation/Foundation.h>
#import <cairo.h>
#import "BTCairoSurface.h"

@interface BTCairoImageSurface : BTCairoSurface

- (id)initWithFormat:(cairo_format_t)format width:(int)width height:(int)height;

@end
