//
//  Playlist+Convenience.swift
//  PlaylistCoreData
//
//  Created by Spencer Curtis on 3/8/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
	@discardableResult convenience init(name: String,
	                                    context: NSManagedObjectContext = CoreDataStack.context) {
		self.init(context: context)
		self.name = name
	}
}
