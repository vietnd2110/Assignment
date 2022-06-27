package com.asm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.asm.entities.Accounts;

@Repository
public interface AccountRepository extends JpaRepository<Accounts, Integer> {
	@Query("SELECT acc FROM Accounts acc WHERE username = ?1")
	Accounts findByUser(String username);
}
