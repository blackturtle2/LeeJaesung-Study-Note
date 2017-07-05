# 패스트캠퍼스 강의 노트 39th ( 20170704 )

# 오늘의 Tip

## 아이폰의 사진 가져오기

### `UIImagePickerController`

```swift
import UIKit
import TLPhotoPicker

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, TLPhotosPickerViewControllerDelegate {
    
    @IBOutlet var imageViewMain: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonUpload(_ sender:UIButton) {
        
        let imagePickerController:UIImagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func buttonTLUpload(_ sender: UIButton) {
        let imagePickerController:TLPhotosPickerViewController = TLPhotosPickerViewController()
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.imageViewMain?.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.imageViewMain?.image = withTLPHAssets.first?.fullResolutionImage
    }
}
```

# -

---
### 문서 끝 ( by 재성 )