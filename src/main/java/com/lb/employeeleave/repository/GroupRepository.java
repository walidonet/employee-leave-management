package com.lb.employeeleave.repository;

import com.lb.employeeleave.entity.Group;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface GroupRepository extends JpaRepository<Group, Long> {

    @Override
    Page<Group> findAll(Pageable pageable);
}
