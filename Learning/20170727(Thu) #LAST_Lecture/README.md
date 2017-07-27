# 패스트캠퍼스 강의 노트 47th ( 20170727 )

// 마지막 강의 노트.. 입니다.

# 인스타그램 샘플 프로젝트 추가 수정

## Custom Tab Bar
 - `UITabBarControllerDelegate` 추가.
 - `self.delegate = self` 코드 추가.
 - `tabBarController` 델리게이트 함수(`shouldSelect`) 사용. - `should`는 할거야 말거야 라는 bool 값 리턴, did는 어떻게 할거냐는 액션을 정의.
	 - 여기에서 가운데 탭 버튼을 누를 때, `return false`하고, `present modally` 시킨다.
	 - 아래에서 탭버튼은 빼지 말고, 넣어놔야 탭버튼이 5개가 보존된다.



## Custom Image Picker

```swift
sFetchOptions() -> PHFetchOptions {
    let fetchOptions = PHFetchOptions()
    fetchOptions.fetchLimit = 30
    let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
    fetchOptions.sortDescriptors = [sortDescriptor]
    return fetchOptions
}
fileprivate func fetchPhotos() {
    let allPhotos = PHAsset.fetchAssets(with: .image, options: assetsFetchOptions())
    
    DispatchQueue.global(qos: .background).async {
        allPhotos.enumerateObjects({ (asset, count, stop) in
            let imageManager = PHImageManager.default()
            let targetSize = CGSize(width: 200, height: 200)
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { (image, info) in
                
                if let image = image {
                    self.images.append(image)
                    self.assets.append(asset)
                    
                    if self.selectedImage == nil {
                        self.selectedImage = image
                    }
                }
                
                if count == allPhotos.count - 1 {
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                }
                
            })
            
        })
    }
}
```

# 네트워크

TCP: 데이터 무결성
UDP: 영상 스트리밍의 경우, UDP를 사용하기도 한다. 스타크래프트에서 조작이 빨라진다.

URL: 특정 자원의 위치 값.
URI: Restful구조에서 어떤 함수의 명령 값.

URL은 http://naver.com/index.html
URI가 /basefile

Rest 사용 원칙
 - Representations: 객체와 속서응ㄹ 나타내는 데이터를 JSON이나 XML 구조로 전환해서 표현한다.
 - Messages: HTML Method를 사용해야만 한다.

## HTTP
 - Host
 - Accept
 - User-Agent


# 오늘의 꿀팁
 - `Reachability.swift` - [Replacement for Apple's Reachability re-written in Swift with closures](https://github.com/ashleymills/Reachability.swift)
	 - Wi-Fi, LTE, 3G 등의 네트워크 상태를 체크하는 것을 `Reachability`라고 한다.
	 - 애플에서 제공하는 Reachability가 있지만, 재정의한 위의 오픈소스도 있다.
 - 

---
### 문서 끝 ( by 재성 )