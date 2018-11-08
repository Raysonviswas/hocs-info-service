package uk.gov.digital.ho.hocs.info.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import uk.gov.digital.ho.hocs.info.entities.Template;

import java.util.List;
import java.util.UUID;

@Repository
public interface TemplateRepository extends CrudRepository<Template, String> {

    @Query(value = "SELECT t.* FROM template t WHERE t.case_type = ?1 AND t.deleted = FALSE", nativeQuery = true)
    Template findActiveTemplateByCaseType(String caseType);

    Template findTemplateByUuid(UUID templateUUID);

    @Query(value = "SELECT t.* FROM template t WHERE t.display_name = ?1 AND case_type = ?2 AND t.deleted = FALSE", nativeQuery = true)
    Template findTemplateByDisplayNameAndCaseType(String caseType, String displayName);
}
