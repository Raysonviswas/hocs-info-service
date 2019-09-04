ALTER TABLE member
ADD COLUMN IF NOT EXISTS constituency_uuid UUID;

DROP TABLE IF EXISTS constituency;

CREATE TABLE IF NOT EXISTS constituency
(
  id                 BIGSERIAL  PRIMARY KEY,
  uuid               UUID       NOT NULL,
  constituency_name  TEXT       NOT NULL,
  active             BOOLEAN    NOT NULL DEFAULT TRUE,

  CONSTRAINT constituency_uuid_unique UNIQUE (uuid),
  CONSTRAINT constituency_name_unique UNIQUE (constituency_name)
);

CREATE INDEX idx_constituency_uuid
  ON constituency (uuid, active);
