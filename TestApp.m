#import <Foundation/Foundation.h>
#import "BTCairo.h"

#import <stdlib.h>

int main(int argc, char * const*argv)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	BTCairoImageSurface *surface = [[BTCairoImageSurface	alloc] initWithFormat:CAIRO_FORMAT_ARGB32 width:640 height:480];
	BTCairoContext *cairo = [[BTCairoContext alloc] initWithTargetSurface:surface];
	NSString *path = [[NSString stringWithString:@"~/Desktop/test.png"] stringByExpandingTildeInPath];
	
	[cairo setSourcePattern:[BTCairoPattern patternWithRed:0 green:0 blue:0 alpha:1.0]];
	
	// Fill background
	[cairo rectangle:0 y:0 width:[surface getWidth] height:[surface getHeight]];
	[cairo fill];
	
	[cairo setSourcePattern:[BTCairoPattern patternWithRed:1.0 green:0 blue:0 alpha:0.7]];
	[cairo moveTo:10.0 y:10.0];
	[cairo lineTo:100.0 y:100.0];
	[cairo stroke];
	
	[surface writeToPNGAtPath:path];
	
	[surface release];
	[cairo release];
	
	[pool release];
	return EXIT_SUCCESS;
}