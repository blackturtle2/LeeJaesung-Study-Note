//
//  MyCollectionViewController.swift
//  CollectionViewTest
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

let imageStr = "http://mimgnews1.naver.net/image/upload/item/2016/08/05/163628613_%25C4%25B3%25C1%25EA%25BE%25F3_%25C6%25AE%25BF%25CD%25C0%25CC%25BD%25BA.jpg?type=f289_162"

//let big = "https://i.ytimg.com/vi/tX5jB733nd0/maxresdefault.jpg"
//let big = "http://media.cntraveler.com/photos/5429c32a425f183f61bf7315/master/pass/new-york-city-skyline.jpg"
let big = "http://pds25.egloos.com/pds/201506/28/58/f0068858_558fe8f5eabb3.jpg"


class MyCollectionViewController: UICollectionViewController {

    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setp1 : Start
//        self.loadImageData()
        
        //use Step3/Step4 Code.
        //Step3 : dispatch Queue사용
//        DispatchQueue.global(qos: .default).async {
//            self.loadImageData()
//            
//        }
        
        //use Step3 Code.
//        self.collectionView?.reloadData()
    }

    
    
    func loadImageData()
    {
        for index in 0...20
        {
            print("===loading Image(\(index))===")
            
            //Setp2 : change imageSize
            if let url = URL(string: big)
            {
                do{
                    let realData =  try Data(contentsOf: url)
                    images.append(UIImage(data:realData)!)
                    print("/***loaded imag***/")
                }catch
                {
                    
                }
            }
        }
        //Step4 : reload위치 변경
//        self.collectionView?.reloadData()
        
        //Step5 : main Queue로 이동
        DispatchQueue.main.sync {
            self.collectionView?.reloadData()
        }
        
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        return images.count
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BasicCollectionViewCell
    
//        cell.set(title: "cell index : \(indexPath.item)")
//        cell.set(image: images[indexPath.item])
    
        
        //***********Step5후 BasicCollectionViewCell에서 이미지 로드하는 방식으로 구조 변경
        cell.set(title:"cell index : \(indexPath.item)", imageUrl:big)
        
        return cell
    }

    
        
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .gray
    }

    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = nil
    }
    

}


