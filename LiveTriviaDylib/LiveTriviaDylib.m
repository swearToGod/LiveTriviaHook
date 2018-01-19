//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  LiveTriviaDylib.m
//  LiveTriviaDylib
//
//  Created by zhuyongqing on 2018/1/15.
//  Copyright (c) 2018年 zhuyongqing. All rights reserved.
//

#import "LiveTriviaDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>

#define kHeight [UIScreen mainScreen].bounds.size.height
#define kWidth [UIScreen mainScreen].bounds.size.width

static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        CYListenServer(6666);
    }];
}

CHDeclareClass(_TtC10LiveTrivia18HomeViewController)
CHOptimizedMethod(0, self,void,_TtC10LiveTrivia18HomeViewController,viewDidLoad){
    
    CHSuper(0, _TtC10LiveTrivia18HomeViewController,viewDidLoad);
    
//    UIWindow *win = [UIApplication sharedApplication].keyWindow;
//    UIView *view = CHIvar(self, _view, __strong UIView *);
//    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(view.frame)/2 + 80, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame)/2 - 80)];
//    web.layer.cornerRadius = 4;
//    web.layer.masksToBounds = YES;
//    [view addSubview:web];
//    objc_setAssociatedObject(self, @"searchWeb", web, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//
//    UIButton *moveWeb = [UIButton buttonWithType:UIButtonTypeSystem];
//    [moveWeb setTitle:@"Move" forState:UIControlStateNormal];
//    [moveWeb addTarget:self action:@selector(moveWebAction) forControlEvents:UIControlEventTouchUpInside];
//    [moveWeb setFrame:CGRectMake(0, 0, CGRectGetWidth(web.frame), 45)];
//    moveWeb.backgroundColor = [UIColor whiteColor];
//    [web addSubview:moveWeb];

}

CHDeclareClass(_TtC10LiveTrivia18LiveViewController)

void moveWebAction(id self,SEL _cmd,UIButton *btn){
    NSLog(@"%@",btn.superview);
    UIWebView *web = btn.superview;
    CGFloat top = 150;
    CGFloat offsetY = 80;
    CGFloat originY = CGRectGetMinY(web.frame) == top? (kHeight/2 + offsetY) : top;
    [UIView animateWithDuration:.3 animations:^{
        CGRect newFrame = CGRectMake(0, originY, kWidth, kHeight - originY);
        web.frame = newFrame;
    } completion:^(BOOL finished) {
        
    }];
}

