--join & foreign key 복습

--시퀀스
create sequence seq_board;

--부모테이블
create table board (bno number(3) constraint board_pk_bno primary key,
writer varchar2(30),subject varchar2(50),writeday date);

--게시글 board에 5개의 데이타 insert하자
insert into board values (seq_board.nextval,'오늘도 열심히','안녕하세요 오늘가입했어요',sysdate);
insert into board values (seq_board.nextval,'둘리','오늘 날씨 왜이래요?',sysdate);
insert into board values (seq_board.nextval,'해리포터','오늘 일어나기가 싫어요',sysdate);
insert into board values (seq_board.nextval,'앤','점심 머먹지?',sysdate);
insert into board values (seq_board.nextval,'길동이','여기 진짜 볼거 많네요',sysdate);
insert into board values (seq_board.nextval,'캔디','오늘 합격 기다립니다',sysdate);

commit;

--자식테이블
--부모글 지우면 그글에 달린 댓글은 자동으로 삭제되도록 설정
create table answer (num number(5) constraint answer_pk_num primary key,
bno number(3) constraint answer_fk_bno references board(bno) on delete cascade,
nickname varchar2(30),content varchar2(100));

--원하는 글번호에 댓글 추가
insert into answer values(seq_board.nextval,4,'먹방찍자','오늘은 초밥먹는날');
insert into answer values(seq_board.nextval,1,'병아리','반가워요 저도오늘 가입중');
insert into answer values(seq_board.nextval,3,'나대지마라','오늘도 열심히');
insert into answer values(seq_board.nextval,1,'누나','반가워요~~');
insert into answer values(seq_board.nextval,5,'나나','그쵸~~헤어날수가 없어요');
insert into answer values(seq_board.nextval,5,'도도','이낙에 삽니다');
commit;

--JOIN으로 출력
--bno(글번호) writer(작성자) subject(제목) nickname(댓글단사람) content(댓글내용) writeday(월글올린날짜)

select b.bno 글번호,b.writer 작성자,b.subject 제목,a.nickname 댓글단사람,a.content 댓글내용,b.writeday 원글올린날짜
from board b,answer a
where b.bno=a.bno;




select * from board;
select * from answer;