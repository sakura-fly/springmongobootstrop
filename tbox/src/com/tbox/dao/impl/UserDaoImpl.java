package com.tbox.dao.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.tbox.dao.UserOperations;
import com.tbox.model.User;

public class UserDaoImpl implements UserOperations {

	@Autowired
	private MongoOperations mongo;
	@Override
	public User findByUser(User u) {

		return mongo.findOne(Query.query(Criteria.where("userName").is(u.getUserName()).and("pwd").is(u.getPwd())),
				User.class, "uuser");
	}

}
