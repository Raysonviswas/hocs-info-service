package uk.gov.digital.ho.hocs.info.deadline;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uk.gov.digital.ho.hocs.info.entities.Deadline;
import uk.gov.digital.ho.hocs.info.entities.Sla;
import uk.gov.digital.ho.hocs.info.exception.EntityNotFoundException;
import uk.gov.digital.ho.hocs.info.exception.EntityPermissionException;
import uk.gov.digital.ho.hocs.info.repositories.HolidayDateRepository;
import uk.gov.digital.ho.hocs.info.repositories.SlaRepository;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
public class DeadlinesService {

    private final SlaRepository slaRepository;
    private final HolidayDateRepository holidayDateRepository;

    @Autowired
    public DeadlinesService(SlaRepository slaRepository, HolidayDateRepository holidayDateRepository) {
        this.slaRepository = slaRepository;
        this.holidayDateRepository = holidayDateRepository;
    }

    Set<Deadline> getDeadlines(String caseType, LocalDate receivedDate) throws EntityPermissionException, EntityNotFoundException {
        log.info("Requesting deadlines for caseType {} with received date of {} ", caseType, receivedDate);
        if (caseType != null && receivedDate != null) {
            Set<Date> dates = holidayDateRepository.findAllByCaseType(caseType);
            Set<LocalDate> holidays = dates.stream().map(Date::toLocalDate).collect(Collectors.toSet());
            Set<Sla> slas = slaRepository.findAllByCaseType(caseType);
            return slas.stream().map(sla -> new Deadline(receivedDate, sla, holidays)).collect(Collectors.toSet());
        } else {
            throw new EntityNotFoundException("CaseType or received date was null!");
        }
    }
}