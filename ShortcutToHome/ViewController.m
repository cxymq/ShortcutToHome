//
//  ViewController.m
//  ShortcutToHome
//
//  Created by wq on 2017/12/6.
//  Copyright © 2017年 mikey. All rights reserved.
//

#import "ViewController.h"
#import "DLAddToDesktopHandler.h"
#import "UIImage+DLDataURIImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"创建快捷方式" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(50, 50, 200, 60)];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(buildShortcut:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buildShortcut:(id)sender {
    DLAddToDesktopHandler *handler = [DLAddToDesktopHandler sharedInsance];
    NSString *imageString = [[UIImage imageNamed:@"shortcut"] dataURISchemeImage];
    NSString *url = [NSString stringWithFormat:@"shortcuttohome://com.mq?user=%@&pwd=%@",@"mq",@"123"];
    [handler addToDesktopWithDataURISchemeImage:imageString
                                          title:@"Shortcut"
                                      urlScheme:@"shortcuttohome://"
                                 appDownloadUrl:url];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
