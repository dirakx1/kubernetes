# Undelete the managed service `endpointsapis.appspot.com`.
gcurl -d '{}' https://servicemanagement.googleapis.com/v1/services/echo-api.endpoints.mundo-terpel-app.cloud.goog:undelete
{
  "name": "operations/services.echo-api.endpoints.mundo-terpel-app.cloud.goog-2",
  "metadata": {
    "@type":     "type.googleapis.com/google.api.servicemanagement.v1.OperationMetadata",
    "resourceNames": [
      "/services/echo-api.endpoints.mundo-terpel-app.cloud.goog"
    ],
    "startTime": ...
    "persisted": true
  },
  "response": {
    "@type": "type.googleapis.com/google.api.servicemanagement.v1.ManagedService",
    "serviceName": "echo-api.endpoints.mundo-terpel-app.cloud.goog",
    "producerProjectId": "echo-api",
    ...
  }
}

