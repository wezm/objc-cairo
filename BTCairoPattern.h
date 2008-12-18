//
//  BTCairoPattern.h
//  objccairo
//
//  Created by Wesley Moore on 19/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <cairo.h>

@interface BTCairoPattern : NSObject {
	cairo_pattern_t *pattern;
}

+ (id)patternWithRed:(double)red green:(double)green blue:(double)blue;
+ (id)patternWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha;
- (id)initWithRed:(double)red green:(double)green blue:(double)blue alpha:(double)alpha;

// should be private
- (id)initWithCairoPattern:(cairo_pattern_t *)cairo_pattern;
- (cairo_pattern_t *)_pattern;

@end
