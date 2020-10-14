# 패스트캠퍼스 강의 노트 2nd ( 20170509 )

# Git

## Git의 구조
> work space
> 
>  → (add) → index (stage)
> 
>  → (commit) → local repository
> 
>  → (push / pull) → remote repository

1.  `Work Space`
    1.  현재 작업 장소
2.  `index`
    1.  work space에서 내부저장소에서 가기 전 중간 단계 공간
3.  `내부 저장소 (local repository)`
4.  `외부 저장소 (remote repository)`

## GitHub 메모
1.  커밋을 때리고, `HEAD`는 사용자가 **현재 바라보고 있는 곳**을 가리킨다.
2.  `체크아웃`은 브랜치를 옮겨 타서 HEAD를 바꾼다는 것을 의미한다.
3.  현재 작업 중인 브랜치가 `master` 일 때, merge develop 하면, master에게 develop를 머지하는 것이다. // **현재 작업 브랜치를 유의할 것**

## GitHub 실습 메모
1. `cd ~` : change directory
2. `clear` : 클리어
3. `ls` : 리스트
4. ".”은 현재 디렉토리를 의미합니다.
5. `cd` 를 치고 스페이스바 후에 `git` 치고 `Tab` 버튼을 누르면, 알아서 입력된다.
6. `vi` 로 vi 에디터를 이용해 `newfile` 를 만든다.
7. `add`하고, `commit`하고, 다시 `add`하고, `commit`하고 반복.
8. `add .` 이렇게 하면, 폴더 전체 내용이 add 된다.
9. `git commit -m “하고 싶은 말”` 이렇게 하면, 코멘트를 달 수 있다.
10. `-` 짝대기는 옵션을 뜻한다.
11. `git reflog` 하면, 모든 커밋 상태를 볼 수 있다.

// 실습 정리

1.  git을 맥에 설치하고, name과 email을 세팅한다. // 한번만 하면 되므로 외울 필요는 없고, ~인터넷 찾아보고~ 해보면 된다.
2.  `cd ~` 로 홈 폴더로 이동한다.
3.  `cd “폴더 이름”` 으로 작업 폴더로 이동한다.
4.  `git init` 으로 깃을 초기화한다. // 저장소를 만드는 작업.
5.  `vi` 에디터로 파일 하나를 만들어본다. // `i` 입력으로 타이핑 하고, `esc` 입력하여, 명령을 빠져 나온 뒤, `:wq`로 저장하고, 빠져나온다.
6.  `git add .` 명령어로 폴더 내용 전체를 add 한다. // add 뒤에 파일명을 입력해서 파일 하나만 add 할 수도 있다.
7.  `git commit -m “코멘트 내용”` 으로 커밋을 하면서 코멘트를 작성한다.
8.  `git status` 로 git 상태를 확인해본다.
9.  `git reflog` 로 모든 커밋 내용을 확인할 수 있다.
10. `git remote / push`
11. `git remote add origin https://github.com/blackturtle2/Leejaesung_iOS_School.git`
12. `git push -u origin master`
13. `gitignore.io`: 여기에서 swift, ios 등으로 검색. 푸시를 무시할 파일을 정의할 수 있다.
14. `Bitbucket`은 private repo 를 주고, 그래서 많이 사용함.
15. `commit`은 최소 하루 한번 실행한다. `push`는 작업이 완성되었다고 생각할 때 실행한다.

---
### 문서 끝 ( by 재성 )