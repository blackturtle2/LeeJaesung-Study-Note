# 패스트캠퍼스 강의 노트 44th ( 20170719 )

# `#Network`

# HTTP
 - `HTTP RESPONSE MESSAGE` - `메시지 본문`에 우리가 사용할 데이터가 있다.
 - `HTTP RESPONSE CODE`
	 - **한줄요약:** `400 에러`일 때, 우리(클라이언트)가 잘못했다. (...)
	 - `100 코드`: 처리 경과 상황 통지.
	 - `200 코드`: 정상 종료.
	 - `300 코드`: 무언가 다른 조치가 필요함.
	 - `400 코드`: 클라이언트 오류
	 - `500 코드`: 서버 오류

## GET
 - **한줄요약:** 데이터를 달라고(Get) 요청하는 것.
 - `Parameter`를 주소에 넣으므로, 웹브라우저에서 보임.
 - 많은 양의 `Parameter`를 보내기에 부적합.

## POST
 - **한줄요약:** 데이터를 넣으라고(Post) 요청하는 것.
 - `Parameter`를 `body`에 넣으므로, 눈으로는 볼수 없음.
 - 다량의 데이터를 보낼 수 있음.
 - `GET`은 웹브라우져에서 볼 수 있고, `POST`는 그렇지 않다.

## Cookie &  Session
 // `쿠키`는 웹사이트에 접속하면, 클라이언트 웹브라우저에 남겨지는 데이터이고, 세션과의 차이점을 설명할 수 있어야 합니다. ~면접 초필수 질문~

 - **쿠키:** 지정된 내용을 고스란히 `클라이언트(Client)`측의 컴퓨터에 남겨놓아 필요시에 사용하는 서버와의 연결고리입니다.
	 - 서버가 클라이언트에 `과자 부스러기`를 남기고 갔다고 비유하여 `쿠키`라고 부릅니다.
	 - 클라이언트는 쿠키에 데이터를 저장해서 사용하다가 필요할 때, 서버에게 데이터를 요청해서 갱신합니다.
	 - 그러나 로컬 즉, 웹브라우저에 그대로 남겨져 있어서.. 보안에 취약한 점이 있고, 그래서 ~스마트하고 대단한 컴돌이들은~ `세션`을 만듭니다.
 - **세션:** 지정한 정보들을 `서버(Server)` 쪽에 남겨두고 `세션 정보(a.k.a 세션의 고유키)`만을 클라이언트(Client)쪽에 남겨두어 보안성에서 조금 더 나은 방식의 연결고리입니다.
	 - 케이스에 따라서 필요시에 클라이언트 쪽에 세션의 고유키 값을 저장하고 있는 쿠키를 불러오도록 요청 → 클라이언트는 쿠키에서 해당 세션 고유키를 서버에 전달 → 서버는 해당하는 세션을 찾아서 리턴.
 - **한줄요약 1:** `쿠키는 클라이언트에 저장되고, 세션은 서버에 저장된다.`
 - **한줄요약 2:** `세션은 서버 메모리에 저장되지만, 세션의 키 역시 클라이언트에 쿠키로 저장된다.`

### ★ 재성's 마음대로 정리하는 쿠키와 세션 ★
 - 네트워크라는 것은 항상 빠르다는 보장을 갖고 있지 않습니다. 그래서 임시 데이터를 로컬(클라이언트)에 저장하는 것이 필요하고, 그 필요에 의해 등장한 것이 `쿠키`입니다.
 - **쿠키** 는 클라이언트와 서버 간에 요청, 응답하는 과정에서 포함되는 단순한 `텍스트 정보`입니다. 일반적인 브라우저에서 최대 `4KB`의 텍스트 정보를 담을 수 있고, 하나의 사이트는 20개만 허용되며, 모든 사이트를 통틀어 브라우저 1개에는 300개의 쿠키를 담을 수 있습니다.
 - 만약, 위의 범위를 넘어서면, 브라우저는 가장 오래된 쿠키부터 삭제시키고, `4KB`의 적은 텍스트만 허용되기 때문에 `최근 읽은 글`, `최근 본 상품`, `장바구니` 같은 데이터들을 저장합니다.
 - 웹브라우저만 접근할 수 있다면, 쿠키에도 접근이 가능하므로 보안 상 취약하기 때문에 쿠키에는 절대(!) 위험한 정보는 저장하지 않습니다.
 - **세션** 은 일정 시간 동안 사용자(브라우저)로부터 들어오는 요청을 하나의 상태로 보고, 그 상태를 일정하게 유지시킵니다. 이 세션 덕분에 사용자가 의도치 않은 로그아웃을 하더라도 곧바로 사이트에 접속하면, 서버의 설정에 따라 해당되는 정보를 그대로 받아올 수 있습니다.


