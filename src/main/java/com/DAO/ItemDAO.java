package com.DAO;

import java.util.ArrayList;
import java.util.List;

import com.entity.ItemDtls;

public interface ItemDAO {

	public boolean addBooks(ItemDtls b);

	public List<ItemDtls> getAllBooks();

	public ItemDtls getBookById(int id);

	public boolean updateEditBooks(ItemDtls b);

	public boolean deleteBooks(int id);

	public List<ItemDtls> getNewBook();

	public List<ItemDtls> getRecentBooks();

	public List<ItemDtls> getOldBooks();
	
	public List<ItemDtls> getAllRecentBook();
	
	public List<ItemDtls> getAllNewBook();
	
	public List<ItemDtls> getAllOldBook();
	
	public List<ItemDtls> getBookByOld(String email,String cate);

	public boolean oldBookDelete(String email,String cat,int id);
	
	
	public List<ItemDtls> getBookBySerch(String ch);


}
