//
//  CoredataHelper.swift
//  DCAFood
//
//  Created by jobzella on 11/03/2023.
//

import Foundation
import CoreData
import UIKit
class CoreDataStack: NSObject{
    static let sharedInstance = CoreDataStack()
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CoreDataFile")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func getGames()->[OfflineGame]{
        var offlineGames = [OfflineGame]()

        let context : NSManagedObjectContext = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteGames")
        do{
            let games:NSArray = try (context.fetch(request)) as NSArray
            games.forEach { game in
                offlineGames.append(game as! OfflineGame)
            }
        }
            catch{
                print("cannot catch")
            }
        return offlineGames

    }
    func save(selectedGame:GameModel){
        let context  = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavouriteGames", in: context)
        let game = OfflineGame(entity: entity!, insertInto: context)
        game.name =  selectedGame.name ?? ""
        game.id = NSNumber(integerLiteral: selectedGame.id!)
        game.image = selectedGame.image!
        game.metacritic = NSNumber(integerLiteral: selectedGame.metacritic!)
        let names = selectedGame.genres!.map { $0.name ?? "" }
        game.genres = names.count > 1 ? names.joined(separator: ", ") : names.first ?? ""
        CoreDataStack.sharedInstance.saveContext()

    }
    
}