CHOptimizedMethod(0, self,void,_TtC10LiveTrivia18LiveViewController,viewDidLoad){
    CHSuper(0, _TtC10LiveTrivia18LiveViewController,viewDidLoad);
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    UIView *view = CHIvar(self, _view, __strong UIView *);
    CGFloat offsetY = 80;
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, kHeight/2 + offsetY, kWidth, kHeight/2 - offsetY)];
    web.layer.cornerRadius = 4;
    web.layer.masksToBounds = YES;
    [win addSubview:web];
    objc_setAssociatedObject(self, @"searchWeb", web, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    Class cls = NSClassFromString(@"_TtC10LiveTrivia18LiveViewController");
    class_addMethod(cls, @selector(moveWebAction:), (IMP)moveWebAction, "v@:@");
    
    UIButton *moveWeb = [UIButton buttonWithType:UIButtonTypeSystem];
    [moveWeb setTitle:@"Move" forState:UIControlStateNormal];
    [moveWeb addTarget:self action:@selector(moveWebAction:) forControlEvents:UIControlEventTouchUpInside];
    [moveWeb setFrame:CGRectMake(0, 0, CGRectGetWidth(web.frame), 45)];
    moveWeb.backgroundColor = [UIColor whiteColor];
    [web addSubview:moveWeb];
   
    NSLog(@"%@",view.subviews[1].subviews[1]);
    
    UIView *questionView = view.subviews[1].subviews[1];
     [questionView addObserver:self forKeyPath:@"alpha" options:NSKeyValueObservingOptionNew context:nil];
    
    UILabel *qaLabel = questionView.subviews[3].subviews.firstObject;
    UIButton *option1 = questionView.subviews[5].subviews[0];
    UIButton *option2 = questionView.subviews[5].subviews[1];
    UIButton *option3 = questionView.subviews[5].subviews[2];
    
    objc_setAssociatedObject(self, @"qaLabel", qaLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @"opation1", option1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @"opation2", option2, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @"opation3", option3, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    NSLog(@"%@--%@---%@---%@",qaLabel,option1,option2,option3);
    /*
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"2 -------- %@",obj);
            Class class = NSClassFromString(@"_TtC10LiveTrivia16LiveQuestionView");
            if([obj isKindOfClass:class]){
                NSLog(@"questionView ------ %@",obj);
                [obj addObserver:self forKeyPath:@"alpha" options:NSKeyValueObservingOptionNew context:nil];
                [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            NSLog(@"5 ----------- %@",obj);
                            [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                NSLog(@"6 ------ %@",obj);
                            }];
                        }];
                    }];
                }];
            }
            
        }];
    }];
     */
}


CHOptimizedMethod(4, self,void,_TtC10LiveTrivia18LiveViewController,observeValueForKeyPath,NSString *,keyPath,ofObject,id,object,change,NSDictionary*,change,context,void *,context){
    NSLog(@"%@,%@",change,keyPath);
    
    if ([change[@"new"] intValue] != 1) {
        return;
    }
    
    NSString *questionStr = nil;
    
    UILabel *qaLabel = objc_getAssociatedObject(self, @"qaLabel");
    UIButton *option1 = objc_getAssociatedObject(self, @"opation1");
    UIButton *option2 = objc_getAssociatedObject(self, @"opation2");
    UIButton *option3 = objc_getAssociatedObject(self, @"opation3");

    questionStr = [NSString stringWithFormat:@"%@ %@ %@ %@",qaLabel.text,option1.titleLabel.text,option2.titleLabel.text,option3.titleLabel.text];
    
    NSString *wd = [questionStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.baidu.com/s?wd=%@",wd]];
    UIWebView *web = objc_getAssociatedObject(self, @"searchWeb");
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    NSLog(@"%@",questionStr);
    
    /*
    UIView *view = CHIvar(self, _view, __strong UIView *);
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //            NSLog(@"2 -------- %@",obj);
            Class class = NSClassFromString(@"_TtC10LiveTrivia16LiveQuestionView");
            if([obj isKindOfClass:class]){
                NSLog(@"questionView ------ %@",obj);
                [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSLog(@"3 ------- %@",obj);
                    [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        NSLog(@"4 ------ %@",obj);
                        if ([obj isKindOfClass:[UILabel class]] && CGRectEqualToRect(obj.frame, CGRectMake(0, 0, 305,186))) {
                            //问题
                            UILabel *label = (UILabel *)obj;
//                            questionStr = [questionStr stringByAppendingString:label.text];
                        }
                        [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            NSLog(@"5 ----- %@",obj);
                            [obj.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                //选项
                                NSLog(@"6 ----- %@",obj);
                                if ([view isKindOfClass:NSClassFromString(@"UIButtonLabel")]) {
                                    UILabel *qa = (UILabel *)view;
                                    NSLog(@"qa -------- %@",qa);
//                                    questionStr = [questionStr stringByAppendingString:qa.text];
                                }
                            }];
                        }];
                    }];
                }];
            }
        }];
    }];
    
   */
}


CHConstructor{
    
    CHLoadLateClass(_TtC10LiveTrivia18LiveViewController);
    CHHook(0, _TtC10LiveTrivia18LiveViewController,viewDidLoad);
    CHHook(4,_TtC10LiveTrivia18LiveViewController,observeValueForKeyPath,ofObject,change,context);
    
    CHLoadLateClass(_TtC10LiveTrivia18HomeViewController);
    CHHook(0, _TtC10LiveTrivia18HomeViewController,viewDidLoad);
    
    
}



