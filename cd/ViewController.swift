//
//  ViewController.swift
//  cd
//
//  Created by Użytkownik Gość on 12.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    @IBOutlet weak var RatingNr: UILabel!
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var artist: UITextField!
    @IBOutlet weak var title: UITextField!
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var year: UITextField!
    
    @IBAction func ChangeRating(sender: UIStepper) {
        let value = sender.value;
        RatingNr.text = String(value);
        
    }
    
    override func viewDidLoad() {
        
        let plistCatPath =
        NSBundle.mainBundle().pathForResource("albums", ofType: "plist");
        
        var albums: NSArray?
        
        albums = NSArray(contentsOfFile:plistCatPath!);
        
        super.viewDidLoad()
        self.steper.maximumValue = 3;
        self.steper.minimumValue = 1;
        self.RatingNr.text = String(self.steper.value);
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

