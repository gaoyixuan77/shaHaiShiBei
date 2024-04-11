//
//  SceneDelegate.m
//  沙海_识贝
//
//  Created by Eleven on 2024/4/9.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "shallTuJianViewController.h"
#import "geRenViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    ViewController *shouYe = [[ViewController alloc] init];
    shallTuJianViewController *collect = [[shallTuJianViewController alloc] init];
    geRenViewController *geRen = [[geRenViewController alloc] init];
    
    collect.isShouYe = NO;
    collect.title = @"贝壳图集";
    geRen.title = @"个人";
    
    UINavigationController *shouYeNavigation = [[UINavigationController alloc] initWithRootViewController:shouYe];
    UINavigationController *collectNavigation = [[UINavigationController alloc] initWithRootViewController:collect];
    UINavigationController *geRenNavigation = [[UINavigationController alloc] initWithRootViewController:geRen];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    tabBar.tabBar.backgroundColor = [UIColor whiteColor];

    UITabBarItem *shouYeTabBar = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"Crab.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Crab.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    shouYe.tabBarItem = shouYeTabBar;
    shouYe.tabBarItem.title = @"游戏";
    UITabBarItem *collectTabBar = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"book-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"book-2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    collect.tabBarItem = collectTabBar;
    collect.tabBarItem.title = @"贝壳图鉴";
    UITabBarItem *geRenTabBar = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"gerentouxiang.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"gerentouxiang.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    geRen.tabBarItem = geRenTabBar;
    geRen.tabBarItem.title = @"个人";
    
    tabBar.viewControllers = @[shouYeNavigation, collectNavigation, geRenNavigation];
    
    UINavigationBarAppearance *navigationAppearance = [[UINavigationBarAppearance alloc] init];
    navigationAppearance.backgroundColor = [UIColor colorWithRed:54/225.0f green:123/225.0f blue:128/225.0f alpha:1];
    
    [shouYeNavigation.navigationBar setStandardAppearance:navigationAppearance];
    [shouYeNavigation.navigationBar setScrollEdgeAppearance:navigationAppearance];
    [collectNavigation.navigationBar setStandardAppearance:navigationAppearance];
    [collectNavigation.navigationBar setScrollEdgeAppearance:navigationAppearance];
    [geRenNavigation.navigationBar setStandardAppearance:navigationAppearance];
    [geRenNavigation.navigationBar setScrollEdgeAppearance:navigationAppearance];
    
    UIToolbarAppearance *toolbarAppearance = [[UIToolbarAppearance alloc] init];
    toolbarAppearance.backgroundColor = [UIColor whiteColor]; // 设置工具栏的背景颜色
    [shouYeNavigation.toolbar setStandardAppearance:toolbarAppearance];
    [shouYeNavigation.toolbar setScrollEdgeAppearance:toolbarAppearance];
    
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
