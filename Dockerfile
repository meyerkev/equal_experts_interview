FROM python:latest
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY server.py /
RUN chmod +x /server.py
EXPOSE 8080
CMD ["python", "server.py"]
