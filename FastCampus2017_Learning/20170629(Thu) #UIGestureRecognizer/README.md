# 패스트캠퍼스 강의 노트 36th ( 20170629 )

# UIGestureRecognizer

## UITapGestureRecognizer

### `Sample Source`

```swift
@IBAction func touchAction(_ sender: UITapGestureRecognizer) {
    
    if touchLocation == sender.location(in: self.view) {
        touchNumber += sender.numberOfTouches
    }else {
        touchNumber = 1
    }
    touchLocation = sender.location(in: self.view)
    
    labelNumber.text = String(touchNumber)
    labelPoint.text = String(describing: touchLocation!)
    
}
```


# Animation

 - UIView Animation
 - UIImageView Animation
 - UIViewController Animation

### `Sample Source`

```swift
@IBAction func actionButton(_ sender: UIButton) {
    
    UIView.animate(withDuration: 0.3,
                   delay: 0.5,
                   options: [.curveEaseIn,.autoreverse],
                   animations: {var newFrame = self.sampeView.frame
                                newFrame.origin.x += 200
                                self.sampeView.frame = newFrame
    })
    
    UIView.animate(withDuration: 1,
                   delay: 0,
                   dampingRatio: 0.4,
                   velocity: 0.9,
                   options: [.curveLinear],
                   animations: { self.sampeView.layer.transform = CATransform3DMakeScale(3, 3, 1)
    }) { (isEnd) in
        self.imgView.layer.transform = CATransform
    }

    UIView.animate(withDuration: 1, animations: {
        //CATransform3DMakeRotation(R값, x, y, z) <-- x,y,z는 회전 축
        self.sampeView.layer.transform = CATransform3DMakeRotation(360*180/3.14, 0, 0, 1)
        self.sampeView.alpha = 0.5
    }) {(isEnd) in
        UIView.animate(withDuration: 0.3, animations: {
            self.sampeView.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.sampeView.alpha = 1
        }, completion: nil)
    
    
    }
    
}
```

---
### 문서 끝 ( by 재성 )