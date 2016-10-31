//
//  ViewController.m
//  POPLearn
//
//  Created by 郑晓龙 on 2016/10/31.
//  Copyright © 2016年 郑晓龙. All rights reserved.
//

#import "ViewController.h"
#import <POP/POP.h>

@interface ViewController ()

@property (strong, nonatomic) UIView *zzview;


@property (strong, nonatomic) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 30)];
    _btn.backgroundColor = [UIColor blueColor];
    [_btn setTitle:@"点击" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _zzview = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    _zzview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_zzview];
    
}


-(void)tapBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    // 1. Pick a Kind Of Animation //  POPBasicAnimation  POPSpringAnimation POPDecayAnimation
    POPSpringAnimation *basicAnimation = [POPSpringAnimation animation];
    
    if (sender.selected) {
        // 2. Decide weather you will animate a view property or layer property, Lets pick a View Property and pick kPOPViewFrame
        // View Properties - kPOPViewAlpha kPOPViewBackgroundColor kPOPViewBounds kPOPViewCenter kPOPViewFrame kPOPViewScaleXY kPOPViewSize
        // Layer Properties - kPOPLayerBackgroundColor kPOPLayerBounds kPOPLayerScaleXY kPOPLayerSize kPOPLayerOpacity kPOPLayerPosition kPOPLayerPositionX kPOPLayerPositionY kPOPLayerRotation kPOPLayerBackgroundColor
        basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
        
        // 3. Figure Out which of 3 ways to set toValue
        //  anim.toValue = @(1.0);
        //  anim.toValue =  [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)];
        //  anim.toValue =  [NSValue valueWithCGSize:CGSizeMake(40, 40)];
        basicAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(20, 100, 200, 200)];
        
    }else{
        // 2. Decide weather you will animate a view property or layer property, Lets pick a View Property and pick kPOPViewFrame
        // View Properties - kPOPViewAlpha kPOPViewBackgroundColor kPOPViewBounds kPOPViewCenter kPOPViewFrame kPOPViewScaleXY kPOPViewSize
        // Layer Properties - kPOPLayerBackgroundColor kPOPLayerBounds kPOPLayerScaleXY kPOPLayerSize kPOPLayerOpacity kPOPLayerPosition kPOPLayerPositionX kPOPLayerPositionY kPOPLayerRotation kPOPLayerBackgroundColor
        basicAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
        
        // 3. Figure Out which of 3 ways to set toValue
        //  anim.toValue = @(1.0);
        //  anim.toValue =  [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)];
        //  anim.toValue =  [NSValue valueWithCGSize:CGSizeMake(40, 40)];
        basicAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(0, 300, 100, 100)];
        
    }
    // 4. Create Name For Animation & Set Delegate
    basicAnimation.name=@"AnyAnimationNameYouWant";
    basicAnimation.delegate=self;
    
    // 5. Add animation to View or Layer, we picked View so self.tableView and not layer which would have been self.tableView.layer
    [self.zzview pop_addAnimation:basicAnimation forKey:@"WhatEverNameYouWant"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
