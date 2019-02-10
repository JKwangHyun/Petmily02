package aaa.bbb.ccc.util;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class AdoptionServiceImple implements AdoptionService {

	@Inject
	private SqlSession mDAO ;
	
	private static final String ns ="banana.apple.mapper.adoptionMapper";

	@Override
	public int registration(Map<String, Object> map) {
		return mDAO.insert(ns+".registration",map);
	}
}