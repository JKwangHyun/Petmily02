package aaa.bbb.ccc.util;

import aaa.bbb.ccc.vo.MemberVO;

public interface MemberService {
	MemberVO memberDetail(MemberVO mvo);
	
	MemberVO idcheck(MemberVO mvo);
}