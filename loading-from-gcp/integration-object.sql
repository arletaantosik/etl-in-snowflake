CREATE STORAGE INTEGRATION gcp_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = GCS
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('gcs://bucket/path', 'gcs://bucket/path2');

DESC STORAGE integration gcp_integration;
-- to copy STORAGE_GCP_SERVICE_ACCOUNT for integration with gcp
-- then in cloud storage -> select the bucket -> permission -> principals
