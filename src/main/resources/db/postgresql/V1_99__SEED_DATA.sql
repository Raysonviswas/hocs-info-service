
INSERT INTO unit (display_name, uuid, short_code, active)
VALUES ('UNIT 1', 'd9a93c21-a1a8-4a5d-aa7b-597bb95a782c', 'UNIT1', TRUE),
       ('DCU', 'c875dca8-8679-47e7-a589-7cea64b2e13c', 'DCU', TRUE),
       ('UKVI', '09c30d4b-b427-4b49-bec7-545eafb4019a', 'UKVI', TRUE);

INSERT INTO team (display_name, uuid, unit_uuid, active)
VALUES ('TEAM 1', '44444444-2222-2222-2222-222222222222', 'd9a93c21-a1a8-4a5d-aa7b-597bb95a782c', true),
       ('TEAM 2', '11111111-1111-1111-1111-111111111111', 'd9a93c21-a1a8-4a5d-aa7b-597bb95a782c', true),
       ('TEAM 3', '33333333-3333-3333-3333-333333333333', 'd9a93c21-a1a8-4a5d-aa7b-597bb95a782c', true),
       ('TEAM 14', '33333333-4444-3333-3333-333333333333', 'd9a93c21-a1a8-4a5d-aa7b-597bb95a782c', true);

Insert INTO case_type (uuid, display_name, short_code, type, owning_unit_uuid, deadline_stage, active, bulk)
VALUES ('a3d491ff-3ee1-42be-bcad-840c4c4b9f0a','DCU Ministerial', 'a1', 'MIN', 'c875dca8-8679-47e7-a589-7cea64b2e13c', 'DCU_MIN_DISPATCH', true, true),
       ('63c7215f-aefc-4492-aa08-7fe30959f95f','DCU Treat Official', 'a2', 'TRO', 'c875dca8-8679-47e7-a589-7cea64b2e13c', 'DCU_TRO_DISPATCH', true, true),
       ('814105e7-090a-4f1f-903a-62ad6b430bf1','DCU Number 10', 'a3', 'DTEN', 'c875dca8-8679-47e7-a589-7cea64b2e13c', 'DCU_DTEN_DISPATCH', true, false),
       ('4a1e6573-3084-4171-95df-e28fe90e940a','UKVI B REF', 'b1', 'IMCB', '09c30d4b-b427-4b49-bec7-545eafb4019a', 'UKVI_IMCB_DISPATCH', true, true),
       ('70899fb7-8a06-4954-bf38-98e4baec88c4','UKVI Ministerial REF', 'b2', 'IMCM' , '09c30d4b-b427-4b49-bec7-545eafb4019a', 'UKVI_IMCM_DISPATCH', true, true),
       ('ceed6981-6c37-4f7a-ba43-24314fc6d8f3','UKVI Number 10', 'b3', 'UTEN', '09c30d4b-b427-4b49-bec7-545eafb4019a', 'UKVI_UTEN_DISPATCH', true, true);

