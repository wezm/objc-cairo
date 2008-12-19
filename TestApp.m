#import <Foundation/Foundation.h>
#import "BTCairo.h"

#import <stdlib.h>

int main(int argc, char * const*argv)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	BTCairoImageSurface *surface = [[BTCairoImageSurface	alloc] initWithFormat:CAIRO_FORMAT_ARGB32 width:640 height:480];
	BTCairoContext *cairo = [[BTCairoContext alloc] initWithTargetSurface:surface];
	NSString *path = [[NSString stringWithString:@"~/Desktop/test.png"] stringByExpandingTildeInPath];
	
	[cairo setSourceRed:0 green:0 blue:0];
	
	// Fill background
	[cairo rectangle:0 y:0 width:[surface getWidth] height:[surface getHeight]];
	[cairo fill];
	
	[cairo setSourceRed:1.0 green:0 blue:0 alpha:0.7];
	[cairo moveTo:10.0 y:10.0];
	[cairo lineTo:200.0 y:100.0];
	[cairo lineTo:300.0 y:150.0];
	[cairo lineTo:100.0 y:400.0];
	[cairo lineTo:20.0 y:100.0];
	[cairo closePath];
	[cairo fill];
	
	[surface writeToPNGAtPath:path];
	
	[surface release];
	[cairo release];
	
	[pool release];
	return EXIT_SUCCESS;
}