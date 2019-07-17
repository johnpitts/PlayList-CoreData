//
//  Stack.swift
//  CoreDataMiniProject
//
//  Created by Spencer Curtis on 3/8/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
	
	static let container: NSPersistentContainer = {
		
			let container = NSPersistentContainer(name: "PlaylistCoreData")
			container.loadPersistentStores() { (storeDescription, error) in
				if let error = error as NSError? {
					fatalError("Unresolved error \(error), \(error.userInfo)")
				}
			}
			return container
		}()
	
	static var context: NSManagedObjectContext { return container.viewContext }
}
