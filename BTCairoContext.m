#import "BTCairoContext.h"

@implementation BTCairoContext : NSObject

- (id)initWithTargetSurface:(BTCairoSurface *)surface
{
	if((self = [super init]) != nil)
	{
		context = cairo_create([surface _surface]);
	}

	return self;
}

- (void)save
{
}

- (void)restore
{
}

//- (BTCairoSurface *)getTargetSurface
//- (void)pushGroup
//- (void)pushGroupWithContent:(cairo_content_t)content
- (void)setSourcePattern:(BTCairoPattern *)pattern
{
	cairo_set_source(context, [pattern _pattern]);
}

//- (void)setSourceSurface:(BTCairoSurface *)surface
//- (BTCairoPattern *)getSourcePattern
//- (BTCairoSurface *)getSourceSurface
- (void)setAntiAliasing:(cairo_antialias_t)mode
{
	cairo_set_antialias(context, mode);
}

//- (cairo_antialias_t)getAntiAliasing

- (void)clip
{
	cairo_clip(context);
}

- (void)fill
{
	cairo_fill(context);
}

- (void)maskWithPattern:(BTCairoPattern *)pattern;
{
	cairo_mask(context, [pattern _pattern]);
}

- (void)paint
{
	cairo_paint(context);
}

- (void)stroke
{
	cairo_stroke(context);
}

- (void)showPage
{
	cairo_show_page(context);
}

#pragma mark Paths

- (void)lineTo:(double)x y:(double)y
{
	cairo_line_to(context, x, y);
}

- (void)moveTo:(double)x y:(double)y
{
	cairo_move_to(context, x, y);
}

- (void)rectangle:(double)x y:(double)y width:(double)width height:(double)height
{
	cairo_rectangle(context, x, y, width, height);
}

#pragma mark Private

- (cairo_t *)_context
{
	return context;
}

- (void)dealloc
{
	if(context) cairo_destroy(context);
	[super dealloc];
}

@end
