package uk.gov.digital.ho.hocs.info.domain.entity;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import uk.gov.digital.ho.hocs.info.domain.entity.dto.EntityDto;
import uk.gov.digital.ho.hocs.info.domain.entity.dto.GetCaseSummaryFieldsResponse;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@Slf4j
@RestController
class EntityResource {

    private final EntityService entityService;

    @Autowired
    public EntityResource(EntityService entityService) {
        this.entityService = entityService;
    }

    @GetMapping(value = "/caseType/{caseType}/summary", produces = APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<GetCaseSummaryFieldsResponse> getCaseSummary(@PathVariable String caseType) {
        Set<Entity> entities = entityService.getBySimpleName("caseType", caseType, "summary");
        return ResponseEntity.ok(GetCaseSummaryFieldsResponse.from(entities));
    }

    @GetMapping(value = "/entity/list/{name}", produces = APPLICATION_JSON_UTF8_VALUE)
    @Cacheable(value = "getEntitiesForListName", unless = "#result == null", key = "#name")
    public ResponseEntity<List<EntityDto>> getEntitiesForListName(@PathVariable String name) {
        List<Entity> entities = entityService.getByEntityListName(name);
        return ResponseEntity.ok(entities.stream().map(EntityDto::from).collect(Collectors.toList()));
    }


}