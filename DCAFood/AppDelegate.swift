//
//  AppDelegate.swift
//  DCAFood
//
//  Created by jobzella on 28/02/2023.
//

import UIKit
import CoreData
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var managedObjectContext: NSManagedObjectContext!       //LINE 1

//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "CoreDataFile")
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Unable to load persistent stores: \(error)")
//            }
//        }
//
//        self.managedObjectContext = container.viewContext   //LINE 2
//
//        return container
//    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        // Override point for customization after application launch.
       let rootScreenNavBar = UINavigationController(rootViewController: BaseTabBarController())

        window?.rootViewController = rootScreenNavBar
        window?.makeKeyAndVisible()
        //

        return true
    }


}

