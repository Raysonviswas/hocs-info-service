package uk.gov.digital.ho.hocs.info.domain.entity;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import uk.gov.digital.ho.hocs.info.domain.exception.ApplicationExceptions;

import java.util.List;
import java.util.Set;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class EntityServiceTest {

    @Mock
    protected EntityRepository entityRepository;
    private EntityService entityService;


    @Before
    public void before() {
        entityService = new EntityService(entityRepository);
    }

    @Test
    public void getBySimpleName() {

        String owner = "owner";
        String ownerType = "ownerType";
        String list = "list";

        String simpleName = "name123";
        String data = "{ title: 'Title 321' }";
        UUID uuid = UUID.randomUUID();
        UUID listUuid = UUID.randomUUID();
        Set<Entity> entitiesToReturn = Set.of(new Entity(1L, uuid, simpleName, data, listUuid, true));

        when(entityRepository.findBySimpleName(owner, ownerType, list)).thenReturn(entitiesToReturn);

        Set<Entity> result = entityService.getBySimpleName(owner, ownerType, list);

        assertThat(result).isNotNull();
        assertThat(result.size()).isEqualTo(1);
        assertThat(result.iterator().next().getSimpleName()).isEqualTo(simpleName);
        assertThat(result.iterator().next().getData()).isEqualTo(data);
        assertThat(result.iterator().next().getUuid()).isEqualTo(uuid);
        assertThat(result.iterator().next().getEntityListUUID()).isEqualTo(listUuid);
        assertThat(result.iterator().next().isActive()).isEqualTo(true);

        verify(entityRepository).findBySimpleName(owner, ownerType, list);
        verifyNoMoreInteractions(entityRepository);
    }

    @Test(expected = ApplicationExceptions.EntityNotFoundException.class)
    public void getBySimpleName_nullOwner() {
        entityService.getBySimpleName(null, "test", "test");
        verifyNoMoreInteractions(entityRepository);
    }

    @Test(expected = ApplicationExceptions.EntityNotFoundException.class)
    public void getBySimpleName_nullOwnerType() {
        entityService.getBySimpleName("test", null, "test");
        verifyNoMoreInteractions(entityRepository);
    }

    @Test(expected = ApplicationExceptions.EntityNotFoundException.class)
    public void getBySimpleName_nullList() {
        entityService.getBySimpleName("test", "test", null);
        verifyNoMoreInteractions(entityRepository);
    }

    @Test
    public void getByEntityListName() {

        String listName = "L1";
        String simpleName1 = "nameOne";
        String data1 = "{ title: 'Title One' }";
        String simpleName2 = "nameTwo";
        String data2 = "{ title: 'Title Two' }";
        Entity entity1 = new Entity(1L, UUID.randomUUID(), simpleName1, data1, UUID.randomUUID(), true);
        Entity entity2 = new Entity(2L, UUID.randomUUID(), simpleName2, data2, UUID.randomUUID(), true);
        List<Entity> entitiesToReturn = List.of(entity1, entity2);

        when(entityRepository.findByEntityListSimpleName(listName)).thenReturn(entitiesToReturn);

        List<Entity> result = entityService.getByEntityListName(listName);

        assertThat(result).isNotNull();
        assertThat(result.size()).isEqualTo(2);
        assertThat(result.get(0).getSimpleName()).isEqualTo(simpleName1);
        assertThat(result.get(0).getData()).isEqualTo(data1);
        assertThat(result.get(1).getSimpleName()).isEqualTo(simpleName2);
        assertThat(result.get(1).getData()).isEqualTo(data2);

        verify(entityRepository).findByEntityListSimpleName(listName);
        verifyNoMoreInteractions(entityRepository);
    }

    @Test(expected = ApplicationExceptions.EntityNotFoundException.class)
    public void getByEntityListName_nullList() {
        entityService.getByEntityListName(null);
        verifyNoMoreInteractions(entityRepository);
    }

}
