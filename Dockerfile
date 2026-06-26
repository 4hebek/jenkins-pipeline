FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

ENV YOUR_NAME="Karolina"

EXPOSE 5500

ENTRYPOINT ["python", "app.py"]