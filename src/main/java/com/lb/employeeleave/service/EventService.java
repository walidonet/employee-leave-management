package com.lb.employeeleave.service;

import com.lb.employeeleave.dto.EventDTO;
import com.lb.employeeleave.entity.Event;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;

@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_RH','ROLE_HSE')")
public interface EventService {

    Page<Event> getAllEvents(Pageable pageable);

    EventDTO getEventsById(Long id);

    Event createEvent(Event event);

    EventDTO updateEvent(EventDTO eventDTO);

    List<EventDTO> retrieveLeaveAndEventsByDate(String dateFrom, String dateTo);
}
