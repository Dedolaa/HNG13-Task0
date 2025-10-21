from django.shortcuts import render

import requests
from datetime import datetime, timezone
from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def profile_view(request):
    CAT_API = "https://catfact.ninja/fact"
    
    try:
        response = requests.get(CAT_API, timeout=5)
        response.raise_for_status()
        cat_fact = response.json().get("fact", "Cats are mysterious creatures.")
    except requests.RequestException:
        cat_fact = "Could not fetch a cat fact at the moment."

    data = {
        "status": "success",
        "user": {
            "email": "adedolapobakare16@gmail.com",
            "name": "Bakare Adedolapo Aishat",
            "stack": "Python/Django"
        },
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "fact": cat_fact
    }
    return Response(data)

