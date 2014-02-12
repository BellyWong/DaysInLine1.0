//
//  homeView.m
//  DaysInLine
//
//  Created by 张力 on 13-10-20.
//  Copyright (c) 2013年 张力. All rights reserved.
//

#import "homeView.h"

@implementation homeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
   /*     NSArray *vComp = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
        if ( [[vComp objectAtIndex:0] intValue] >= 7){//do this only for ios7+
            CGRect viewFrame = self.frame;
        viewFrame.origin.y = 10;//change this according to ur top bar height.
        viewFrame.size.height = self.frame.size.height-20;
        self.frame = viewFrame;
    }
    */
     //   UIImageView *homeBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundHome"]];
        UIImageView *homeBackground = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        
        homeBackground.image = [UIImage imageNamed:@"backgroundHome"];
                                       
        
        [self addSubview:homeBackground];
        [self sendSubviewToBack:homeBackground];
        
        UIButton *my_todayButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 50, 67, 67)];
       // my_todayButton.backgroundColor = [UIColor brownColor];
        //[my_todayButton setTitle:@"今天" forState:UIControlStateNormal];
        [my_todayButton setImage:[UIImage imageNamed:@"按键1.png"] forState:UIControlStateNormal];
        [my_todayButton setImage:[UIImage imageNamed:@"按键1-2.png"] forState:UIControlStateHighlighted];

        self.todayButton = my_todayButton;
        
        UIButton *my_selectButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 126, 67, 67)];
       // my_selectButton.backgroundColor = [UIColor brownColor];
        //[my_selectButton setTitle:@"查询" forState:UIControlStateNormal];
        [my_selectButton setImage:[UIImage imageNamed:@"按键2.png"] forState:UIControlStateNormal];
        [my_selectButton setImage:[UIImage imageNamed:@"按键2-2.png"] forState:UIControlStateHighlighted];
        self.selectButton = my_selectButton;
        
        UIButton *my_treasureButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 202, 67, 67)];
        //my_treasureButton.backgroundColor = [UIColor brownColor];
        //[my_treasureButton setTitle:@"收藏夹" forState:UIControlStateNormal];
        [my_treasureButton setImage:[UIImage imageNamed:@"按键3.png"] forState:UIControlStateNormal];
        [my_treasureButton setImage:[UIImage imageNamed:@"按键3-2.png"] forState:UIControlStateHighlighted];
        self.treasureButton = my_treasureButton;
     /*
        UIButton *my_achieveButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 260, 84, 45)];
        my_achieveButton.backgroundColor = [UIColor brownColor];
        [my_achieveButton setTitle:@"状态分析" forState:UIControlStateNormal];
        self.achieveButton = my_achieveButton;
      */  
        UIButton *my_analyseButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 278, 67, 67)];
        //my_analyseButton.backgroundColor = [UIColor brownColor];
        //[my_analyseButton setTitle:@"状态分析" forState:UIControlStateNormal];
        [my_analyseButton setImage:[UIImage imageNamed:@"按键4.png"] forState:UIControlStateNormal];
        [my_analyseButton setImage:[UIImage imageNamed:@"按键4-2.png"] forState:UIControlStateHighlighted];
        self.analyseButton = my_analyseButton;
        
        customButton *my_exitButton = [[customButton alloc] initWithFrame:CGRectMake(11, 354, 67, 67)];
        //my_exitButton.backgroundColor = [UIColor brownColor];
        //[my_exitButton setTitle:@"退出" forState:UIControlStateNormal];
        [my_exitButton setImage:[UIImage imageNamed:@"按键5.png"] forState:UIControlStateNormal];
        [my_exitButton setImage:[UIImage imageNamed:@"按键5-2.png"] forState:UIControlStateHighlighted];
        self.exitButton = my_exitButton;
      
        [self addSubview:my_todayButton];
        [self addSubview:my_selectButton];
        [self addSubview:my_treasureButton];
        [self addSubview:my_exitButton];
        [self addSubview:my_analyseButton];
       
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
