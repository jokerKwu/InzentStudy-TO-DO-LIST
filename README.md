# TO-DO LIST
One Paragraph of project description goes here

## Getting Started

Run on Server the index.jsp file

### Development environment

MYSQL 5.7<br>
JDK 설치(ver 1.8)<br>
이클립스 설치<br>
tomcat 설치(ver 8.5)<br>




### Development order

1. 프로젝트는 maven프로젝트로 생성합니다.
2. 제공된 테이블 생성 SQL을 이용해서 테이블을 생성합니다.
3. TodoDto 클래스와 TodoDao클래스를 주어진 스펙에 맞게 작성합니다.
4. 메인화면을 보여주기 위한 MainServlet과 main.jsp를 작성합니다.
5. MainServlet은 TodoDao를 이용해 결과를 조회해서 main.jsp 에 전달합니다.
6. 새로운todo등록 버튼을 클릭하면 해당 요청을 서블릿이 받아서 jsp로 포워딩하여 할 일 등록 화면을 보여줍니다.
7. 할일등록폼에서 값을 입력하고 제출 버튼을 누르면 post 방식으로 요청하게 합니다.
8. 해당 요청을 서블릿이 받아서 처리하게하고, 요청에 대한 모든 일이 끝나면 메인화면으로 리다이렉트 합니다.
9. 메인화면에서 todo 상태변경 버튼(->)을 클릭하여 요청을 보낼 때, Todo 의 Id와 상태값을 전달하여 다음 상태로 (현재 상태가 Todo라면 doing으로 doing 이라면 done) 상태를 나타내는 컬럼값을 변경하고 응답결과로 "success"를 보냅니다.


### Application Main Logic
1. 일정을 관리하는 테이블에 해당되는 DTO 파일 생성
2. DB에 접근하는 DAO 파일 생성
3. 해당 페이지를 처리하는 jsp 파일 따로 관리



