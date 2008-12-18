#import <Foundation/Foundation.h>
#import <cairo.h>
#import "BTCairoSurface.h"

@interface BTCairoImageSurface : BTCairoSurface {
	NSMutableData *buffer;
}

- (id)initWithFormat:(cairo_format_t)format width:(int)width height:(int)height;
- (id)initWithData:(NSMutableData *)data ofFormat:(cairo_format_t)format width:(int)width height:(int)height stride:(int)stride;

- (NSData *)getData;
- (cairo_format_t)getFormat;
- (int)getWidth;
- (int)getHeight;
//- (BTCairoSize)getSize;
- (int)getStride;

#ifdef CAIRO_HAS_PNG_FUNCTIONS
- (id)initFromPNGFileAtPath:(NSString *)path;
- (cairo_status_t)writeToPNGAtPath:(NSString *)path;
#endif

@end
