# 패스트캠퍼스 강의 노트 46th ( 20170721 )

# `#Network`

# ORM : `Object Relation Mapping`
 
## SQL
 - `Database`는 보통 SQL이라는 언어를 사용하고, ORM이 없었던 시절에 백엔드 개발자는 SQL을 이용해서 데이터베이스 테이블을 구성해야 했습니다.
 - 백앤드 프로그래머가 직접 쿼리를 제작하고, 결과 값을 파싱하여 변수에 바인드합니다.

```javascriptString sql = "SELECT ... FROM persons WHERE id = 10";DbCommand cmd = new DbCommand(connection, sql);Result res = cmd.Execute();String name = res[0]["FIRST_NAME"];```

## ORM - ORM 덕분에 백엔드 개발자는 SQL을 심도 있게 스터디하거나, 쿼리를 고안 할 필요가 없어졌습니다.
 - 결과 값 파싱 및 바인드도 신경 쓸 필요가 없어졌습니다.
 - 자동으로 쿼리를 생성해줌 -> 일부분 효율성의 문제 발생 -> 여전히 수동으로도 사용합니다.

```javascript
Person p = repository.GetPerson(10);String name = p.getFirstName();
```# Docker
## `★ 재성's 마음대로 정리하는 도커★`
 - 기존에 무거웠던 가상 머신( ex.`VM웨어` )를 경량화 해서 가볍게 가상머신을 만드는 일종의 툴입니다.
 - 작동 원리는 간단하게(?) 말하면, 게스트 OS를 만들지 말고, 마더 OS를 공유하고, 나머지 필요한 것들만 따로 하자라는 겁니다. 기존에 맥북에서 윈도우를 돌리려면, 가상 머신을 띄우고, 윈도우를 설치해서 돌려야만 했지요. 그런데, 만약에 맥에서 맥을 띄운다고 하면, 굳이 맥을 또 설치할 필요는 없을 겁니다. 그런 것처럼 공통된 OS, 공통된 무언가를 공유한다면, 도커를 사용해서 가상화 환경을 구축하면 됩니다.
 - 즉, 나중에 백엔드 개발자한테, `네가 만든 백엔드 환경 구축하려고 하는데, 도커 이미지 좀 보내줘` 한 다음, 이미지를 받아서 도커에서 실행하면, 백엔드 환경을 쉽게 구축 할 수 있습니다.
 - 이건 마치.. 우리가 `iOS 프로젝트`를 주고 받듯이, `백엔드 애플리케이션`을 주고 받는 겁니다!!! ~이게 진짜 혁명이예요..~
 - 그런데 사실.. 이미지를 개발자끼리 주고 받는 것이 진짜 목적은 아닙니다.
 - 나중에 `로드밸런싱`( 사용자가 몰려서 높아진 트래픽을 분산 처리하는 것 )을 할 때, `AWS`에서 서버를 쉽게 늘렸다가 줄였다가 하는데, 그때, 이 도커 덕분에 서버를 쉽게 늘렸다가 줄였다가 합니다.
 - 예를 들어, 우리 서비스 내에 어떤 이벤트를 계획하고 있어서, 사용자가 급증할 것으로 예상된다면, 옛날에는 실제 서버를 미리 구축해놓고, 사용자가 몰려 오는 것을 기다려야 했습니다. 그러나, 도커 덕분에 백엔드에서 설정만 해주면, 사용자가 일정 수준을 넘었을 때, 도커를 이용해 짧은 시간 내에 같은 서버를 여러대 만들 수 있습니다.
 - 더군다나, Node.js와 같이 서버 컴퓨터의 자원을 많이 차지하지 않는 WAS의 경우, 실존하는 한대의 서버에서 가상의 여러대의 서버를 구동시킬 수 있습니다.

