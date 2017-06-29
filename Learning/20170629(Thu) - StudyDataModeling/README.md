# StudyNote - Study Data Modeling ( 20170629 )

###### `// 강의 노트가 아닌, 데이터 모델링 스터디노트입니다.`


# Data Modeling

## 음반(Album)의 데이터 형태를 가져오기
 - `UserDefaults`, `Property List`, `Json` 등에서 데이터를 가져올 때, View Controller단이 아닌, 모델링한 데이터 클래스에서 이를 불러오고, 저장하는 함수를 만들어 컨트롤 하도록 한다.
 - 내부에서 데이터는 특정한 Struct, Class 형태를 띄고 있고, 데이터를 부르거나 저장할 때는 결국 text 형태 즉, String, Int와 같은 단순한 모양으로 데이터를 저장하도록 한다.
 - 이를 쉽게 하기 위해 데이터 모델링 작업을 거친다.

### `Struct Album`

```swift
struct Album {
    
    var title: String
    var artist: String
    var genre: String
    var songs: [Song] = []
    
    init(data: [String: Any]) {
        title = data["album_title"] as? String ?? ""
        
        var songList = data["song"] as? [[String: Any]] ?? []
        
        for song in songList {
            songs.append(Song(data: song))
        }
    }
    
    var dic: [String: Any] {
        var returnDic: [String: Any] = [:]
        returnDic.updateValue(title, forKey: "album_title")
        
        return returnDic
    }
   
}
```

### `struct Song`

```swift
struct Song {
    
    var name: String
    var artist: String
    
    init(data: [String: Any]) {
        name = data["song_name"] as? String ?? "(제목 없음)"
        artist = data["song_artist"] as? String ?? "(가수 없음)"
    }
}
```

### `class DataCenter`

```swift
class DataFile {

    func load() -> Album {
        
        let dic = NSDictionary(contentsOfFile: path) as! [String: Any]
        return Album(data: dic)
        
    }
    
    func save(data: Album) {
        
        // document path 가 여기에
        
        var dictionary = NSDictionary(dictionary: data.dic)
        dictionary.write(toFile: docPath, atomically: true)
    }
}
```


---
### 문서 끝 ( by 재성 )