# Web Server & App Server
 - **한줄요약:** `서버는 Request를 받아서 Response를 준다.`

## Process & Thread
 - `프로세스`는 일종의 프로그램이며, 1개의 프로세스가 실행 된다는 것은 1개의 프로그램이 실행 된다는 뜻입니다. CPU에 의해 실행되는 컴퓨터 프로그램의 인스턴스입니다.
 - `쓰레드`는 프로세스에게 병렬 처리 수단을 제공하며, 프로세스는 하나 이상의 쓰레드를 소유하고 있습니다.

## Web Server & App Server
 - **WEB 서버** 는 `HTML 문서` 같은 `정적 컨텐츠`를 처리하는 것이고 (HTTP 프로토콜을 통해 읽힐 수 있는 문서)
 - **WAS 서버** 는 `asp`, `php`, `jsp` 등 `개발 언어`를 읽고 처리하여 `동적 컨텐츠, 웹 응용 프로그램 서비스`를 처리하는 것이다.

### `Web Server`
 - HTTP 프로토콜을 다룸.
 - 주로 `Static contents` 처리. ( feat. 정적 데이터 )
 - Forward Proxy와 Reverse Proxy 지원.
 - `nginx(엔진엑스)`, `apache(아파치)`

### `App Server`
 - **WAS(Web Application Server)** 라고도 함.
 - 비지니스 `로직`을 처리.
 - 주로 `Dynamic contents` 담당. ( feat. 동적 데이터 )
 - `HTTP` 메시지 통신을 주로 하지만, `CGI`를 사용하기도 함.

### `CGI` ( Common Gateway Interface ) - 웹서버를 위한 표준 프로토콜.
 - 웹서버는 `CGI`를 통해서 **Application** (예: 콘솔 어플리케이션)을 실행 -> Application은 `request`를 가지고 `response`를 생성 후 `response`를 웹서버로 전송 -> 이러한 Application을 `CGI script` 혹은 `CGIs`라고 함.
 - `perl`, `php`가 대표적인 CGIs Language.
 - `python`은 `wsgi`. ( Web Server Gateway Interface )
 - `ruby`는 `rack`. ( Ruby web server interface )
 - `node.js`는 `One thread application`으로 `Gateway Interface`가 필요 없음. ( 하지만 굳이 cgi 방식으로 돌리겠다는 node.js cgi 라이브러리가 존재함. )


# RESTful API
 - : `Representational State Transfer API`

## `RESTful API` ★★★★★ - 정의 : `Request` 메서드의 동사를 사용하여 데이터를 `CRUD` 하는 것.
	 - **CRUD :** `Create(생성)`, `Read(읽기)`, `Update(갱신)`, `Delete(삭제)`
 - `GET /boat` -> boat 테이블의 목록 제공. `/boat/find`
 - `GET /boat/:id` -> boat 테이블의 특정 id를 갖는 데이터 제공. `/boat/find/:id`
 - `POST /boat` -> boat 테이블에 데이터 추가. `/boat/create`
 - `PATCH /boat/:id` -> boat 테이블에 특정 id를 갖는 데이터 수정. `/boat/update/:id`
 - `DELETE /boat/:id` -> boat 데이블에 특정 id를 갖는 데이터 삭제. `/boat/destory/:id`
 - 장점 : 편하다. (규약은 설정보다 편하다)
 - 단점 : 보안에 취약 할 수 있음.

