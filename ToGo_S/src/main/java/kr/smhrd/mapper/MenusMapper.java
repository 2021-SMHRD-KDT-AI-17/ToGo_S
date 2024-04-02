package kr.smhrd.mapper;

import java.awt.Menu;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Menus;

@Mapper
public interface MenusMapper {

	List<Menu> getMenuList(String store_id);

	void updateMenu(Menus menu);
	
	void insertMenu(Menus menu);
	
	
	
	
	
	
    }

	


