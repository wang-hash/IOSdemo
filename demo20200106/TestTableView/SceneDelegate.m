#import "SceneDelegate.h"
#import "ViewController.h"
#import "VideoViewController.h"
#import "MyLocation.h"
#import "MyNotification.h"
#import "CommentManager.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *) scene];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    ViewController* viewController = [[ViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
//    navigationController.tabBarItem.title = @"新闻";
    viewController.title = @"新闻";
    
    VideoViewController *videoViewController = [[VideoViewController alloc] init];
    
    UIViewController *viewController2 = [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor yellowColor];
    viewController2.tabBarItem.title = @"推荐";
    viewController2.title = @"今日头条";

    UIViewController *viewController3 = [[UIViewController alloc] init];
    viewController3.view.backgroundColor = [UIColor blueColor];
    viewController3.tabBarItem.title = @"我的";
    
    [tabBarController setViewControllers:@[viewController,videoViewController,viewController2,viewController3]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    [[MyLocation locationManager] checkLocationAuthorization];
    [[MyNotification notificationManager] checkNotificationAuthorization];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
