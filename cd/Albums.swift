//
//  Albums.swift
//  cd
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import Foundation

class Albums {

// todo DELETE ADDITIONAL VIew
    
    
    static let share = Albums()
    
    var albums: NSMutableArray?
    var albumsDocPath: String = ""
    var lenght: Int = 0
    
    private init()
    {
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
        lenght = (albums?.count)!
    
    }
    
    func saveAlbums(index: Int, album: NSDictionary)
    {
        albums![index] = album
        albums!.writeToFile(albumsDocPath, atomically: true)
    }
    
    func addAlbum(newAlbum: NSDictionary)
    {
        albums?.addObject(newAlbum)
    }
    
    
    func changeAlbum()
    {
        
    }
    
    func deleteAlbum(index:Int)
    {
        albums?.removeObjectAtIndex(index)
    }
    
    func saveData()
    {
        
    }
    
//    var Albums = [Album]()
}

//class Album
//{
//    var title: String = "";
//    var artist: String =  "";
//    var genre: String = "";
//    var year: Int = 0
//    var rating: Int = 0
//}

