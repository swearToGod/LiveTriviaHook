// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

#define kHeight [UIScreen mainScreen].bounds.size.height
#define kWidth [UIScreen mainScreen].bounds.size.width

%hook ClassName

+ (id)sharedInstance
{
	%log;

	return %orig;
}

- (void)messageWithNoReturnAndOneArgument:(id)originalArgument
{
	%log;

	%orig(originalArgument);
	
	// or, for exmaple, you could use a custom value instead of the original argument: %orig(customValue);
}

- (id)messageWithReturnAndNoArguments
{
	%log;

	id originalReturnOfMessage = %orig;
	
	// for example, you could modify the original return value before returning it: [SomeOtherClass doSomethingToThisObject:originalReturnOfMessage];

	return originalReturnOfMessage;
}

%end


%hook _TtC10LiveTrivia18LiveViewController

%new
- (void)moveWebAction:(UIButton *)btn{
    NSLog(@"%@",btn.superview);
    UIWebView *web = btn.superview;
    CGFloat top = 150;
    CGFloat offsetY = 80;
    CGFloat originY = CGRectGetMinY(web.frame) == top?(kHeight/2 + offsetY):top;
    CGFloat webHeight = CGRectGetMinY(web.frame) == top?(kHeight - top):(kHeight/2 - offsetY);
    [UIView animateWithDuration:.3 animations:^{
        CGRect newFrame = CGRectMake(0, offsetY, kWidth, webHeight);
        web.frame = newFrame;
    } completion:^(BOOL finished) {
        
    }];
}


