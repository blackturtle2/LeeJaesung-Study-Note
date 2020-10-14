# 패스트캠퍼스 강의 노트 45th ( 20170720 )

# `#Network`

# `REST API` 응용
 - `Sails.js` 프로젝트 상에서 `api/controllers/FooController.js` 소스 수정.

```javascript
module.exports = {
	bar : function(req, res){
		res.ok()
		
	},

	fast : function(req, res){
		var html = "<html>"
		html += "<body>"
		html += "hello world"
		html += "</body>"
		res.send(html)
	},

	calculatorJson : function(req, res){
		var params = req.allParams()
		var a = parseInt(params.a, 10)
		var b = parseInt(params.b, 10)
		var c = a * b
		res.json({
			a : a,
			b : b,
			result : c
		})
	}
};
```

 - `Postman`에서 API test.
 - `[POST]` `http://localhost:1337/foo/calculatorJson`
	 - `body`: { `a : 1`, `b : 2` }
 - `WebBrowser`에서 API test.
	 - `http://localhost:1337/foo/calculatorJson?a=1&b=2`
	 - API URL 뒤에 `?`와 파라미터를 함께 붙이기.



# `REST API` in `iOS`
 - `info.plist`에서 **http permission** 을 위해 `App Transport Security Settings` 추가.
	 - `Allow Arbitrary Loads`의 값을 **YES** 로 추가.
 - `ViewController`에서 아래 소스 추가.
 - `task`를 만들고, `task.reume()`으로 task 활성화.

## `Sample Code`
 - `URLRequest`를 만들고, Method를 GET으로 추가한다.
 - `URLSession`의 `dataTask`를 만들어, task를 정의하고, `task.resume()`으로 활성화.

```swift
let url = URL(string: "http://localhost:1337/user")
var request = URLRequest(url: url!)
request.httpMethod = "GET"
    
let task = URLSession.shared.dataTask(with: request) {
    data, response, error in
    
    print("data: \(data!)")
    print("data: \(String(describing: String(data: data!, encoding: .utf8)))")
    print("response: \(response!)")
    print("error: \(String(describing: error))")
}

task.resume()

print("task: \(task)")
```

## 연습 예제 - `MainViewController`

### `loadData()`
 - `JSONSerialization.jsonObject`으로 JSON 데이터를 가져온다.
 - UI 갱신은 `DispatchQueue.main.async`를 통해 쓰레드를 돌린다.

```swift
func loadData() {
    let url = URL(string: "http://localhost:1337/user")
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) {
        data, response, error in
        
        guard let data = data else { return print("Guard let- data") }
        
//            let dataStr = String.init(data: data, encoding: .utf8)
//            print("dataStr: \(String(describing: dataStr))")
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Any> {
            print("json: \(json)")
            
            self.data = json as! NSMutableArray
            
            DispatchQueue.main.async {
                self.tableViewMain.reloadData()
            }
            
            for item in json {
                let test = item as! NSDictionary
                
                print(test["email"]!)
            }
        }
//      print("response: \(response!)")
//      print("error: \(String(describing: error))")
    }
    
    task.resume()
    
//        print("task: \(task)")
}
```

### `UITableViewCell`
 - 위에서 `self.data = json as! NSMutableArray`로 만들었던 data 변수에서 `NSDictionary` 형태로 오브젝트를 꺼내온다.

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    let pair = self.data.object(at: indexPath.row) as! NSDictionary
    
    myCell.textLabel?.text = pair["email"] as? String
    myCell.detailTextLabel?.text = pair["password"] as? String
    
    return myCell
}
```

## `AddViewController`
 - `NSMutableData`에 `extension`을 만들어서 String을 넣으면, data 형태로 바로 추가될 수 있도록 구현합니다.
 - `URLRequest`를 만들고, `httpMethod`를 **POST** 로 설정하고, `Header`에는 json을 명시합니다.
 - `NSMutableData` 타입의 body를 만들고, body에 JSON 타입의 데이터를 추가합니다.
 - 그 body를 `URLSession.shared.uploadTask`에 태워서 데이터를 갱신해줍니다.
 - `URLSession.shared.dataTask`로도 POST, GET 모두 구현이 가능하지만, 보다 편하게 사용하기 위해서(?) `URLSession.shared.uploadTask`를 사용하기도 합니다.

```swift
extension NSMutableData {
    func appendString(_ str:String) {
        self.append(str.data(using: .utf8)!)
    }
}
```

```swift
func saveData() {
    let url = URL(string: "http://localhost:1337/user")
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body = NSMutableData()
    body.appendString("{\"email\" : \"\(textFieldEmail.text!)\", \"password\" : \"\(textFieldPassword.text!)\"}")
//        request.httpBody = body as Data

    let task = URLSession.shared.uploadTask(with: request, from: body as Data) { (data, response, error) in
        print("COMPLETE!")
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    task.resume()
    
    
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            
//            guard let data = data else {return}
//            print(response!)
//            
//            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary {
//                print(json)
//            }
//            
//            DispatchQueue.main.async {
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
    
    
//        print("task: \(task)")
    
//        let params = [
//            "email" : textFieldEmail.text,
//            "password" : textFieldPassword.text
//        ]
//        
//        if let jsonStr = try? JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0)) {
//            let url = URL(string: "http://localhost:1337/user")
//            var request = URLRequest(url: url!)
//            request.httpMethod = "POST"
//            request.httpBody = jsonStr
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            
//            let task = URLSession.shared.dataTask(with: request) {
//                data, response, error in
//                guard let data = data else {return}
//                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary {
//                    DispatchQueue.main.async {
//                        self.navigationController?.popViewController(animated: true)
//                    }
//                }
//            }
//            task.resume()
//        }
    
}
```


# `Alamofire` & `SwiftyJSON`
 - `Swift - iOS` 생태계에서 가장 보편화된 네트워크 오픈소스입니다.
	 - [Alamofire/Alamofire](https://github.com/Alamofire/Alamofire)
 - `Alamofire`를 import하고, `Alamofire.request` 하여 사용합니다.
 - `SwiftyJSON`은 JSON을 보다 편리하게 사용하고, 형변환을 최소화하는 것에 편리성을 제공합니다.
	 - [SwiftyJSON/SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON#initialization)
 
```swift
func fetchUserData() {
    Alamofire.request("http://localhost:1337/user").responseJSON { (response) in
        
        switch response.result {
        case .success(let value):
            print("Alamofire: \(value)")
        case .failure(let error):
            print("Alamofire: \(error)")
        }
        
    }
}
```


---
### 문서 끝 ( by 재성 )