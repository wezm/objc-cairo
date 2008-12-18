#import <Foundation/Foundation.h>
#import <cairo.h>
#import "BTCairoSurface.h"
#import "BTCairoPattern.h"

@interface BTCairoContext : NSObject {
	cairo_t *context;
}

- (id)initWithTargetSurface:(BTCairoSurface *)surface;

- (void)save;
- (void)restore;

//- (BTCairoSurface *)getTargetSurface;
//- (void)pushGroup;
//- (void)pushGroupWithContent:(cairo_content_t)content;
- (void)setSourcePattern:(BTCairoPattern *)pattern;
//- (void)setSourceSurface:(BTCairoSurface *)surface;
//- (BTCairoPattern *)getSourcePattern;
//- (BTCairoSurface *)getSourceSurface;
- (void)setAntiAliasing:(cairo_antialias_t)mode;
//- (cairo_antialias_t)getAntiAliasing;

- (void)clip;

- (void)fill;

- (void)maskWithPattern:(BTCairoPattern *)pattern;

- (void)paint;

- (void)stroke;

- (void)showPage;

#pragma mark Paths



#pragma mark Private

// Private
- (cairo_t *)_context;

@end
