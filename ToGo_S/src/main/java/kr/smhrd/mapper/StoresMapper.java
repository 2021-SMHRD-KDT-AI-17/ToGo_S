package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Stores;

@Mapper
public interface StoresMapper {

	public Stores storeLogin(Stores store);


}
