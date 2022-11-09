package com.lb.employeeleave.controller;

import com.lb.employeeleave.service.GroupService;
import com.lb.employeeleave.entity.Group;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/groups")
public class GroupController {

    private static final Logger LOGGER = LoggerFactory.getLogger(GroupController.class);

    private final GroupService groupService;

    public GroupController(final GroupService groupService){
        this.groupService = groupService;
    }

   @GetMapping
	public ResponseEntity<?> getAllGroups(@PageableDefault(page = 0, size = 10, sort = "groupName", direction = Sort.Direction.DESC) Pageable pageable) {
		return ResponseEntity.ok().body(groupService.getAllGroups(pageable));
	}

    @PostMapping
	public ResponseEntity<Group> insertProject(@RequestBody Group group) {
		return ResponseEntity.ok().body(groupService.createGroup(group));
	}

}
