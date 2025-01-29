FROM python:3
WORKDIR /app
COPY test.py .
RUN .py test.py 
CMD ["python","./test.py"]
