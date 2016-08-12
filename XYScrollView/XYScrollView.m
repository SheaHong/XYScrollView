//
//  XYScrollView.m
//  XYScrollView
//
//  Created by etom on 16/8/12.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "XYScrollView.h"

@implementation XYScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imgArr TimerInv:(double)timerInv RestartTimerInv:(double)restartTimeInv
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _myFrame = frame;
        _imgArr = [NSArray arrayWithArray:imgArr];
        _timerInv = timerInv;
        _restartTimeInv = restartTimeInv;
        
        self.contentSize = CGSizeMake(frame.size.width * (imgArr.count + 2), frame.size.height);
        self.delegate = self;
        self.pagingEnabled = YES;
        
        //31231
        
        for (int i = 0; i < imgArr.count + 2 ; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(frame.size.width *  i, 0, frame.size.width, frame.size.height);
            
            if (i == 1 || i == imgArr.count + 1) {
                [button setBackgroundImage:_imgArr[0] forState:UIControlStateNormal];
            }
            else if (i == 0 || i == imgArr.count) {
                [button setBackgroundImage:_imgArr.lastObject forState:UIControlStateNormal];
            }
            else
                [button setBackgroundImage:_imgArr[i - 1] forState:UIControlStateNormal];
            [self addSubview:button];
        }
        self.contentOffset = CGPointMake(_myFrame.size.width, 0);
        _myTimer = [NSTimer timerWithTimeInterval:_timerInv target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_myTimer forMode:NSDefaultRunLoopMode];
    }
    return  self;
}

- (void)onTimer {
    
    CGPoint currentOffset = self.contentOffset;
    [self setContentOffset:CGPointMake(currentOffset.x + _myFrame.size.width, 0) animated:YES];

    if (self.contentOffset.x == (_imgArr.count + 1 )* _myFrame.size.width) {
        self.contentOffset = CGPointMake(_myFrame.size.width, 0);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_myTimer setFireDate:[NSDate distantFuture]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [_myTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:_restartTimeInv]];
    if (self.contentOffset.x == (_imgArr.count + 1) * _myFrame.size.width) {
        self.contentOffset = CGPointMake(_myFrame.size.width, 0);
    }
    else if(self.contentOffset.x == 0) {
        self.contentOffset = CGPointMake(_imgArr.count * _myFrame.size.width, 0);
    }
}











@end
