//
//  AlbumViewController.swift
//  cd
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import UIKit

// todo
import Foundation

class AlbumViewController: UIViewController {

    // todo
    var albums = Albums.share.albums
    var album: NSDictionary?
    var count: Int?
    var index: Int?
    
    var emptyAlbum: NSDictionary = [
        "artist": "",
        "title": "",
        "date": "",
        "genre": "",
        "rating": 0]
    
    
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var albumTitle: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var ratingNr: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!

    // delete
    @IBOutlet weak var newButton: UIButton!
//    @IBOutlet weak var cancel: UIButton!
    
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var state: UILabel!

    // co to jest????
//    @IBOutlet var currentPage: UILabel!
//    @IBOutlet var allPage: UILabel!

    
    @IBAction func saveRecord(sender: UIButton)
    {
        
    }


    @IBAction func editedAlbum(sender: AnyObject) {
        
        saveButton.enabled = true;

    }
    

    
    
    @IBAction func deleteRecord(sender: AnyObject) {
        
        
//        albums.removeObjectAtIndex(index);
//        
//        index = 0;
//        refreshViewOnChange()
    }
    
    
    @IBAction func newRecord(sender: AnyObject) {
        
//        clearFields();
//        
//        index = albums.count;
//        
//        deleteButton.enabled = false;
//        newButton.enabled = false;
//        saveButton.enabled = true;
    }
  
    
    func refreshViewOnChange()
    {
        
        //  Get values from plist
        artist.text = album?.valueForKey("artist") as? String
        albumTitle.text = album?.valueForKey("title") as? String
        genre.text = album?.valueForKey("genre") as? String
        year.text = album?.valueForKey("date")?.stringValue
        ratingNr.text = album?.valueForKey("rating")?.stringValue

        
        steper.value = (album?.valueForKey("rating")?.doubleValue)!
        
        state.text = album?.valueForKey("artist") as? String

        deleteButton.enabled = true;
        newButton.enabled = true;
        saveButton.enabled = false;
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.steper.maximumValue = 5;
        self.steper.minimumValue = 1;
        
        
        refreshViewOnChange()
    }

    
    
    func clearFields()
    {
        artist.text = "";
        albumTitle.text = "";
        year.text = "";
        genre.text = "";
        ratingNr.text = "0";
    }

}
