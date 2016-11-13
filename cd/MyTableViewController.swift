//
//  MyTableViewController.swift
//  cd
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var albums = Albums.share.albums    
    
    let emptyAlbum = NSDictionary(dictionary:
        [
            "artist": "",
            "title": "",
            "date": "",
            "genre": "",
            "rating": 0
        ])

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("AlbumCell", forIndexPath: indexPath)

        cell.textLabel!.text = albums![indexPath.row]["artist"] as? String
        cell.detailTextLabel!.text = albums![indexPath.row]["title"] as? String

        return cell
    }

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let albumForm = segue.destinationViewController as? AlbumViewController
        {
            if let cell = sender as? UITableViewCell
            {
                if let index = tableView.indexPathForCell(cell)
                {
                    albumForm.album = albums![index.row] as? NSDictionary
                    albumForm.isNew = false
                }
                
            }
            else
            {
                albumForm.album = emptyAlbum
                albumForm.isNew = true
            }
        }
    }
}
