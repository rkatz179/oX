//
//  AppDelegate.swift
//  NoughtsAndCrosses
//
//  Created by Julian Hulme on 2016/05/02.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var authorisationNavigationController: UINavigationController?
    var GameNavigationController: UINavigationController?
    var EasterEggNavigationController: UINavigationController?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.makeKeyAndVisible()
        
        EasterEggController.sharedInstance.initiate(self.window!)
        
        let userIsLoggedIn = UserController.sharedInstance.getLoggedInUser()
        
        let boardViewController = BoardViewController(nibName:"BoardViewController",bundle:nil)
        self.GameNavigationController = UINavigationController(rootViewController: boardViewController)
        self.GameNavigationController?.navigationBarHidden = true
        
        
        let landingViewController = LandingViewController(nibName: "LandingViewController", bundle:nil)
        authorisationNavigationController = UINavigationController(rootViewController: landingViewController)
        
        let easterEggViewController = EasterEggViewController(nibName: "EasterEggViewController", bundle:nil)
        EasterEggNavigationController = UINavigationController(rootViewController: easterEggViewController)

        
        if userIsLoggedIn != nil {
  
            self.window?.rootViewController = self.GameNavigationController
        } else {
            //LandingViewController
            self.window?.rootViewController = self.authorisationNavigationController
            //self.window?.rootViewController = self.GameNavigationController
        }
        
    
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func navigateToBoardNavigationController(){

    
        self.window?.rootViewController = self.GameNavigationController
   
    }
    
    func navigateBackToLandingNavigationController(){
        //        This function should take no params and return nothing. Inside this function, set the windows rootViewController to be the loggedInNavController. You have already seen a line of code that allows for this. Read up :)

        self.window?.rootViewController = self.authorisationNavigationController
        
    }
    
    func navigateToEasterEggScreen(){
  
        self.window?.rootViewController = self.EasterEggNavigationController
    
        
    }
    
}