## `Sails.js`
 - **100%** `JavaScript` Full stack web framework.
 - `Waterline ORM` ( 모든 데이터베이스 지원 )
 - `Express` 기반. ( feat. Node.js Framework )
 - `REST API` 자동 생성.
 - `Socket.IO` 웹소켓 내장.
 - [Sails.js | Realtime MVC Framework for Node.js](https://sailsjs.com)

### `sails js` 설치 & 프로젝트 초기화
```
# sails js 설치$ npm install sails@beta -g

# sails project 생성$ sails new hello# sails api 생성$ cd hello$ sails generate api User
```

### `Model` 수정
 - `api/models/User.js` 수정.
 - Sails.js가 `Database` 구조와 `API`를 자동으로 생성합니다.

```javascript
module.exports = {

  attributes: {
  	email: {
  		type: 'string', 
  		required: true,
  		unique: true,
  		isEmail: true
  	},
  	password: {
  		type: 'string'
  	}
  },

};
```

### `REST API` 활성화
 - `config/blueprints.js` 수정.
 - Rest API를 열어줍니다.

```javascript
module.exports.blueprints = {
  actions: true,
  rest: true,
```

### 서버 실행
 - 서버도 일종의 프로그램이 실행되는 것이므로 서버를 열어줍니다(실행합니다).

```javascript
$ sails lift
```

### 웹브라우저 & 포스트맨 확인
 - 서버가 잘 열렸고, API가 잘 활성화 되었는지 체크합니다.

```javascripthttp://localhost:1337http://localhost:1337/user
```

### `Route` 활성화
 - `config/routes.js` 수정.
 - Route를 통해, 특정 API 요청이 들어왔을 때, 어디어디로 가라고 지정해줍니다.
 - 네트워크 장비인 `라우터`와는 다르게 여기서는 어느 `메소드`로 가라고 지정해줍니다.

```javascript
module.exports.routes = {

  '/': {
    view: 'homepage'
  },

  "GET /": {view: "homepage"},
  "POST /foo/bar": {controller: "FooController", action: "bar"}
```

 - `api/controllers/FooController.js` 생성.
 - Route에서 지정한 컨트롤러를 만들어두고, 액션을 정의합니다.

```javascript
module.exports = {
	bar : function(req, res){
		res.ok()	
	}
};
```


---

# `REFERENCE`
 - `[PHP]세션과 쿠키 / 지식iN` → [바로가기](http://kin.naver.com/open100/detail.nhn?d1id=1040203&dirId=1&docId=800439)
	 - 세션은 로컬, 쿠키는 서버.
 - `Kurien's Blog / 쿠키, 세션, 캐시 어떤 차이점이 있는걸까?` → [바로가기](http://blog.kurien.co.kr/544)
	 - **★강추★** 캐시, 쿠키, 세션에 대해 잘 파악할 수 있습니다.
	 - `사용자의 브라우저`에 저장되는 것이 `쿠키`.
	 - `세션`은 `서버에 저장되는 쿠키`.
	 - `캐시`는 웹사이트에 접속했을 때, 로컬에 저장하는 image, css 등의 데이터.
 - `프로그래머의 블로그 / 쿠키(cookie)와 세션(Session)` → [바로가기](http://genesis8.tistory.com/220)
 - `OKKY - WEB 서버, WAS 서버` → [바로가기](https://okky.kr/article/243427)
	 - `JSP`를 배울 때 대체적으로 `Apache`와 `Tomcat`을 사용한다. `Apache`는 `웹서버`를 담당하고 `Tomcat`은 `WAS`이다.
 - `세션 - 위키백과, 우리 모두의 백과사전` → [바로가기](https://ko.wikipedia.org/wiki/세션)
 - `CRUD - 위키백과, 우리 모두의 백과사전` → [바로가기](https://ko.wikipedia.org/wiki/CRUD)
	 - Create, Read, Update, Delete.
 - `Download | Node.js` → [바로가기](https://nodejs.org/en/download/)
 - `HAProxy 와 Nginx 의 로드밸런싱` → [바로가기](http://seokjun.kr/haproxy-and-nginx-load-balancing/)
	 - ~제가 존경하는 개발자분이~ 정리하신 `Reverse Proxy`를 기반으로하는 `HAProxy`를 `Nginx`와 비교한 글입니다. `thx, alma.`

# `오늘의 깨알팁`
 - 터미널, 노드에서 빠져나오기: <kbd>ctrl</kbd> + <kbd>c</kbd>


---
### 문서 끝 ( by 재성 )