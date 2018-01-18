#line 1 "/Volumes/Macintosh HD/Users/zhuyongqing/workspace/zhu/LiveTrivia/LiveTriviaDylib/LiveTriviaDylib.xm"


#import <UIKit/UIKit.h>

#define kHeight [UIScreen mainScreen].bounds.size.height
#define kWidth [UIScreen mainScreen].bounds.size.width


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class _TtC10LiveTrivia18LiveViewController; @class ClassName; 
static id (*_logos_meta_orig$_ungrouped$ClassName$sharedInstance)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$ClassName$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$)(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments)(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_TtC10LiveTrivia18LiveViewController$moveWebAction$(_LOGOS_SELF_TYPE_NORMAL _TtC10LiveTrivia18LiveViewController* _LOGOS_SELF_CONST, SEL, UIButton *); 

#line 8 "/Volumes/Macintosh HD/Users/zhuyongqing/workspace/zhu/LiveTrivia/LiveTriviaDylib/LiveTriviaDylib.xm"



static id _logos_meta_method$_ungrouped$ClassName$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	HBLogDebug(@"+[<ClassName: %p> sharedInstance]", self);

	return _logos_meta_orig$_ungrouped$ClassName$sharedInstance(self, _cmd);
}


static void _logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id originalArgument) {
	HBLogDebug(@"-[<ClassName: %p> messageWithNoReturnAndOneArgument:%@]", self, originalArgument);

	_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$(self, _cmd, originalArgument);
	
	
}


static id _logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments(_LOGOS_SELF_TYPE_NORMAL ClassName* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	HBLogDebug(@"-[<ClassName: %p> messageWithReturnAndNoArguments]", self);

	id originalReturnOfMessage = _logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments(self, _cmd);
	
	

	return originalReturnOfMessage;
}






static void _logos_method$_ungrouped$_TtC10LiveTrivia18LiveViewController$moveWebAction$(_LOGOS_SELF_TYPE_NORMAL _TtC10LiveTrivia18LiveViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * btn){
    NSLog(@"%@",btn.superview);
    UIWebView *web = btn.superview;
    CGFloat top = 150;
    CGFloat offsetY = 80;
    if (CGRectGetMinY(web.frame) == 150) {
        [UIView animateWithDuration:.3 animations:^{
            CGRect newFrame = CGRectMake(0, kHeight/2 + offsetY, kWidth, kHeight/2 - offsetY);
            web.frame = newFrame;
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:.3 animations:^{
            CGRect newFrame = CGRectMake(0, top, kWidth, kHeight - top);
            web.frame = newFrame;
        } completion:^(BOOL finished) {
            
        }];
    }
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ClassName = objc_getClass("ClassName"); Class _logos_metaclass$_ungrouped$ClassName = object_getClass(_logos_class$_ungrouped$ClassName); MSHookMessageEx(_logos_metaclass$_ungrouped$ClassName, @selector(sharedInstance), (IMP)&_logos_meta_method$_ungrouped$ClassName$sharedInstance, (IMP*)&_logos_meta_orig$_ungrouped$ClassName$sharedInstance);MSHookMessageEx(_logos_class$_ungrouped$ClassName, @selector(messageWithNoReturnAndOneArgument:), (IMP)&_logos_method$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$, (IMP*)&_logos_orig$_ungrouped$ClassName$messageWithNoReturnAndOneArgument$);MSHookMessageEx(_logos_class$_ungrouped$ClassName, @selector(messageWithReturnAndNoArguments), (IMP)&_logos_method$_ungrouped$ClassName$messageWithReturnAndNoArguments, (IMP*)&_logos_orig$_ungrouped$ClassName$messageWithReturnAndNoArguments);Class _logos_class$_ungrouped$_TtC10LiveTrivia18LiveViewController = objc_getClass("_TtC10LiveTrivia18LiveViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_TtC10LiveTrivia18LiveViewController, @selector(moveWebAction:), (IMP)&_logos_method$_ungrouped$_TtC10LiveTrivia18LiveViewController$moveWebAction$, _typeEncoding); }} }
#line 65 "/Volumes/Macintosh HD/Users/zhuyongqing/workspace/zhu/LiveTrivia/LiveTriviaDylib/LiveTriviaDylib.xm"
