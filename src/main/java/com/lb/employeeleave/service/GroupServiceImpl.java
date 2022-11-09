package com.lb.employeeleave.service;

import com.lb.employeeleave.mapper.StatusMapper;
import com.lb.employeeleave.util.ExceptionConstants;
import com.lb.employeeleave.util.enums.EmployeeStatus;
import com.lb.employeeleave.dto.EmployeeDTO;
import com.lb.employeeleave.dto.GroupDTO;
import com.lb.employeeleave.entity.Employee;
import com.lb.employeeleave.entity.Group;
import com.lb.employeeleave.exceptions.DataConflictException;
import com.lb.employeeleave.exceptions.DataNotFoundException;
import com.lb.employeeleave.mapper.EmployeeMapper;
import com.lb.employeeleave.repository.GroupRepository;
import com.lb.employeeleave.security.ExtractUserAuthentication;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class GroupServiceImpl implements GroupService {

    private final GroupRepository groupRepository;

    public GroupServiceImpl(final GroupRepository groupRepository) {
        this.groupRepository = groupRepository;
    }

    /**
     * Get all groups Record
     *
     * @return List of groups
     */
    @Override
    public Page<Group> getAllGroups(Pageable pageable) {

        return groupRepository.findAll(pageable);
    }

    @Override
	public Group createGroup(Group group) {
		group = groupRepository.save(group);
		return group;
	}

    
}
