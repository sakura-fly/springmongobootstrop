package com.tbox.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.tbox.dao.ObdEnsusOperations;
import com.tbox.model.Ensus;
import com.tbox.model.Page;
import com.tbox.util.MongodbInfo;

@Repository("ObdEnsusDaoImpl")  
public class ObdEnsusDaoImpl implements ObdEnsusOperations {
	
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-mongo.xml");
	MongoOperations mongo = (MongoOperations) ctx.getBean("mongoTemplate");
//	@Autowired
//	MongoOperations mongo;
	


	@Override
	public Page<Ensus> findAll(Page<Ensus> page) {
		try {
			Query q = new Query();
			q.skip((page.getPageNum() - 1) * page.getPageSize());
			q.limit(page.getPageSize());
			q.with(page.getSort());
			List<Ensus> ensus = mongo.find(q, Ensus.class, MongodbInfo.ENSUS);
			long total = mongo.count(q, MongodbInfo.ENSUS);
			page.setPageTotal((int) Math.ceil((double) total / (double) page.getPageSize()));
			page.setContent(ensus);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return page;
	}


	@Override
	public List<Ensus> listAll() {
		try {
			return mongo.findAll(Ensus.class, MongodbInfo.ENSUS);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ArrayList<>();
		}
	}

}
