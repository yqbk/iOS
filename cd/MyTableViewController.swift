//
//  MyTableViewController.swift
//  cd
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var albums = Albums.sharedInstances.albums

    // var index = 0
    // var albums: NSMutableArray = []
    // var albumsDocPath: String = ""

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {

    //tutaj?
        let cell = tableView.dequeueReusableCellWithIdentifier("AlbumCell", forIndexPath: indexPath)

        //albms z ? czy !
        cell.textLabel!.text = albums[indexPath.row]["artist"] as? String
        cell.detailTextLabel!.text = albums[indexPath.row]["title"] as? String


        return cell
    }

    //zapomniałem wczesniej?
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    //todo
    func newAlbum () -> NSDictionary {
        let album:NSDictionary = [
            "artist": "",
            "title": "",
            "genre": "",
            "date": 2016,
            "rating": 0
        ]
        return album
    }



    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let albumForm = segue.destinationViewController as? AlbumViewController
        {
            if let cell = sender as? UITableViewCell
            {
                if let index = tableView.indexPathForCell(cell)
                {
                    albumForm.album = albums[index.row] as! NSDictionary
                    albumForm.albumsCount = albums.count
                    albumForm.index = index.row
                }
                else
                {
                    // dziala?
                    albumForm.album = emptyForm()
                    albumForm.albumsCount = albums.count + 1
                    albumForm.index = albums.count
                }


            }


        }
    override func viewDidLoad()
    {
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

//        albumList = AlbumSingleton.sharedInstance.Albums

    }
    }
    

}
