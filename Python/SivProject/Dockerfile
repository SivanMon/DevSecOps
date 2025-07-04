FROM alpine:3.20
RUN apk update
RUN apk add python3
RUN apk add py3-pip
RUN python3 -m venv newenv
COPY requirements.txt .
RUN source newenv/bin/activate ; pip install -r requirements.txt
COPY app.py .
CMD ["sh",  "-c", "source newenv/bin/activate ; python3  app.py"]