Insert INTO exemption_date (uuid, date, case_type_uuid)
VALUES ('7e5e4b76-8688-42f1-baa6-31cf8f247cb9','2018-08-27', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('12795a82-64ac-449a-88f0-4069b08e89c6','2018-12-25', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('59ff3fac-c8b4-40fd-b26a-f14dc62152ec','2018-12-26', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('ca365b1c-17f8-4e62-8bf6-f0b3c4947141','2019-01-01', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('802a5d00-2e29-4672-80b1-291e7d9d8735','2019-04-19', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('7416d6be-1589-44e2-88ad-34f0b800b4ae','2019-04-22', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('1bbe0a9c-2566-49a5-81f1-bd3a6873f110','2019-05-06', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('4019f20e-0d0d-4dbc-a6c9-26fa23dcd23e','2019-05-27', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('c27b58fe-5856-43fb-ba5e-a7253462ee60','2019-08-26', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('b34caca3-9bed-4013-90f5-d9ab648ea4b5','2019-11-25', 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('3e340cd3-15d2-435b-875d-93ae6c88f3e6','2018-08-27', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('b60a456a-484e-469a-ae53-e4f9663b2750','2018-12-25', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('9a537527-68d9-48d4-9192-c26f3279729d','2018-12-26', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('dcf8a743-7b6e-432d-b51a-db2e4f22e6af','2019-01-01', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('2d46fa35-9d2e-4170-b4b4-dff344c1071a','2019-04-19', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('8c93cecf-8298-4a10-a9dc-ab0c6ec440ad','2019-04-22', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('788e8baa-acb5-4f29-83da-227349610bc3','2019-05-06', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('16e195c3-3e4c-408f-a0ee-f4112c10bb8c','2019-05-27', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('77aa6956-bdcc-4a2f-8345-6e383a2d1735','2019-08-26', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('48e2a673-eee3-4981-a441-d7dda3740a17','2019-11-25', '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('7cbeab40-babe-4c5f-aa80-8e51733b986b','2018-08-27', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('2e9b2200-07d0-4a90-bc1c-bdeddd811623','2018-12-25', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('e4b51a4e-44e1-4417-b762-46df27cc1977','2018-12-26', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('808a585f-7848-4354-a543-7eb03e70ea3c','2019-01-01', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('92d75baf-b2b6-4b4b-a72f-0a0a34095c60','2019-04-19', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('d6862bb2-2360-4489-b4fe-78516a6b66d4','2019-04-22', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('2b94692d-c6bc-4bd5-86ef-5adfb61a6cbb','2019-05-06', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('36a31d3a-dae0-4262-8006-4a30d0216268','2019-05-27', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('c1125998-01a3-447c-87c5-752c3c67625b','2019-08-26', '814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('36bb5b7a-b371-413d-b6af-53ca64760188','2019-11-25', '814105e7-090a-4f1f-903a-62ad6b430bf1');

INSERT INTO unit_case_type (unit_uuid, case_type)
VALUES ('d9a93c21-a1a8-4a5d-aa7b-597bb95a782c', 'MIN');

INSERT INTO permission (team_uuid, case_type, access_level)
VALUES ('44444444-2222-2222-2222-222222222222', 'MIN', 'OWNER'),
       ('11111111-1111-1111-1111-111111111111', 'MIN', 'READ'),
       ('33333333-3333-3333-3333-333333333333', 'MIN', 'WRITE'),
       ('44444444-2222-2222-2222-222222222222', 'TRO', 'OWNER'),
       ('11111111-1111-1111-1111-111111111111', 'TRO', 'READ'),
       ('33333333-3333-3333-3333-333333333333', 'TRO', 'WRITE'),
       ('44444444-2222-2222-2222-222222222222', 'DTEN', 'OWNER'),
       ('11111111-1111-1111-1111-111111111111', 'DTEN', 'READ'),
       ('33333333-3333-3333-3333-333333333333', 'DTEN', 'WRITE'),
       ('44444444-2222-2222-2222-222222222222', 'IMCB', 'OWNER'),
       ('11111111-1111-1111-1111-111111111111', 'IMCB', 'READ'),
       ('33333333-3333-3333-3333-333333333333', 'IMCB', 'WRITE'),
       ('44444444-2222-2222-2222-222222222222', 'IMCM', 'OWNER'),
       ('11111111-1111-1111-1111-111111111111', 'IMCM', 'READ'),
       ('33333333-3333-3333-3333-333333333333', 'IMCM', 'WRITE'),
       ('44444444-2222-2222-2222-222222222222', 'UTEN', 'OWNER'),
       ('11111111-1111-1111-1111-111111111111', 'UTEN', 'READ'),
       ('33333333-3333-3333-3333-333333333333', 'UTEN', 'WRITE'),
       ('44444444-2222-2222-2222-222222222222', 'UTEN', 'OWNER');

Insert INTO stage_type (uuid, display_name, short_code, type, acting_team_uuid, active, deadline, case_type_uuid)
VALUES ('90eda1ba-86ba-4e55-b89b-8a5b14f72662','Data Input', '111', 'DCU_MIN_DATA_INPUT', '44444444-2222-2222-2222-222222222222', true, 10, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('b80d0656-422a-404b-abdf-7a35932bca03','Markup', '112', 'DCU_MIN_MARKUP', '33333333-3333-3333-3333-333333333333', true, 1, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('5c044c06-5c7a-489e-ae2d-2051196f9445','Transfer Confirmation', '113', 'DCU_MIN_TRANSFER_CONFIRMATION', '44444444-2222-2222-2222-222222222222', true, 3, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('6ff95b19-8f46-4f72-909f-eee160d60a64','No Reply Needed Confirmation', '114', 'DCU_MIN_NO_REPLY_NEEDED_CONFIRMATION', '33333333-3333-3333-3333-333333333333', true, 0, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('906c1a90-8a85-42ed-b250-a5e69feb8dfd','Initial Draft', '115', 'DCU_MIN_INITIAL_DRAFT', '44444444-2222-2222-2222-222222222222', true, 10, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('f98d142d-827b-4c8a-876e-3ffcccc464a2','QA Response', '116', 'DCU_MIN_QA_RESPONSE', '11111111-1111-1111-1111-111111111111', true, 0, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('271353bf-baaf-40be-b18e-fd53fb5c54ad','Private Office Approval', '117', 'DCU_MIN_PRIVATE_OFFICE', '44444444-2222-2222-2222-222222222222', true, 0, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('e5414378-5199-4326-ba37-99e86157c4ab','Ministerial Sign off', '118', 'DCU_MIN_MINISTER_SIGN_OFF', '44444444-2222-2222-2222-222222222222', true, 0, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('3dfbf5ec-429b-4ede-8924-bb3270732914','Dispatch', '119', 'DCU_MIN_DISPATCH', '44444444-2222-2222-2222-222222222222', true, 20, 'a3d491ff-3ee1-42be-bcad-840c4c4b9f0a'),
       ('5528f481-0e30-4117-9429-acb95eada40a','Copy To Number 10', '11a', 'DCU_MIN_COPY_NUMBER_TEN', '44444444-2222-2222-2222-222222222222', true, 0, '63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('12b06e0c-ff86-45a8-b27d-59e40904c08c','Data Input', '121', 'DCU_TRO_DATA_INPUT', '44444444-2222-2222-2222-222222222222', true, 5,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('55415bea-8bb4-4d32-8bfc-bf5950397119','Markup', '122', 'DCU_TRO_MARKUP', '44444444-2222-2222-2222-222222222222', true, 10,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('0c2f1a5a-d288-4f96-a061-e24752fde73f','Transfer Confirmation', '123', 'DCU_TRO_TRANSFER_CONFIRMATION', '44444444-2222-2222-2222-222222222222', true, 8 ,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('d07d33c9-046a-4b06-981d-749675a6b152','No Reply Needed Confirmation', '124', 'DCU_TRO_NO_REPLY_NEEDED_CONFIRMATION', '44444444-2222-2222-2222-222222222222', true, 10,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('fac2855d-f1cf-4e61-b488-4c690d92a83d','Initial Draft', '125', 'DCU_TRO_INITIAL_DRAFT', '33333333-3333-3333-3333-333333333333', true, 10,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('72c0ff10-0647-486c-8a7f-4abf70a26edc','QA Response', '126', 'DCU_TRO_QA_RESPONSE', '33333333-3333-3333-3333-333333333333', true, 3,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('140862b9-f4d0-4222-8e02-df2d78ba1d00','Dispatch', '127', 'DCU_TRO_DISPATCH', '44444444-2222-2222-2222-222222222222', true, 10 ,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('6f5a0dce-f25d-415a-8bd6-e5bd7e96d6ba','Copy to Number 10', '128', 'DCU_TRO_COPY_NUMBER_TEN', '44444444-2222-2222-2222-222222222222', true, 0,'63c7215f-aefc-4492-aa08-7fe30959f95f'),
       ('025fea5c-f8b9-4eb7-8ed8-c7aaa8eb72b0','Data Input', '131', 'DCU_DTEN_DATA_INPUT', '33333333-3333-3333-3333-333333333333', true, 0,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('d9985ff1-7508-4e32-bf00-17c0cf86fc1a','Markup', '132', 'DCU_DTEN_MARKUP', '33333333-3333-3333-3333-333333333333', true, 0,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('58d2706f-994b-4dfd-8f3c-1e7197ceb939','Transfer Confirmation', '133', 'DCU_DTEN_TRANSFER_CONFIRMATION', '33333333-3333-3333-3333-333333333333', true, 0,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('12db835f-4f0f-4bcd-9000-2b61b2f3c6eb','No Reply Needed Confirmation', '134', 'DCU_DTEN_NO_REPLY_NEEDED_CONFIRMATION', '44444444-2222-2222-2222-222222222222', true, 10,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('21071956-6ea8-48e1-8933-56a5cbf99ffa','Initial Draft', '135', 'DCU_DTEN_INITIAL_DRAFT', '11111111-1111-1111-1111-111111111111', true, 10,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('c44bba20-9ed6-41ef-ba5f-cb454594c6b8','QA Response', '136', 'DCU_DTEN_QA_RESPONSE', '33333333-3333-3333-3333-333333333333', true, 10,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('2451e9a9-d79d-484a-bfe1-7b19dd85ea70','Private Office', '137', 'DCU_DTEN_PRIVATE_OFFICE', '11111111-1111-1111-1111-111111111111', true, 0,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('c00bc689-3626-47f9-a016-df7798c2fc46','Dispatch', '138', 'DCU_DTEN_DISPATCH', '33333333-3333-3333-3333-333333333333', true, 20,'814105e7-090a-4f1f-903a-62ad6b430bf1'),
       ('719c6230-1287-43db-a6a2-0d215d9253f0','Copy To Number 10', '139', 'DCU_DTEN_COPY_NUMBER_TEN', '11111111-1111-1111-1111-111111111111', true, 10,'814105e7-090a-4f1f-903a-62ad6b430bf1');


Insert INTO minister (office_name, minister_name, uuid, responsible_team_uuid)
VALUES ('Home Secretary', 'Home Secretary', 'cba9013b-6862-417a-ad40-ebdf145601b1', '44444444-2222-2222-2222-222222222222'),
       ('Minister for State for Immigration', 'Minister for State for Immigration','2dada3ea-2530-4306-86cc-9cbade726048', '44444444-2222-2222-2222-222222222222'),
       ('Minister of State for Security and Economic Crime', 'Minister of State for Security and Economic Crime','2dada3ea-2530-4306-86cc-9cbade726041', '44444444-2222-2222-2222-222222222222'),
       ('Minister of State for Policing and Fire Service', 'Minister of State for Policing and Fire Service','2dada3ea-2530-4306-86cc-9cbade726042', '44444444-2222-2222-2222-222222222222'),
       ('Under Secretary of State for Crime, Safeguarding and Vulnerability', 'Under Secretary of State for Crime, Safeguarding and Vulnerability', '2dada3ea-2530-4306-86cc-9cbade726043', '33333333-3333-3333-3333-333333333333'),
       ('Permanent Secretary', 'Permanent Secretary', '2dada3ea-2530-4306-86cc-9cbade726044', '33333333-3333-3333-3333-333333333333'),
       ('Director General UKVI', 'Director General UKVI', '2dada3ea-2530-4306-86cc-9cbade726045', '33333333-3333-3333-3333-333333333333'),
       ('Director Compliance and Returns Immigration Enforcement','Director Compliance and Returns Immigration Enforcement', '2dada3ea-2530-4306-86cc-9cbade726046', '33333333-3333-3333-3333-333333333333'),
       ('Director General Border Force', 'Director General Border Force', '2dada3ea-2530-4306-86cc-9cbade726047', '33333333-3333-3333-3333-333333333333'),
       ('Director Resettlement Gold Command', 'Director Resettlement Gold Command', '2dada3ea-2530-4306-86cc-9cbade726056', '33333333-3333-3333-3333-333333333333'),
       ('Director of UKVI International Operations', 'Director of UKVI International Operations','2dada3ea-2530-4306-86cc-9cbade726098', '33333333-3333-3333-3333-333333333333'),
       ('Director of UKVI Asylum', 'Director of UKVI Asylum', '2dada3ea-2530-4306-86cc-9cbade726099', '33333333-3333-3333-3333-333333333333'),
       ('Minister for Lords', 'Minister for Lords', '2dada3ea-2530-4306-86cc-9cbade726000', '33333333-3333-3333-3333-333333333333');


INSERT INTO parent_topic (display_name, UUID, responsible_team_uuid, responsible_minister_uuid)
VALUES ('Parent topic 1', '11111111-1111-1111-1111-111111111121' ,'44444444-2222-2222-2222-222222222222','2dada3ea-2530-4306-86cc-9cbade726048'),
       ('Parent topic 2', '11111111-1111-1111-1111-111111111122', '44444444-2222-2222-2222-222222222222','2dada3ea-2530-4306-86cc-9cbade726048'),
       ('Parent topic 3', '11111111-1111-1111-1111-111111111123', '33333333-4444-3333-3333-333333333333','2dada3ea-2530-4306-86cc-9cbade726048'),
       ('Parent topic 4', '11111111-1111-1111-1111-111111111124', '11111111-1111-1111-1111-111111111111','2dada3ea-2530-4306-86cc-9cbade726048'),
       ('Parent topic 5', '11111111-1111-1111-1111-111111111125', '11111111-1111-1111-1111-111111111111','2dada3ea-2530-4306-86cc-9cbade726048'),
       ('Parent topic 6', '11111111-1111-1111-1111-111111111126', '33333333-4444-3333-3333-333333333333','2dada3ea-2530-4306-86cc-9cbade726042');

INSERT INTO topic (display_name, UUID, parent_topic_uuid)
VALUES ('topic 1', '11111111-1111-1111-1111-111111111131', '11111111-1111-1111-1111-111111111121'),
       ('topic 2', '11111111-1111-1111-1111-111111111132', '11111111-1111-1111-1111-111111111122'),
       ('topic 3', '11111111-1111-1111-1111-111111111133', '11111111-1111-1111-1111-111111111123'),
       ('topic 4', '11111111-1111-1111-1111-111111111134', '11111111-1111-1111-1111-111111111124'),
       ('topic 5', '11111111-1111-1111-1111-111111111135', '11111111-1111-1111-1111-111111111125'),
       ('topic 6', '11111111-1111-1111-1111-111111111136', '11111111-1111-1111-1111-111111111126'),
       ('topic 7', '11111111-1111-1111-1111-111111111137', '11111111-1111-1111-1111-111111111121'),
       ('topic 8', '11111111-1111-1111-1111-111111111138', '11111111-1111-1111-1111-111111111122'),
       ('topic 9', '11111111-1111-1111-1111-111111111139', '11111111-1111-1111-1111-111111111123'),
       ('topic 10', '11111111-1111-1111-1111-111111111140', '11111111-1111-1111-1111-111111111124'),
       ('topic 11', '11111111-1111-1111-1111-111111111141', '11111111-1111-1111-1111-111111111125'),
       ('topic 12', '11111111-1111-1111-1111-111111111142', '11111111-1111-1111-1111-111111111126'),
       ('topic 13', '11111111-1111-1111-1111-111111111143', '11111111-1111-1111-1111-111111111121'),
       ('topic 14', '11111111-1111-1111-1111-111111111144', '11111111-1111-1111-1111-111111111122'),
       ('topic 15', '11111111-1111-1111-1111-111111111145', '11111111-1111-1111-1111-111111111123'),
       ('topic 16', '11111111-1111-1111-1111-111111111146', '11111111-1111-1111-1111-111111111124'),
       ('topic 17', '11111111-1111-1111-1111-111111111147', '11111111-1111-1111-1111-111111111125'),
       ('topic 18', '11111111-1111-1111-1111-111111111148', '11111111-1111-1111-1111-111111111126');

INSERT INTO parent_topic_case_type (parent_topic_uuid, case_type)
VALUES ('11111111-1111-1111-1111-111111111121', 'MIN'),
       ('11111111-1111-1111-1111-111111111122', 'MIN'),
       ('11111111-1111-1111-1111-111111111123', 'MIN'),
       ('11111111-1111-1111-1111-111111111124', 'MIN'),
       ('11111111-1111-1111-1111-111111111125', 'MIN'),
       ('11111111-1111-1111-1111-111111111126', 'MIN'),
       ('11111111-1111-1111-1111-111111111121', 'TRO'),
       ('11111111-1111-1111-1111-111111111122', 'TRO'),
       ('11111111-1111-1111-1111-111111111123', 'TRO'),
       ('11111111-1111-1111-1111-111111111124', 'TRO'),
       ('11111111-1111-1111-1111-111111111125', 'TRO'),
       ('11111111-1111-1111-1111-111111111126', 'TRO'),
       ('11111111-1111-1111-1111-111111111121', 'DTEN'),
       ('11111111-1111-1111-1111-111111111122', 'DTEN'),
       ('11111111-1111-1111-1111-111111111123', 'DTEN'),
       ('11111111-1111-1111-1111-111111111124', 'DTEN'),
       ('11111111-1111-1111-1111-111111111125', 'DTEN'),
       ('11111111-1111-1111-1111-111111111126', 'DTEN');

INSERT INTO correspondent_type (uuid, display_name, type)
VALUES ('85930589-0275-4bf9-aa59-48d4a1d334a0','Correspondent', 'CORRESPONDENT'),
       ('2604a33a-c9b3-49e9-a28e-98b9f21777d9','Constituent', 'CONSTITUENT'),
       ('78197b5a-5cf4-442a-900c-f770678609e9','Third Party', 'THIRD_PARTY'),
       ('a6b031c8-827c-4846-a5d9-9381a570610c','Applicant', 'APPLICANT'),
       ('a5c068ba-0b7c-4132-8160-88d838a6e12a','Complainant', 'COMPLAINANT'),
       ('04f88967-56e4-4719-a5d2-22e1d44b5b11','Family Relation', 'FAMILY'),
       ('a7e32412-79eb-436e-821d-3aa08a20b20b','Friend', 'FRIEND'),
       ('fb8d8d9d-3cd3-40a8-8764-8bf191c5e7c8','Legal Representative', 'LEGAL_REP'),
       ('d0ac3afa-997b-4a88-97f8-92fa79d28ae3','Member', 'MEMBER'),
       ('82fc0022-055c-4676-9116-f6a20f414a2c','Other', 'OTHER');

INSERT INTO house_address (uuid, house, house_code, address1, address2, address3, postcode, country, added, updated)
VALUES ('3cb5d7ca-2198-4444-afd8-4a870f2d0b12',
        'House of Commons',
        'HC',
        'House of Commons',
        'London',
        null,
        'SW1A 0AA',
        'United Kingdom',
        '2018-10-01',
        null),
       ('d1065a7e-c3ae-478c-8ab1-d3c0264496f4',
        'House of Lords',
        'HL',
        'House of Lords',
        'London',
        null,
        'SW1A 0PW',
        'United Kingdom',
        '2018-10-01',
        null),
       ('1ef82bf6-c403-45e9-89f4-5861604eaead',
        'Scottish Parliament',
        'SP',
        'The Scottish Parliament',
        'Edinburgh',
        null,
        'SEH99 1SP',
        'United Kingdom',
        '2018-10-01',
        null),
       ('3c2dbce1-6510-4a93-a855-b75f9538c929',
        'Welsh Assembly',
        'WA',
        'Welsh Government',
        '5th Floor, Tŷ Hywel',
        'Cardiff Bay',
        'CF99 1N',
        'United Kingdom',
        '2018-10-01',
        null),
       ('925d4ff8-5d5a-4173-a7a8-1f955a7d54df',
        'Northern Irish Assembly',
        'NI',
        'Northern Ireland Assembly',
        'Parliament Buildings',
        'Belfast',
        'BT4 3XX',
        'United Kingdom',
        '2018-10-01',
        null),
       ('2c763346-3f41-4c49-8694-40033632d899',
        'European Parliament',
        'EU',
        'European Parliament Liaison Office in the UK',
        'Europe House, 32 Smith Square',
        'London',
        'SW1P 3EU',
        'United Kingdom',
        '2018-10-01',
        null);

Insert INTO team_contact (uuid, team_uuid, email_address)
VALUES ('ccd92f16-16d3-4b88-a4c8-e90e6cdf2a2a','44444444-2222-2222-2222-222222222222', 'edward.liddiard@homeoffice.gsi.gov.uk'),
       ('2a2dccd7-5ced-441b-ab16-f9c26bd77530','11111111-1111-1111-1111-111111111111', 'edward.liddiard@homeoffice.gsi.gov.uk'),
       ('3f078a1d-9583-48f8-886d-475224ae9cf5','33333333-3333-3333-3333-333333333333', 'edward.liddiard@homeoffice.gsi.gov.uk');

INSERT INTO screen_schema (uuid, type, active, title, action_label)
VALUES ('afa670fa-8048-4207-a0f6-35e856ffb70d', 'DCU_CORRESPONDENCE_DETAILS', true, 'Record Correspondence Details', 'Continue');

INSERT INTO case_type_schema (schema_uuid, case_type)
VALUES ('afa670fa-8048-4207-a0f6-35e856ffb70d', 'MIN');

INSERT INTO field (uuid, schema_uuid, component, name, label, validation, summary, active, choices)
VALUES ('ede4aa5d-80d5-4703-aeed-82167d927ad7','afa670fa-8048-4207-a0f6-35e856ffb70d', 'radio', 'OriginalChannel', 'How was the correspondence received?', '[ "required" ]', true, true,  '[ { "checked" : "checked", "label" : "Email", "value" : "EMAIL" }, { "label" : "Post", "value" : "POST" }, { "label" : "Phone", "value" : "PHONE" }, { "label" : "No. 10", "value" : "NO10" } ]'),
       ('03548dc4-76bb-4ac8-8992-b555fd59fa0a','afa670fa-8048-4207-a0f6-35e856ffb70d', 'date', 'DateOfCorrespondence', 'When was the correspondence sent?', '[ "required" ]',  false, true,  '[]'),
       ('1cb5ee23-b82d-448d-8574-00421841acdc','afa670fa-8048-4207-a0f6-35e856ffb70d', 'date', 'DateReceived', 'When was the correspondence received?', '[ "required" ]', false, true, '[]'),
       ('157a00e6-3b96-4a12-9b34-f73c328c332c','afa670fa-8048-4207-a0f6-35e856ffb70d', 'checkbox', 'CopyNumberTen', 'Send a copy to Number 10?','[]', true, true, '[]');
