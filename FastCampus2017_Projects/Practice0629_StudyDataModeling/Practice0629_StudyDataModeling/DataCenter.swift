//
//  DataCenter.swift
//  Practice0629_StudyDataModeling
//
//  Created by leejaesung on 2017. 6. 29..
//  Copyright © 2017년 leejaesung. All rights reserved.
//

import Foundation

struct Album {
    
    var title: String
    var artist: String
    var genre: String
    var songs: [Song] = []
    
    init(data: [String: Any]) {
        // dictionary 데이터를 받아 내부 구조에 맞게 init 합니다.
        title = data["album_title"] as? String ?? "(앨범 타이틀 없음)"
        artist = data["album_artist"] as? String ?? "(앨범 아티스트 없음)"
        genre = data["album_genre"] as? String ?? "(앨범 장르 없음)"
        
        // dictionary를 담고 있는 array를 받아서 Song 클래스를 담은 array에 저장합니다.
        let songList = data["song"] as? [[String: Any]] ?? []
        
        for item in songList {
            songs.append(Song(data: item))
        }
    }
    
    var dic: [String: Any] {
        var returnDic: [String: Any] = [:]
        returnDic.updateValue(title, forKey: "album_title")
        returnDic.updateValue(artist, forKey: "album_artist")
        returnDic.updateValue(genre, forKey: "album_genre")
        returnDic.updateValue(songs, forKey: "song")
        
        return returnDic
    }
    
}

struct Song {
    
    var name: String
    var artist: String
    
    init(data: [String: Any]) {
        name = data["song_name"] as? String ?? "(제목 없음)"
        artist = data["song_artist"] as? String ?? "(가수 없음)"
    }
}

class DataFile {
    
    static let sharedInstance: DataFile = DataFile()
    
    var albumData:Album?
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let dicData = UserDefaults.standard.dictionary(forKey: "albums") else { print("ERROR- loadData, UserDefaults"); return }
        
        self.albumData = Album.init(data: dicData)
    }
    
    func save(data: Album) {
        // document path는 여기에서 기술합니다.
        
//        var dictionary = NSDictionary(dictionary: data.dic)
//        dictionary.write(toFile: docPath, atomically: true)
    }
}





