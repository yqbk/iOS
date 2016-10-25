//
//  ViewController.swift
//  cd
//
//  Created by Użytkownik Gość on 12.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 0
    var albums: NSMutableArray = []
    var albumsDocPath: String = ""
    


    @IBOutlet weak var RatingNr: UILabel!
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var albumTitle: UITextField!
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    @IBAction func nextRecord(sender: UIButton) {
        
        if(index<((albums.count) - 1))
        {
            index++
            refreshViewOnChange()
        }
        else
        {
            index++
            newRecord(newButton);
        }
        
    }
    

    @IBAction func prevRecord(sender: UIButton) {
        if(index>0)
        {
            index--
            refreshViewOnChange()
        }

    }
    
    @IBAction func newRecord(sender: UIButton) {
        
        clearFields();
        nextButton.enabled = false;
        prevButton.enabled = false;
        deleteButton.enabled = false;
        newButton.enabled = false;
        saveButton.enabled = true;
        
    }
    
    @IBAction func saveRecord(sender: UIButton) {
    
        let newDictionary = NSDictionary(dictionary:
            ["artist": artist.text,
            "title": "Abbey Road",
            "year": 1969,
            "genre": "rock",
            "rating": 5])
        albums.addObject(newDictionary)
        albums.writeToFile(albumsDocPath, atomically: true)
        
        index = albums.count - 1;
        refreshViewOnChange()
        
    }
    
    @IBAction func DeleteRecord(sender: UIButton) {
    
//        albumsdelete(albums![index]);
        
        
        index = 0;
        refreshViewOnChange()
        
    }
    
    
    @IBAction func ChangeRating(sender: UIStepper) {
        let val = sender.value;
        RatingNr.text = String(val);
        
    }
    
    func refreshViewOnChange()
    {
        
//  Get values from plist
        artist.text = albums[index].valueForKey("artist") as? String
        genre.text = albums[index].valueForKey("genre") as? String
        albumTitle.text = albums[index].valueForKey("title") as? String
        year.text = albums[index].valueForKey("date")?.stringValue
        RatingNr.text = albums[index].valueForKey("rating")?.stringValue
        
//  show track number
        state.text = "Track number \(index+1) / \(albums.count) "
        
//  Disable buttons if neccessary
        if(index==(albums.count))
        {
            nextButton.enabled = false;
        }
        else if(index==0)
        {
            prevButton.enabled = false;
        }
        else
        {
            nextButton.enabled = true;
            prevButton.enabled = true;
        }
        

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
            
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearFields()
    {
        artist.text = "";
        albumTitle.text = "";
        year.text = "";
        genre.text = "";
        RatingNr.text = "0";
        state.text = "New record";
    }


}

