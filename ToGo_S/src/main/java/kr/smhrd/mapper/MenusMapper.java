package kr.smhrd.mapper;

import java.awt.Menu;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MenusMapper {

	List<Menu> getMenuList(String store_id);

}
