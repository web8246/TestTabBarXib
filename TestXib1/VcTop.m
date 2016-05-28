//
//  VcTop.m
//  TestXib1
//
//  Created by dean on 2016/5/28.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "VcTop.h"
#import "Vc2.h"

@interface VcTop ()<UITabBarDelegate>
{
    Vc2 *vc2;
}
@property (weak, nonatomic) IBOutlet UITabBar *myTabBar;


@end

@implementation VcTop

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myTabBar.delegate = self;
    
    vc2 = [[Vc2 alloc] initWithNibName:nil bundle:nil];
//    vc2.tabBarItem = self.myTabBar.items[0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//ios原生來給我們調整畫面的方法：用來調整tabbar的
-(void)viewWillLayoutSubviews
{
    CGRect tabFrame = self.myTabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 80; //自行調整想要的高度
    tabFrame.origin.y = self.view.frame.size.height - 80; //自行調整想要的高度
    self.myTabBar.frame = tabFrame;
    
    int tabBarHeight = self.myTabBar.bounds.size.height;
    NSLog(@"tabBarHeight: %d",tabBarHeight);
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"VcTop~2" bundle:nil];
    return self;
}




#pragma mark - TabBarDelegate


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    Vc2 *vc2 = [[Vc2 alloc] initWithNibName:nil bundle:nil];
    NSLog(@"%@",item.title);
    if([item.title isEqualToString:@"abc"]) {
        // do something for this specific button
        
        [self.view insertSubview:vc2.view belowSubview:self.myTabBar];
        
    }
    if ([item.title isEqualToString:@"ddd"]) {
        [vc2.view removeFromSuperview];//這樣才會去掉view
        [self.presentingViewController.view removeFromSuperview];//這樣沒換掉view，只去掉view
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
