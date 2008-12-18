include $(GNUSTEP_MAKEFILES)/common.make

LIBRARY_NAME = libobjccairo
ADDITIONAL_OBJCFLAGS += -std=c99

#libobjccairo_HEADER_FILES

libobjccairo_INCLUDE_DIRS = -I/include/cairo -I/opt/local/include/cairo

libobjccairo_OBJC_FILES = BTCairoContext.m \
						  BTCairoImageSurface.m

include $(GNUSTEP_MAKEFILES)/library.make

