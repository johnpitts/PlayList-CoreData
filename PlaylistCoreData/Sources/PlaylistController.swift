//
//  PlaylistController.swift
//  Playlist
//
//  Created by Spencer Curtis 3/8/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
	func create(playlistWithName name: String) {
        let _ = Playlist(name: name)
    }
    
    func delete(playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.delete(playlist)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("There was a problem saving to the persistent store: \(error)")
        }
    }
    
    func create(songWithName name: String, artist: String, playlist: Playlist) {
        let _ = Song(name: name, artist: artist, playlist: playlist)
        saveToPersistentStore()
    }
    
    func delete(song: Song) {
        if let moc = song.managedObjectContext {
            moc.delete(song)
            saveToPersistentStore()
        }
    }
    
    // MARK: Properties
    
    var playlists: [Playlist] {
        
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
}
