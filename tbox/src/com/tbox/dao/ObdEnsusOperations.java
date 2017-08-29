package com.tbox.dao;



import java.util.List;

import com.tbox.model.Ensus;
import com.tbox.model.Page;

public interface ObdEnsusOperations  {
	public Page<Ensus> findAll(Page<Ensus> page);
	public List<Ensus> finaAll();
}  
