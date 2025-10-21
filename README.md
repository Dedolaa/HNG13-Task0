# HNG Backend Wizards — Stage 0 Task: Dynamic Profile Endpoint

## Description
A simple Django REST API that returns my profile info, current UTC timestamp, and a random cat fact fetched dynamically from the Cat Facts API.

## Endpoint
`GET /me`

### Sample Response
```json
{
  "status": "success",
  "user": {
    "email": "adedolapobakare16@gmail.com",
    "name": "Bakare Adedolapo Aishat",
    "stack": "Python/Django"
  },
  "timestamp": "2025-10-21T11:35:08.282444+00:00",
  "fact": "Cats take between 20-40 breaths per minute."
}
