package uk.gov.digital.ho.hocs.info.Minister;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uk.gov.digital.ho.hocs.info.entities.Minister;
import uk.gov.digital.ho.hocs.info.repositories.MinisterRepository;

import java.util.Set;

@Service
@Slf4j
public class MinisterService {

    private final MinisterRepository ministerRepository;

    @Autowired
    public MinisterService(MinisterRepository ministerRepository) {
        this.ministerRepository = ministerRepository;
    }

    public Set<Minister> getMinisters() {
        log.debug("Requesting all ministers");
        return ministerRepository.findAll();
    }
}