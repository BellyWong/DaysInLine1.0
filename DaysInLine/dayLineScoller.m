//
//  dayLineScoller.m
//  DaysInLine
//
//  Created by 张力 on 13-10-20.
//  Copyright (c) 2013年 张力. All rights reserved.
//

#import "dayLineScoller.h"
#import "buttonInScroll.h"
#import "ViewController.h"


@interface dayLineScoller ()



@end

@implementation dayLineScoller

const int TIME_LABEL_SPACE  = 30;
const int TIME_LABEL_WIDTH  = 40;
const int TIME_LABEL_HEIGHT = 20;
const int NR_TIME_LABEL = 24;
const int MINUTES_OF_DAY = 24 * 60;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor = [UIColor whiteColor];
        CGSize newSize = CGSizeMake(self.frame.size.width, NR_TIME_LABEL*TIME_LABEL_SPACE);
        [self setContentOffset:CGPointMake(0, 6 * TIME_LABEL_SPACE)]; /* scroller initially stay at 6:00 */
        [self setContentSize:newSize];
        NSLog(@"***************%f",self.frame.size.height);
        
     //   self.btnInScroll = [[buttonInScroll alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 3*self.frame.size.height)];
     //   [self addSubview:self.btnInScroll];


        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor); //设置线的颜色为灰色
    
    CGContextSetLineWidth(context, 1.5f); //设置线的宽度 为1.5个像素
    CGContextMoveToPoint(context, (self.frame.size.width)/2+18, 0);
    CGContextAddLineToPoint(context, (self.frame.size.width)/2+18, 2*self.frame.size.height);
    CGContextStrokePath(context);
    
    for (int i = 0; i <= NR_TIME_LABEL; i++) {
       
/*        UIButton *buttonWorks1 = [[UIButton alloc]initWithFrame:CGRectMake(0, i+10, self.frame.size.width/2, 30)];
        buttonWorks1.backgroundColor = [UIColor blueColor];
        buttonWorks1.layer.borderWidth = 1.0;

        buttonWorks1.layer.borderColor = [UIColor blackColor].CGColor;
        [buttonWorks1 setTitle:@"11111" forState:UIControlStateNormal];
*/
        self.labelTime = [[UILabel alloc] initWithFrame:
                              CGRectMake(0, i*TIME_LABEL_SPACE, TIME_LABEL_WIDTH, TIME_LABEL_HEIGHT)];
        self.labelTime.font = [UIFont systemFontOfSize:14.0];
        self.labelTime.text = [NSString stringWithFormat:@"%02d:00",i % NR_TIME_LABEL];

        [self addSubview:self.labelTime];
//        [self addSubview:buttonWorks1];
    }

 
    
}

#pragma redrawButton delegate

-(void)redrawButton:(NSNumber *)startNum :(NSNumber *)endNum :(NSString *)title :(NSNumber *)eventType :(NSNumber *)oldStartNum
{
    
   //enentType:0为工作事件，1为生活事件 startNum=nil时为删除该事件。
    NSLog(@"drawing begin");
    if (oldStartNum) {
        if ([self.subviews count] > 0) {
            NSLog(@"finding the right button:%d",[oldStartNum intValue]);
            
            for (UIView *curView in self.subviews) {
                NSLog(@"button tag is : %d",curView.tag);
                if (curView.tag == [eventType intValue]*1000+[oldStartNum integerValue]/30) {
                    NSLog(@"find it!!!!");
                    [curView removeFromSuperview];
                    NSLog(@"removed it :%d!!!!",curView.tag);
                }
                
            }
        }
        if (startNum == nil) {
            return;
        }
    }
    
    
    NSLog(@"redraw");
    
    int h = self.contentSize.height;
    double start = ([startNum doubleValue]/MINUTES_OF_DAY) * h + TIME_LABEL_HEIGHT / 2;
    double end = ([endNum doubleValue]/MINUTES_OF_DAY) * h + TIME_LABEL_HEIGHT / 2;
    double height = end - start;
    if (height<15.6) {
        height=15.6;
    }
    
    
    NSLog(@"start:%f,height:%f,longth:%d",start,end-start,h);
  /*
    UIButton *eventButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [eventButton setFrame:CGRectMake(40, start, self.frame.size.width/2-28, height)];
    
    [eventButton setTitle:@"hello world" forState:UIControlStateNormal];
    [eventButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    eventButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
   */
 
    NSLog(@"in draw the typ is : %@",eventType);
    UIButton *eventButton;
    if ([eventType intValue] == 0) {
         eventButton = [[UIButton alloc] initWithFrame:CGRectMake(40, start, (self.frame.size.width)/2-32, height)];
    }
    else if ([eventType intValue] == 1) {
        eventButton = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width)/2+25, start, (self.frame.size.width)/2-32, height)];
    }
   
    eventButton.tag =[eventType intValue]*1000 + [startNum intValue]/30;
    // 设置圆角半径
    eventButton.layer.masksToBounds = YES;
    eventButton.layer.cornerRadius = 1.0;
    
    eventButton.backgroundColor = [UIColor clearColor];
    eventButton.layer.borderWidth = 1.0;
    
    
    [eventButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    eventButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    eventButton.layer.borderColor = [UIColor blackColor].CGColor;
    [eventButton setTitle:title forState:UIControlStateNormal];
    
    [eventButton addTarget:self action:@selector(eventModify:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:eventButton];
     NSLog(@"redraw000");
      
}

-(void)eventModify:(UIButton *)sender
{
    

    [self.modifyEvent_delegate modifyEvent:[[NSNumber alloc] initWithInteger:sender.tag]];
    
    
    
}

@end
