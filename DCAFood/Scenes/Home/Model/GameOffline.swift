//
//  GameOffline.swift
//  DCAFood
//
//  Created by jobzella on 10/03/2023.
//

import Foundation
import CoreData
@objc(OfflineGame)
class OfflineGame:NSManagedObject{
    @NSManaged var name:String!
    @NSManaged var metacritic:NSNumber!
    @NSManaged var genres:String!
    @NSManaged var id:NSNumber!
    @NSManaged var image:String!
}
