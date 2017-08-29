package com.tbox.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Query;

import com.tbox.dao.ObdEnsusOperations;
import com.tbox.model.Ensus;
import com.tbox.model.Page;
import com.tbox.util.MongodbInfo;

public class ObdEnsusDaoImpl implements ObdEnsusOperations {

	@Autowired
	MongoOperations mongo;


	@Override
	public Page<Ensus> findAll(Page<Ensus> page) {
		Query q = new Query();
		q.skip((page.getPageNum() - 1) * page.getPageSize());
		q.limit(page.getPageSize());
		q.with(page.getSort());
		List<Ensus> ensus = mongo.find(q, Ensus.class, MongodbInfo.ENSUS);
		long total = mongo.count(q, MongodbInfo.ENSUS);
		page.setPageTotal((int) Math.ceil((double) total / (double) page.getPageSize()));
		page.setContent(ensus);
		return page;
	}


	@Override
	public List<Ensus> finaAll() {
		return mongo.findAll(Ensus.class, MongodbInfo.ENSUS);
	}

}
