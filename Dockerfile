FROM python:3.8-slim-buster

RUN pip3 install -r requirements.txt

COPY . .

RUN pip3 install Flash FLask-SQLAlchemy

CMD [ "python3", "todo.py" ]
