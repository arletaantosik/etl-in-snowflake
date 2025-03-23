-- create queue in azure storage
-- then create event subscription (in the endpoint -> choose name of the queue)
-- register Microsoft.EventGrid in your subscription

CREATE OR REPLACE NOTIFICATION INTEGRATION snowpipe_event
  ENABLED = true
  TYPE = QUEUE
  NOTIFICATION_PROVIDER = AZURE_STORAGE_QUEUE
  AZURE_STORAGE_QUEUE_PRIMARY_URI = 'https://<your-container-url>'
  AZURE_TENANT_ID = '<your-tenant-id>';

  DESC notification integration snowpipe_event;
-- to see AZURE_CONSENT_URL's value, copy it (login.azure....) and paste in the browser
-- storage's access control -> add role -> select storage queue data contributor
-- select member: AZURE_MULTI_TENANT_APP_NAME
