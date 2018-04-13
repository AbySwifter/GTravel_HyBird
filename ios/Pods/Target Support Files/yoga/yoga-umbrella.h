#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Yoga.h"
#import "YGEnums.h"
#import "YGMacros.h"

FOUNDATION_EXPORT double yogaVersionNumber;
FOUNDATION_EXPORT const unsigned char yogaVersionString[];

