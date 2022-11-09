package com.lb.employeeleave.service;

import com.lb.employeeleave.entity.Group;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
public interface GroupService {

    Page<Group> getAllGroups(Pageable pageable);

    Group createGroup(Group Group);

    
}
