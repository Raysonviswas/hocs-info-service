package uk.gov.digital.ho.hocs.info.api.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import uk.gov.digital.ho.hocs.info.domain.model.CaseType;

@AllArgsConstructor
@Getter
public class CaseTypeDto {

    //TODO: remove - used in UI
    @JsonProperty("label")
    private String label;

    //TODO: remove - used in UI
    @JsonProperty("value")
    private String value;

    @JsonProperty("displayName")
    private String displayName;

    @JsonProperty("shortCode")
    private String shortCode;

    @JsonProperty("type")
    private String type;


    public static CaseTypeDto from(CaseType caseType) {

        return new CaseTypeDto(
                caseType.getDisplayName(),
                caseType.getType(),
                caseType.getDisplayName(),
                caseType.getShortCode(),
                caseType.getType());
    }

}
