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
    var maxIndex = 0
    let plistCatPath =
    NSBundle.mainBundle().pathForResource("albums", ofType: "plist");
    
    var albums: NSArray?
    


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
        
        if(index<(maxIndex-1))
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
        
        
    }
    
    @IBAction func ChangeRating(sender: UIStepper) {
        let value = sender.value;
        RatingNr.text = String(value);
        
    }
    
    func refreshViewOnChange()
    {
        artist.text = albums![index].valueForKey("artist") as? String
        genre.text = albums![index].valueForKey("genre") as? String
        albumTitle.text = albums![index].valueForKey("title") as? String
        year.text = albums![index].valueForKey("date")?.stringValue
        
        state.text = "Track number \(index+1)"
        
        if(index==(albums?.count)!)
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
        
        
        
        self.steper.maximumValue = 3;
        self.steper.minimumValue = 1;
        self.RatingNr.text = String(self.steper.value);
        
        albums = NSMutableArray(contentsOfFile:plistCatPath!);
        
        maxIndex = (albums?.count)!
        
        

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
    }


}

