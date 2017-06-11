//
//  WriteView.m
//  可以直接用的类库
//
//  Created by namibank on 16/4/8.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "WriteView.h"

@implementation WriteView
{
    UIBezierPath *_bezierPath;      //贝塞尔曲线
}

//
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 20, 100, 30);
    btn.tag = 100;
    [btn setTitle:@"清除" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    //实例化一个贝塞尔路径
    _bezierPath = [UIBezierPath bezierPath];
}

- (void)btnClick {
    //把所有的点清除
    [_bezierPath removeAllPoints];
    //重新渲染self视图
    [self setNeedsDisplay];
}

//手指 在屏幕上移动
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取触摸
    UITouch *myTouch = [touches anyObject];
    //触摸的点
    CGPoint point = [myTouch locationInView:self];
    //把路径上的前一个点和当前点进行连线
    [_bezierPath moveToPoint:point];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取触摸
    UITouch *myTouch = [touches anyObject];
    //触摸的点
    CGPoint point = [myTouch locationInView:self];
    //把路径上的前一个点和当前点进行连线
    [_bezierPath addLineToPoint:point];
    //根据描述的路径 重新绘图(重新渲染)
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"");
    
    //设置线条宽度
    _bezierPath.lineWidth = 1;
    //设置颜色
    [[UIColor cyanColor] set];      //设置了线条的颜色和填充颜色
    
    //告知系统  进行沿着绘图路径进行绘图
    [_bezierPath stroke];
}

@end
