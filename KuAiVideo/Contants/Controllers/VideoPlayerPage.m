//
//  VideoPlayerPage.m
//  KuAiVideo
//
//  Created by mengdong on 14-9-21.
//  Copyright (c) 2014年 com.mengdongliuyaming. All rights reserved.
//

#import "VideoPlayerPage.h"

@interface VideoPlayerPage ()


@end

@implementation VideoPlayerPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;

    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}


- (IBAction)praiseButtonSelected:(id)sender {
    NSLog(@"praiseButtonSelected");
}
- (IBAction)shareButtonSelected:(id)sender {
    NSLog(@"shareButtonSelected");

}
- (IBAction)downLoadButtonSelected:(id)sender {
    NSLog(@"downLoadButtonSelected");

}
- (IBAction)collectButtonSelected:(id)sender {
    NSLog(@"collectButtonSelected");

}




- (IBAction)popSuperPage {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
