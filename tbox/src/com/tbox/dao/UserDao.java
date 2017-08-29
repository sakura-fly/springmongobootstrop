package com.tbox.dao;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.tbox.model.User;

public interface UserDao  extends MongoRepository<User, ObjectId>, UserOperations{

}
