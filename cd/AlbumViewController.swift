//
//  AlbumViewController.swift
//  cd
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import UIKit


class AlbumViewController: UIViewController {

    var albums = Albums.share.albums
    var album: NSDictionary?
    var isNew: Bool = false
    
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var albumTitle: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var ratingNr: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!

    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var state: UILabel!
    
    
    @IBAction func changeRating(sender: UIStepper) 
    {        
        let val = sender.value;
        saveButton.enabled = true;
        ratingNr.text = String(val);
    }
    
    @IBAction func saveRecord(sender: UIButton)
    {
        let newDictionary = NSDictionary(dictionary:
            [
                "artist": artist.text!,
                "title": albumTitle.text!,
                "date": Int(year.text!)!,
                "genre": genre.text!,
                "rating": Double(ratingNr.text!)!
            ])
        
        if (isNew == false)
        {
            Albums.share.saveAlbums(index!, album: newDictionary)
        }
        else
        {
            Albums.share.addAlbum(newDictionary)
        }
        
        isNew = false
        animatedGoBack()        
    }


    @IBAction func editedText(sender: AnyObject) 
    {
        saveButton.enabled = true;
    }    
    
    @IBAction func deleteRecord(sender: AnyObject)
    {
        Albums.share.deleteAlbum(index!)
        index = 0;
        animatedGoBack()
    }    

    @IBAction func goBack(sender: UIButton)
    {
        animatedGoBack()
    }
    
    func animatedGoBack()
    {
        navigationController?.popViewControllerAnimated(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.steper.maximumValue = 5;
        self.steper.minimumValue = 1;
        
        if (isNew == false)
        {
            artist.text = album?.valueForKey("artist") as? String
            albumTitle.text = album?.valueForKey("title") as? String
            genre.text = album?.valueForKey("genre") as? String
            year.text = album?.valueForKey("date")?.stringValue
            ratingNr.text = album?.valueForKey("rating")?.stringValue
            
            steper.value = (album?.valueForKey("rating") as? Double)!
            state.text = album?.valueForKey("artist") as? String
            
        }
        else
        {
            artist.text = album?.valueForKey("artist") as? String
            albumTitle.text = album?.valueForKey("title") as? String
            genre.text = album?.valueForKey("genre") as? String
            year.text = album?.valueForKey("date")?.stringValue
            ratingNr.text = album?.valueForKey("rating")?.stringValue            
            
            steper.value = 0            
            state.text = "new"
        }
        
        deleteButton.enabled = true;
        cancelButton.enabled = true;
        saveButton.enabled = false; 
    }
}
