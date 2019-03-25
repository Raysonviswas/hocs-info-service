package uk.gov.digital.ho.hocs.info.domain.model;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Table(name = "stage_type")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@EqualsAndHashCode(of = {"type"})
public class StageTypeEntity implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "uuid")
    private UUID uuid;

    @Column(name = "display_name")
    private String displayName;

    @Column(name = "short_code")
    private String shortCode;

    @Column(name = "type")
    private String type;

    @Column(name = "case_type_uuid")
    private UUID caseTypeUUID;

    @Column(name = "deadline")
    private int deadline;

    @Column(name = "active")
    private boolean active;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "acting_team_uuid", referencedColumnName = "uuid")
    private Team team;
}