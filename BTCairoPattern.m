//
//  BTCairoPattern.m
//  objccairo
//
//  Created by Wesley Moore on 19/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "BTCairoPattern.h"

@implementation BTCairoPattern

+ (id)patternWithRed:(double)red green:(double)green blue:(double)blue
{
	return [BTCairoPattern patternWithRed:red green:green blue:blue alpha:1.0];
}

+ (id)patternWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha
{
	return [[[BTCairoPattern alloc] initWithRed:red green:green blue:blue alpha:alpha] autorelease];
}

- (id)initWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha
{
	cairo_pattern_t *cairo_pattern = cairo_pattern_create_rgba(red, green, blue, alpha);
	return [self initWithCairoPattern:cairo_pattern];
}

- (id)initWithCairoPattern:(cairo_pattern_t *)cairo_pattern
{
	if((self = [super init]) != nil)
	{
		pattern = cairo_pattern;
	}
	
	return self;
}

- (cairo_pattern_t *)_pattern
{
	return pattern;
}

- (void)dealloc
{
	if(pattern) cairo_pattern_destroy(pattern);
	[super dealloc];
}

@end
