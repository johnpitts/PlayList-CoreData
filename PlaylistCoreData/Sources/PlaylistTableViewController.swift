//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Spencer Curtis on 3/8/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
	
	// MARK: Actions

    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playlistName = playlistTextField.text, !playlistName.isEmpty else { return }
        playlistController.create(playlistWithName: playlistName)
        playlistTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource/Delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistController.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = playlistController.playlists[indexPath.row]
        guard let songs = playlist.songs else { return UITableViewCell() }
        
        cell.textLabel?.text = playlist.name
        
        if songs.count == 1 {
            cell.detailTextLabel?.text = "1 Song"
        } else {
            cell.detailTextLabel?.text = "\(songs.count) Songs"
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Playlists"
    }
	
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = playlistController.playlists[indexPath.row]
            
            playlistController.delete(playlist: playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlaylistDetail",
            let indexPath = tableView.indexPathForSelectedRow {
            let playlist = playlistController.playlists[indexPath.row]
            let songVC = segue.destination as? SongTableViewController
            songVC?.playlist = playlist
            songVC?.playlistController = playlistController
        }
    }
	
	// MARK: Properties
    
    let playlistController = PlaylistController()
	
	@IBOutlet weak var playlistTextField: UITextField!

}
