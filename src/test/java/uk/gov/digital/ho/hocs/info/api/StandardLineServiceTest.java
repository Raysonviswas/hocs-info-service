package uk.gov.digital.ho.hocs.info.api;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import uk.gov.digital.ho.hocs.info.client.caseworkclient.CaseworkClient;
import uk.gov.digital.ho.hocs.info.client.documentclient.DocumentClient;
import uk.gov.digital.ho.hocs.info.client.documentclient.model.ManagedDocumentType;
import uk.gov.digital.ho.hocs.info.api.dto.CreateStandardLineDocumentDto;
import uk.gov.digital.ho.hocs.info.domain.model.StandardLine;
import uk.gov.digital.ho.hocs.info.domain.repository.StandardLineRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Set;
import java.util.UUID;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class StandardLineServiceTest {

    @Mock
    private StandardLineRepository standardLineRepository;

    @Mock
    private DocumentClient documentClient;

    @Mock
    private CaseworkClient caseworkClient;

    private StandardLineService standardLineService;

    private static final UUID uuid = UUID.randomUUID();
    private static final LocalDateTime END_OF_DAY = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);
    private static final String DISPLAY_NAME = "dn";
    private static final UUID NEW_DOCUMENT_UUID = UUID.randomUUID();

    @Before
    public void setUp() {
        this.standardLineService = new StandardLineService(standardLineRepository, documentClient, caseworkClient);
    }

    @Test
    public void shouldReturnStandardLine(){
        when(standardLineRepository.findStandardLinesByExpires(END_OF_DAY)).thenReturn(Set.of(new StandardLine()));
        standardLineService.getActiveStandardLines();
        verify(standardLineRepository, times(1)).findStandardLinesByExpires(END_OF_DAY);
        verifyNoMoreInteractions(standardLineRepository);
    }

    @Test
    public void shouldReturnStandardLineForPrimaryTopic(){
        when(standardLineRepository.findStandardLinesByTopicAndExpires(uuid, END_OF_DAY)).thenReturn(new StandardLine());
        standardLineService.getStandardLineForTopic(uuid);
        verify(standardLineRepository, times(1)).findStandardLinesByTopicAndExpires(uuid, END_OF_DAY);
        verifyNoMoreInteractions(standardLineRepository);
    }

    @Test
    public void shouldCreateNewStandardLine(){
        CreateStandardLineDocumentDto request = new CreateStandardLineDocumentDto(DISPLAY_NAME,"URL",uuid,LocalDate.now().plusDays(1));

        when(documentClient.createDocument(any(UUID.class), eq(request.getDisplayName()), eq("URL"), eq(ManagedDocumentType.STANDARD_LINE))).thenReturn(NEW_DOCUMENT_UUID);
        when(standardLineRepository.findStandardLinesByTopicAndExpires(uuid, END_OF_DAY)).thenReturn(null);

        standardLineService.createStandardLine(request.getDisplayName(), request.getTopicUUID(), request.getExpires(), request.getS3UntrustedUrl());

        verify(documentClient,times(1)).createDocument(any(UUID.class), eq(DISPLAY_NAME), eq("URL"), eq(ManagedDocumentType.STANDARD_LINE));
        verify(standardLineRepository, times(1)).findStandardLinesByTopicAndExpires(uuid, END_OF_DAY);
        verify(standardLineRepository, times(1)).save(any());
        verifyNoMoreInteractions(standardLineRepository);
        verifyNoMoreInteractions(documentClient);
    }

    @Test
    public void shouldCreateStandardLineExpiringPrevious(){
        CreateStandardLineDocumentDto request = new CreateStandardLineDocumentDto(DISPLAY_NAME,"URL",uuid,LocalDate.now().plusDays(1));

        StandardLine standardLine = new StandardLine(DISPLAY_NAME, uuid, END_OF_DAY);
        standardLine.setDocumentUUID(UUID.randomUUID());

        when(documentClient.createDocument(any(UUID.class), eq(request.getDisplayName()), eq("URL"), eq(ManagedDocumentType.STANDARD_LINE))).thenReturn(NEW_DOCUMENT_UUID);
        when(standardLineRepository.findStandardLinesByTopicAndExpires(uuid , END_OF_DAY)).thenReturn(standardLine);
      
        standardLineService.createStandardLine(request.getDisplayName(), request.getTopicUUID(), request.getExpires(), request.getS3UntrustedUrl());

        verify(documentClient,times(1)).createDocument(any(UUID.class), eq(DISPLAY_NAME), eq("URL"), eq(ManagedDocumentType.STANDARD_LINE));
        verify(standardLineRepository, times(1)).findStandardLinesByTopicAndExpires(uuid, END_OF_DAY);
        verify(standardLineRepository, times(2)).save(any());
        verify(documentClient).deleteDocument(standardLine.getDocumentUUID());
        verifyNoMoreInteractions(standardLineRepository);
        verifyNoMoreInteractions(documentClient);
        verify(caseworkClient, times(1)).clearCachedStandardLineForTopic(uuid);
        verifyNoMoreInteractions(caseworkClient);
    }
}
