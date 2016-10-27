//
//  Albums.swift
//  cd
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Jakub Syrek. All rights reserved.
//

import Foundation

class AlbumSingleton {
    
    
    static let sharingInstance = AlbumSingleton()
    private init() {}
    
    var Albums = [Album]()
}

class Album{
    var title: String = ""
    
    
    
}