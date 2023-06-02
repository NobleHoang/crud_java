package com.example.jpademp.dao;

import com.example.jpademp.entity.UserEntity;
import com.example.jpademp.util.PersistenceUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.List;

public class UserDAO {
    EntityManager em;
    EntityTransaction tran;
    public UserDAO (){
        em = PersistenceUtil.getEntityManagerFactory().createEntityManager();
        tran = em.getTransaction();
    }

    public void insertUser(UserEntity user){
        try {
            tran.begin();
            em.persist(user);
            tran.commit();
        } catch (Exception ex){
            System.out.println(ex.getMessage());
            tran.rollback();
        }
    }

    public List<UserEntity> getAllUsers() {
        try {
            Query query = em.createQuery("Select a from UserEntity as a");
            return query.getResultList();
        } catch (Exception ex) {
            System.out.println();
        }
        return null;
    }

    public UserEntity getUser(int id) {
        try {
            Query query = em.createQuery("SELECT a FROM UserEntity a WHERE a.id = :id");
            query.setParameter("id", id);
            return (UserEntity) query.getSingleResult();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public void updateUser(UserEntity userEntity) {
        try {
            em.getTransaction().begin();

            em.merge(userEntity);

            em.getTransaction().commit();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println(ex.getMessage());
        }
    }

    public void deleteUser(int userId) {
        try {
            em.getTransaction().begin();

            UserEntity userEntity = em.find(UserEntity.class, userId);
            if (userEntity != null) {
                em.remove(userEntity);
                em.getTransaction().commit();
            } else {
                throw new IllegalArgumentException("User not found with ID: " + userId);
            }
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println(ex.getMessage());
        }
    }
}
