package com.DAO;

import java.util.List;

import com.entity.Item_Order;

public interface ItemOrderDAO {
	
	
	public boolean saveOrder(List<Item_Order> b);
	
	public List<Item_Order> getBook(String email);
	
	public List<Item_Order> getAllOrder();

}
