FROM python:3.8-alpine3.14
RUN mkdir code
WORKDIR /code
#COPY requirement.txt ./
#COPY . ./code
ADD project.py /code/
ADD requirement.txt /code/
RUN python -m pip install --upgrade pip
RUN pip install -r requirement.txt
CMD ["python" , "./project.py"]