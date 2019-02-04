package aaa.bbb.ccc.util;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import aaa.bbb.ccc.vo.MemberVO;

@Service
public class MemberServiceImple implements MemberService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.memberMapper";

	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		return mDAO.selectOne(ns+".memberDetail", mvo) ;
	}
	@Override
	public MemberVO idcheck(MemberVO mvo) {
		return mDAO.selectOne(ns+".idcheck", mvo) ;
	}
}