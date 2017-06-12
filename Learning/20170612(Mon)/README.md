# 패스트캠퍼스 강의 노트 24th ( 20170612 )

# 오늘의 팁
## -

```swift
/// 1~N 까지의 합 구하기
// 반복문 사용 or 공식 사용(n*(n+1)/2). or 재귀 사용.
func sum(number n:Int) -> Int {
    var result:Int = 0
    
    if n <= 0 {
        return 0
    }else {
        result = sum(number: n-1) + n
    }
    
    return result
}
    
/// 가운데 문자 출력하기
// ex) apple --> "P" / iPad --> "Pa"
func printMiddleChar(input s:String) -> String {
    var result:String = "error-"
    var myArray:[Character] = []
    
    for c in s.characters {
        myArray.append(c)
    }
    
    let arrayCount:Int = myArray.count/2
    
    if (myArray.count % 2) == 0 {
        result = "\(myArray[arrayCount-1])\(myArray[arrayCount])"
    }else {
        result = "\(myArray[arrayCount])"
    }
    
    return result
}
```


# CustomView

## 

```swift
import UIKit

class CircleView: UIView {
    
    @IBOutlet var title:UILabel?
    @IBOutlet var okBtn:UIButton?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        
        self.layer.backgroundColor = UIColor.blue.cgColor
    }
    
    func setTitleText(_ text:String) {
        if let titleLB = title {
            titleLB.text = text
        }
    }

}
```

뷰에 대한 보여지는 모습은 뷰에서 처리하는 것이 맞지만.
액션에 대한 이벤트는 뷰컨트롤러에서 처리하는 것이 맞다.



테이블 뷰 커스텀셀을 만들고, 셀 객체를 만들 때, UITableViewCell이 아니므로, 다운캐스팅 해야만 한다. as! MyTableViewCell
커스텀셀에 이미지 하나와 텍스트 하나가 있다. 그래서 커스텀셀 안에 function은 setImage와 setTitle이 있다.


---
### 문서 끝 ( by 재성 )