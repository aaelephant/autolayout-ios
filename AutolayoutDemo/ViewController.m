//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by sqb on 15/12/28.
//  Copyright © 2015年 sqp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIView *subView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self addSubView];
    [self updateXIBViewCons];
}

//xib已有控件，要去更新约束
-(void)updateXIBViewCons
{
    self.subView.backgroundColor = [UIColor redColor];
    self.subView.translatesAutoresizingMaskIntoConstraints = NO;
    //    [self.view addSubview:view];
    NSArray * cons = self.view.constraints;
    for (NSLayoutConstraint* constraint in cons) {
        if (constraint.firstItem == self.subView) {
            NSLog(@"%ld",(long)constraint.firstAttribute);
            //据底部0
            if (constraint.firstAttribute == NSLayoutAttributeTop) {
                constraint.constant = 400.0;
                
            }
        }
    }
}

//代码创建的控件，添加约束
-(void)addSubView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view];
    // NSLayoutConstraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0
                                                           constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
