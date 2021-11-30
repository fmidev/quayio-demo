FROM python:3.6-buster

RUN apt-get update \
    & apt-get install git

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt


# Run the application:
COPY dummy_app.py .
#CMD ["python", "myapp.py"]

RUN pip install -U pip \
    && pip install git+https://github.com/karjaljo/hiisi.git
