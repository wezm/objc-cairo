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
