package uk.gov.digital.ho.hocs.info.domain.entity.dto;

import org.junit.Test;
import uk.gov.digital.ho.hocs.info.domain.entity.Entity;

import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;

public class EntityDtoTest {

    @Test
    public void from() {

        String simpleName = "name123";
        String data = "{ title: 'Title 321' }";
        Entity entity = new Entity(1L, UUID.randomUUID(), simpleName, data, UUID.randomUUID(), true);

        EntityDto entityDto = EntityDto.from(entity);

        assertThat(entityDto.getSimpleName()).isEqualTo(simpleName);
        assertThat(entityDto.getData()).isEqualTo(data);

    }
}
