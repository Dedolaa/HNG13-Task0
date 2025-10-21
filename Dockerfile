# Use the official Python 3.10 image
FROM python:3.10-slim

# Environment settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project
COPY . .

# Collect static files (ignore if not configured)
RUN python manage.py collectstatic --noinput || true

# Expose the port
ENV PORT=8000
EXPOSE 8000

# Start the Django app with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "profile_api.wsgi:application"]
