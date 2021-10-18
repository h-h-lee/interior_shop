package kr.spring.category_sub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.category_sub.dao.Category_subMapper;
import kr.spring.category_sub.vo.Category_subVO;

@Service
@Transactional
public class Category_subServiceImpl implements Category_subService{
	
	@Autowired
	private Category_subMapper category_subMapper;
	
	@Override
	public void insertCategory_sub(Category_subVO category_sub) {
		category_sub.setC_sub_no(category_subMapper.selectC_sub_no());
		category_subMapper.insertCategory_sub(category_sub);
	}

	@Override
	public List<Category_subVO> selectCategory_sub() {
		return category_subMapper.selectCategory_sub();
	}

	@Override
	public void updateCategory_sub(Category_subVO category_sub) {
		
	}

	@Override
	public void deleteCategory_sub(Category_subVO category_sub) {
		
	}

	@Override
	public List<Category_subVO> category_subSelectAll() {
		return category_subMapper.category_subSelectAll();
	}

	
}
