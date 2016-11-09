//
//  Albums.swift
//  cd
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import Foundation

class AlbumSingleton {

// todo DELETE ADDITIONAL VIew
    
    
    static let sharingInstance = AlbumSingleton()
    private init() {}
    
    var Albums = [Album]()
}

class Album
{
    var title: String = "";
    var artist: String =  "";
    var genre: String = "";
    var year: Int = 0
    var rating: Int = 0
}

func addAlbum()
{
    
}

func changeAlbum()
{
    
}

func deleteAlbum()
{
    
}