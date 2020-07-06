//
//  Constans.swift
//  youtube-onedaybuild
//
//  Created by Gürkan Sarı on 6.07.2020.
//  Copyright © 2020 Gürkan Sarı. All rights reserved.
//

import Foundation

struct Constans {
    static var API_KEY = ""
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constans.PLAYLIST_ID)&key=\(Constans.API_KEY) "
}
