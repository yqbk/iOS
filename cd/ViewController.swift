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
    let plistCatPath =
    NSBundle.mainBundle().pathForResource("albums", ofType: "plist");
    
    var albums: NSArray?
    


    @IBOutlet weak var RatingNr: UILabel!
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var year: UITextField!
    
    @IBAction func ChangeRating(sender: UIStepper) {
        let value = sender.value;
        RatingNr.text = String(value);
        
    }
    
    func refreshViewOnChange()
    {
        artist.text = albums![index].valueForKey("artist") as? String
        genre.text = albums![index].valueForKey("genre") as? String
        year.text = albums![index].valueForKey("year") as? String

    }
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        self.steper.maximumValue = 3;
        self.steper.minimumValue = 1;
        self.RatingNr.text = String(self.steper.value);
        
        albums = NSMutableArray(contentsOfFile:plistCatPath!);
        
        

        refreshViewOnChange()
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

