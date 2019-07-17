//
//  Song+Convenience.swift
//  PlaylistCoreData
//
//  Created by Spencer Curtis on 3/8/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

extension Song {
	@discardableResult convenience init(name:String,
	                                    artist: String,
	                                    playlist: Playlist,
	                                    context: NSManagedObjectContext = CoreDataStack.context) {
		
		self.init(context: context)
		
		self.name = name
		self.artist = artist
		self.playlist = playlist
	}
}
