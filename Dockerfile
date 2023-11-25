FROM python:3.12

WORKDIR /django_project

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# Run the Django development server in the background
CMD start python manage.py runserver 0.0.0.0:8000
