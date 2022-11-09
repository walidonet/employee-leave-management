package com.lb.employeeleave.service;

import com.lb.employeeleave.dto.EmployeeDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;

public interface EmployeeService {

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
    Page<EmployeeDTO> getAllEmployees(Pageable pageable);

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
    EmployeeDTO retrieveAuthenticatedEmployee();

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
    EmployeeDTO getEmployeeById(Long id);

    // only allowed to admin
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    EmployeeDTO createEmployee(EmployeeDTO employeeDTO);

    // only allowed to admin
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    EmployeeDTO updateEmployee(EmployeeDTO employeeDTO);

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
    EmployeeDTO updatePassword(String oldPassword, String newPassword);

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
    List<EmployeeDTO> getAllEmployeeUnderSupervision(Long id);

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
    Page<EmployeeDTO> getAllEmployeesByName(Pageable pageable, String fullName);

}