## 도커 주요 내용
 - 도커는 컨테이너를 제공하는 소프트웨어 기술입니다.
 - 도커는 추가적인 추상 레이어 및 운영체제 레벨의 가상화의 자동화를 제공합니다.
 - 가볍고, 빠릅니다. ( OS를 들고 있지 않으므로 )
 - 각종 도커 이미지들을 손쉽게 구할 수 있다.
 - 도커 핵심 명령어 정리 : [https://gist.github.com/nacyot/8366310](https://gist.github.com/nacyot/8366310)


# DBMS : `Database Management System`

## DBMS 체험하기
 - 도커에 `MariaDB`를 설치해서 세팅해둔 `Sails.js`에서 이 DB에 접근해서 데이터를 저장하도록 합니다.

### `sample`

```javascript
# MariaDB Docker로 이미지 만들기$ docker run --name [이미지 이름] -d \-v [컴퓨터에 db파일을 저장할 경로]:/data/db \ -p 3306:3306 \-e MYSQL_ROOT_PASSWORD=1234 \ mariadb
# 만든 이미지 실행하기$ docker start [이미지 이름]
```

### `연습 예제`

```javascript
docker run --name fastcampus_maria_db -d \
-v/Users/sapsaldog/Downloads/db:/data/db \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=1234 \
mariadb
```

### `Sails.js`의 `config/datastores.js` 수정
 - Sails.js에서 API에 접근할 때, 위에 만들어둔 `MariaDB`에 접근하도록 수정합니다.

```javascript
module.exports.datastores = {
  default: {
    adapter: 'sails-mysql',
    url: 'mysql://root:1234@localhost:3306/test',
  },
};
```
 - 위와 같이 세팅한 후, `localhost:1337/user`하면, 데이터가 없습니다. 당연히 MariaDB에 데이터가 없기 때문에..
 - POST로 데이터를 저장하고, 아래의 DBeaver로 데이터를 확인해봅니다.

# DBeaver
 - [http://dbeaver.jkiss.org/](http://dbeaver.jkiss.org/)
 - Enterprise 버전으로 다운로드.
 - 각종 데이터 베이스의 쿼리를 날려볼 수 있다.

### `연습 예제`
 - `DBeaver`에서 새로운 커넥션을 생성하고, `Server Host`: `localhost`, `Port`: `3306`, `User name`: `root`, `Password`: `1234`으로 설정하고 연결한다.
 - `test`라는 테이블을 추가한다.

---

# File Upload Server 구현

## `Sails.js`의 `UploadController` 구현.

```javascript
module.exports = {
	index : function(req,res){
        sails.log('upload started')

        req.file('test').upload({
    // don't allow the total upload size to exceed ~10MB
    maxBytes: 10000000
  },function whenDone(err, uploadedFiles) {
      sails.log('upload done')
    if (err) {
      return res.negotiate(err);
    }

    // If no files were uploaded, respond with an error.
    if (uploadedFiles.length === 0){
      return res.badRequest('No file was uploaded');
    }

    if (err) return res.negotiate(err);
      return res.json({
          message: uploadedFiles.length + ' file(s) uploaded successfully!'
      })

  });
}

};
```

## `POSTMAN`에서 POST API 테스트

![postman.png](postman.png)


## `iOS` 프로젝트에서 구현
 - 이미지를 업로드하는 프로젝트 구현.
 - `Permission` 허용.
	 - `info.plist`의 `Privacy - Photo Library Usage Description` 활성화.

```swift
class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

// ... //
    
	@IBAction func buttonLoadImage(_ sender:UIButton) {
	    let picker = UIImagePickerController.init()
	    picker.sourceType = .photoLibrary
	    picker.allowsEditing = false
	    picker.delegate = self
	    DispatchQueue.main.async {
	        self.present(picker, animated: true, completion: nil)
	    }
	}
	    
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
	    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
	        let url = URL(string: "http://localhost:1337/upload")
	        var request = URLRequest(url: url!)
	        request.httpMethod = "POST"
	        
	        let boundary = "Boudndary-\(UUID().uuidString)"
	        request.setValue("multipart/form-data; charset=utf-8; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
	        request.httpBody = createBody(name: "test", boundary: boundary, data: UIImageJPEGRepresentation(pickedImage, 0.7)!, mimeType: "image/jpg", filename: "hello.jpg")
	        
	        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
	            guard let data = data
	                else { return }
	            
	            print("data: \(data)")
	            print("response: \(response!)")
	            print("error: \(String(describing: error))")
	        })
	        
	        task.resume()
	
	        self.navigationController?.popViewController(animated: true)
	    }
	    
	}
	    
	func createBody(name : String,
	                boundary: String,
	                data: Data,
	                mimeType: String,
	                filename: String) -> Data {
	    let body = NSMutableData()
	    
	    let boundaryPrefix = "--\(boundary)\r\n"
	    
	    body.appendString(boundaryPrefix)
	    body.appendString("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"\r\n")
	    body.appendString("Content-Type: \(mimeType)\r\n\r\n")
	    body.append(data)
	    body.appendString("\r\n")
	    body.appendString("--".appending(boundary.appending("--")))
	    
	    return body as Data
	}

// ... //

```

### Using `Alamofire`

```swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        uploadAlamofire(pickedImage: pickedImage)
        self.navigationController?.popViewController(animated: true)
    }
    
}
    
    
// MARK: Alamofire
@IBAction func almofireButtonAction(_ sender:UIButton) {
    let picker = UIImagePickerController.init()
    picker.sourceType = .photoLibrary
    picker.allowsEditing = false
    picker.delegate = self
    DispatchQueue.main.async {
        self.present(picker, animated: true, completion: nil)
    }
}
    
func uploadAlamofire(pickedImage : UIImage) {
    Alamofire.upload(
        multipartFormData: { multipartFormData in
            multipartFormData.append(UIImageJPEGRepresentation(pickedImage, 0.7)!, withName: "test", fileName:"test.jpg", mimeType: "image/jpg")
    },
        to: "http://localhost:1337/upload",
        encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    debugPrint(response)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
    }
    )
}
```

---

# REQUEST / RESPONSE
 - sails.js 컨트롤 함수.
 - 익스프레스 4.0 형식과 동일.
 - [https://expressjs.com/en/4x/api.html#req](https://expressjs.com/en/4x/api.html#req)
 - [http://next.sailsjs.com/documentation/reference/request-req](http://next.sailsjs.com/documentation/reference/request-req)

## req 주요 파라메터- req.body : request의 바디- req.header : reqeust의 헤더- req.cookies : request의 쿠키- req.method : request의 메서드 (GET, POST 등)
- req.params : request의 URL 파라메터
- (라우팅 설정에서 /user/:name 을 설정 한 경우 req.params.name 으로 :name을 접근 할 수 있음)

# RDBMS : `Relational Database Management System`
 - 관계형 모델(Relational Model)
 - 구조체(테이블 스키마 지칭)와 1차 술어논리로 구성된 언어(DB에서는 SQL을 지칭)를 사용하여 데이터를 다루는 접근법.
 - 관계 종류: 1. `일대일`, 2. `일대다 / 다대일`, 3. `다대다`
 - 대표적인 제품 : Oracle, MySQL, MariaDB, Sybase, Microsoft SQL Server,Access, etc.

## `DBMS` 기본 용어 - 스키마(schema), 테이블(table), 쿼리(query), 뷰(view), 행(row), 열(column), 기본키(primary key), 외래키(foreign key), 데이터형(data type)

# SQL : `Structered Query Language`- SQL구문은 몇 가지 주요 키워드로 구성돼 있어 쉽게 배울 수 있음- 특정 RDBMS에서만 쓸수 있는 SQL 구문도 존재 하지만 대부분은 공통적으로 쓸 수 있음 - 대소문자 구분 안함

## 주요 SQL Query문
```# 테이블 생성 - CREATE TABLE [테이블 이름] ([컬럼 이름] [자료형], ...);# 테이블 삭제 - DROP TABLE [테이블 이름]# 입력 - INSERT INTO [테이블 이름]([컬럼 이름], ...) VALUES([입력값], ...);# 조회 - SELECT [컬럼이름], ... FROM [테이블 이름] WHERE [조건식]# 수정 - UPDATE [테이블 이름] SET [컬럼 이름] = [수정할 값] WHERE [조건식]# 삭제 - DELETE [테이블 이름] WHERE [조건]
```

# Transaction
 - 트랜잭션.
 - 데이터베이스 관리 시스템의 상호작용의 단위.
 - 논리적 작업 단위(LUW, Logical Units of Work).
 - 목적 : 데이터베이스 완전성(integrity) 유지.

# NoSQL - RDBMS와 다르게 최초 생성시 데이터간 관계를 정의하지 않 음 (설계시 유연) - 명시적인 스키마가 존재하지 않음 - 대표적인 NoSQL: MongoDB, Redis, HBase 등

# Redis - 레디스. - [https://redis.io/](https://redis.io/) - 더 빠른 결과를 제공하기 위해 데이터를 메모리에 저장함. (메인 메모리의 처리 속도는 HDD의 800배, SSD의 40배 정도 빠름) - 인메모리 데이터 저장소 : redis vs memcached
 - K-V 방식의 access

# View & EJS
 - **EJS:** Effective JavaScript Templating
 - [http://ejs.co/](http://ejs.co/)
 - 마지막으로 `response` 패킷에 넣을 `HTML` 데이터를 조립.
 - `sails.js`는 `ejs`를 기본 `view engine`으로 채용.

## Serverside Rendering

### `GRUNT` - 자바스크립트의 테스크 러너
 - 자동화(Automation): 반복적인 일을 줄여주는데 사용
 - 수 많은 플러그인이 존재 - [https://gruntjs.com/plugins](https://gruntjs.com/plugins)
 - [https://gruntjs.com/sample-gruntfile](https://gruntjs.com/sample-gruntfile)

---
### 문서 끝 ( by 재성 )