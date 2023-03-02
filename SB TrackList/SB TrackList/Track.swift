//
//  Model.swift
//  SB TrackList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//


struct Track {
    
    let artist: String
    let song: String
    
    var track: String {
        "\(artist) - \(song)"
    }
}
