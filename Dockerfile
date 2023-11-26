FROM python:3.12

# Set the working directory
WORKDIR /django_project

# Copy the application files into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY . /django_project

# Run the Django development server in the background
#CMD start python manage.py runserver 0.0.0.0:8000
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "http://localhost:8000/"]
#CMD start python manage.py runserver 0.0.0.0:8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
