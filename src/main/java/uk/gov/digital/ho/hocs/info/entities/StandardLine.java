package uk.gov.digital.ho.hocs.info.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "standard_line")
@NoArgsConstructor
public class StandardLine implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Getter
    @Column(name = "uuid")
    private UUID uuid;

    @Getter
    @Column(name = "display_name")
    private String displayName;

    @Getter
    @Column(name = "topic_uuid")
    private UUID topicUUID;

    @Getter
    @Column(name = "expires")
    private LocalDateTime expires;

    public StandardLine(UUID uuid, String displayName, UUID topicUUID, LocalDateTime expires){
        this.uuid = uuid;
        this.displayName = displayName;
        this.topicUUID = topicUUID;
        this.expires = expires;
    }

    public void setExpires() {
        this.expires = LocalDateTime.now();
    }
}