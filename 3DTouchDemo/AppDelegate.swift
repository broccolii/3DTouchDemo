//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by Broccoli on 16/1/22.
//  Copyright © 2016年 Broccoli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        addShortcutItems(application)
        return true
    }

    func addShortcutItems(application: UIApplication) {
        guard #available(iOS 9.0, *) else {
            return
        }
        
        // 9.1 还有更多好玩的
        let itemIcon1 = UIApplicationShortcutIcon(type: .Location)
        let item1 = UIMutableApplicationShortcutItem(type: "type1", localizedTitle: "itemIcon1", localizedSubtitle: nil, icon: itemIcon1, userInfo: nil)
        
        let itemIcon2 = UIApplicationShortcutIcon(type: .Share)
        let item2 = UIMutableApplicationShortcutItem(type: "type2", localizedTitle: "itemIcon2", localizedSubtitle: nil, icon: itemIcon2, userInfo: nil)
        
        application.shortcutItems = [item1,item2]
    }
    
    @available(iOS 9.0, *)
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        var handled = false
        
        if shortcutItem.type == "type1" {
            // 处理页面跳转
            handled = true
        }
        
        if shortcutItem.type == "type1" { //编辑
            handled = true
        }
        
        completionHandler(handled)
    }
}

