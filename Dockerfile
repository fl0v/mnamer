FROM python:alpine

ARG MNAMER_VERSION=dev

ARG UID=1000
ARG GID=1000

RUN addgroup mnamer -g $GID
RUN adduser mnamer -u $UID -G mnamer --disabled-password
USER mnamer

#get official build
#RUN pip3 install --no-cache-dir --upgrade pip mnamer==${MNAMER_VERSION}

# Copy codebase into the image
WORKDIR /app
COPY . /app


# Install dependencies and your code
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir .

ENTRYPOINT ["python", "-m", "mnamer"]
CMD ["--batch", "/mnt"]
