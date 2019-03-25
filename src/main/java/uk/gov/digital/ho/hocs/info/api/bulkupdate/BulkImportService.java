package uk.gov.digital.ho.hocs.info.api.bulkupdate;


import lombok.extern.slf4j.Slf4j;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.partialimport.PartialImportResults;
import org.keycloak.representations.idm.GroupRepresentation;
import org.keycloak.representations.idm.PartialImportRepresentation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import uk.gov.digital.ho.hocs.info.domain.model.Permission;
import uk.gov.digital.ho.hocs.info.domain.model.Team;
import uk.gov.digital.ho.hocs.info.domain.model.Unit;
import uk.gov.digital.ho.hocs.info.domain.repository.TeamRepository;
import uk.gov.digital.ho.hocs.info.domain.repository.UnitRepository;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static net.logstash.logback.argument.StructuredArguments.value;
import static uk.gov.digital.ho.hocs.info.application.LogEvent.*;

@Service
@Slf4j
public class BulkImportService {

    private Keycloak keycloakClient;
    private String hocsRealmName;

    private TeamRepository teamRepository;

    public BulkImportService(
            Keycloak keycloakClient,
            @Value("${keycloak.realm}") String hocsRealmName,
            TeamRepository teamRepository) {
        this.keycloakClient = keycloakClient;
        this.hocsRealmName = hocsRealmName;
        this.teamRepository = teamRepository;
    }

    public PartialImportResults refreshAllGroups() {
        log.info("Started Bulk Upload", value(EVENT, BULK_IMPORT_STARTED));
        PartialImportRepresentation groupImport = getImportGroups();
        try {
            Response response = keycloakClient.realm(hocsRealmName).partialImport(groupImport);
            PartialImportResults results = response.readEntity(PartialImportResults.class);
            log.info("Completed Bulk Upload", value(EVENT, BULK_IMPORT_SUCCESS));
            return results;
        }
        catch (Exception e) {
            log.error("Failed to update keycloak with partial import for reason {}", e.getMessage(), value(EVENT, BULK_IMPORT_FAILURE));
            throw new BulkImportException("Failed to update keycloak with partial import", e);
        }

    }

    private PartialImportRepresentation getImportGroups() {
        PartialImportRepresentation keyCloakImport = new PartialImportRepresentation();
        List<GroupRepresentation> groups = new ArrayList<>();
        keyCloakImport.setIfResourceExists(PartialImportRepresentation.Policy.OVERWRITE.toString());
        try {
                for (Team team : teamRepository.findAllByActiveTrue()) {
                    GroupRepresentation teamGroup = new GroupRepresentation();
                    teamGroup.setSubGroups(new ArrayList<>());
                    teamGroup.setName(team.getUuid().toString());
                    teamGroup.setPath(String.format("/%s", team.getUuid()));

                    for (Permission permission : team.getPermissions()) {

                        GroupRepresentation caseTypeGroup = new GroupRepresentation();
                        caseTypeGroup.setSubGroups(new ArrayList<>());
                        caseTypeGroup.setName(permission.getCaseType().getType());
                        caseTypeGroup.setPath(
                                String.format("/%s/%s", team.getUuid(),
                                        permission.getCaseType().getType()));

                        GroupRepresentation permissionGroup = new GroupRepresentation();
                        permissionGroup.setName(permission.getAccessLevel().name());
                        permissionGroup.setPath(
                                String.format("/%s/%s/%s", team.getUuid(),
                                        permission.getCaseType().getType(), permission.getAccessLevel().name()));

                        caseTypeGroup.getSubGroups().add(permissionGroup);
                        teamGroup.getSubGroups().add(caseTypeGroup);
                    }
                    groups.add(teamGroup);


                keyCloakImport.setGroups(groups);
            }
        } catch (Exception e) {
            log.error("Failed to generate partial import representation from database for reason: {}", e.getMessage(), value(EVENT, BULK_IMPORT_FAILURE));
            throw new BulkImportException("Failed to generate partial import representation from database", e);
        }
        return keyCloakImport;
    }


}