/*
 *  BTCairoGeometry.h
 *  objccairo
 *
 *  Created by Wesley Moore on 19/12/08.
 *  Copyright 2008 __MyCompanyName__. All rights reserved.
 *
 */

typedef struct _bt_cairo_point {
	double x;
	double y;
} BTCairoPoint;

typedef BTCairoPoint BTCairoSize;

typedef struct _bc_cairo_dimensions {
	int width;
	int height;
} BTCairoDimensions;

typedef struct _bt_cairo_rectangle {
	int x;
	int y;
	int width;
	int height;
} BTCairoRectangle;
