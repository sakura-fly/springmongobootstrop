package com.tbox.dao;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.tbox.model.Ensus;

public interface ObdEnsusDao extends MongoRepository<Ensus, ObjectId>, ObdEnsusOperations {
}
