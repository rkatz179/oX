//
//  UserManager.swift
//  OnboardingApp
//
//  Created by Josh Broomberg on 2016/05/28.
//  Copyright © 2016 iXperience. All rights reserved.
//

import Foundation


struct User {
    var email: String
    var password: String
}

class UserController {
    // Singleton design pattern
    class var sharedInstance: UserController {
        struct Static {
            static var instance:UserController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = UserController()
        }
        return Static.instance!
    }
    
    
    private var users: [User] = []
    
    var logged_in_user: User?
    
    func registerUser(newEmail: String, newPassword: String) -> (failureMessage: String?, user: User?) {
        for user in users {
            if (user.email == newEmail) {
                return ("Email taken", nil)
            }
        }
        
        
        if ( newEmail == "" ){
            return( "No user supplied" , nil)
        }
        else if ( newPassword == "" ){
            return("No password supplied", nil)
        }
        
        
        let user = User(email: newEmail, password: newPassword)
        users.append(user)
        logged_in_user = user
        print("User with email: \(newEmail) has been registered by the UserManager.")
        return (nil, user)
    }
    
    func loginUser(suppliedEmail: String, suppliedPassword: String) -> (failureMessage: String?, user: User?){
        for user in users {
            if user.email == suppliedEmail {
                if user.password == suppliedPassword {
                    logged_in_user = user
                    print("User with email: \(suppliedEmail) has been logged in by the UserManager.")
                    return (nil, user)
                } else {
                    return ("Password incorrect", nil)
                }
            }
        }
        
        return ("No user with that email", nil)
    }
//    func getStoredUser(id:String) -> User? {
//        if let userPassword:String = NSUserDefaults.standardUserDefaults().objectForKey(id) as String? {
//            //user found
//            let user = User( email, password: userPassword)
//            return user
//        }
//        else {
//            return ("Password Incorrect")
//        }
//        
//    }
}