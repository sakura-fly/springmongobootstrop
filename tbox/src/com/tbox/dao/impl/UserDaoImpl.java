package com.tbox.dao.impl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.tbox.dao.UserOperations;
import com.tbox.model.User;

public class UserDaoImpl implements UserOperations {
	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext-mongo.xml");
	MongoOperations mongo = (MongoOperations) ctx.getBean("mongoTemplate");
	
	
	// @Autowired
//	 private MongoOperations mongo;
	@Override
	public User findByUser(User u) {
//		ctx.cl
		return mongo.findOne(Query.query(Criteria.where("userName").is(u.getUserName()).and("pwd").is(u.getPwd())),
				User.class, "uuser");
	}

}
