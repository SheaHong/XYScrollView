//
//  XYScrollView.h
//  XYScrollView
//
//  Created by etom on 16/8/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYScrollView : UIScrollView <UIScrollViewDelegate>

@property(nonatomic, strong)NSArray *imgArr;
@property(nonatomic, assign)double timerInv;
@property(nonatomic, assign)double restartTimeInv;
@property(nonatomic, retain)NSTimer *myTimer;
@property(nonatomic, assign)CGRect myFrame;

- (id)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imgArr TimerInv:(double)timerInv RestartTimerInv:(double)restartTimeInv;

@end
