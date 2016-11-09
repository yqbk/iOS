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
    var albums = AlbumsSingleton.sharedInstance.albums
    var album: NSDictionary?
    var albumsCount: Int?
    var index: Int?
    
    var album: NSDictionary = [
        "artist": "",
        "title": "",
        "date": "",
        "genre": "",
        "rating": 0]


    var albumsDocPath: String = ""

    // potrzebne?
    var albums: NSMutableArray = []
    var index = 0
    
    
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var albumTitle: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var ratingNr: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!

    // delete
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var cancel: UIButton!
    
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var state: UILabel!

    // co to jest????
    @IBOutlet var currentPage: UILabel!
    @IBOutlet var allPage: UILabel!

    

    
    @IBAction func saveRecord(sender: UIButton) {
        
//        let newDictionary = NSDictionary(dictionary:
//            ["artist": artist.text!,
//                "title": albumTitle.text!,
//                "date": Int(year.text!)!,
//                "genre": genre.text!,
//                "rating": Double(ratingNr.text!)!])
//        
//        print(state.text);
//        
//        if (state.text == "New record")
//        {
//            albums.addObject(newDictionary)
//            index = albums.count - 1;
//        }
//        else
//        {
//            albums[index] = newDictionary;
//        }
//        
//        albums.writeToFile(albumsDocPath, atomically: true)
//        refreshViewOnChange()
        
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
        artist.text = albums[index].valueForKey("artist") as? String
        genre.text = albums[index].valueForKey("genre") as? String
        albumTitle.text = albums[index].valueForKey("title") as? String
        year.text = albums[index].valueForKey("date")?.stringValue
        ratingNr.text = albums[index].valueForKey("rating")?.stringValue
        
        steper.value = (albums[index].valueForKey("rating")?.doubleValue)!
        
        state.text = albums[index].valueForKey("artist") as? String
        
        deleteButton.enabled = true;
        newButton.enabled = true;
        saveButton.enabled = false;
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
                let plistPath = NSBundle.mainBundle().pathForResource("albums", ofType: "plist")!
                let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
                albumsDocPath = documentsPath.stringByAppendingString("/albums.plist")
                let fileManager = NSFileManager.defaultManager()
        
        
                if !fileManager.fileExistsAtPath(albumsDocPath)
                {
        //            bez wykrzyknika???
                    try? fileManager.copyItemAtPath(plistPath, toPath: albumsDocPath)
                }
                
                albums = NSMutableArray(contentsOfFile: albumsDocPath)!
        
        self.steper.maximumValue = 5;
        self.steper.minimumValue = 1;
        
        
        refreshViewOnChange()
    }

    
    
    @IBAction func changedFieldValue(sender: AnyObject)
    {
        saveButton.enabled = true;
    }

    func clearFields()
    {
        artist.text = "";
        albumTitle.text = "";
        year.text = "";
        genre.text = "";
        ratingNr.text = "0";
    }


    // --------------------------------------------------




}
