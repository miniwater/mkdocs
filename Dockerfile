FROM python:3.11-alpine3.18

MAINTAINER miniwater
 
WORKDIR /home
 
COPY docs /home/docs
COPY mkdocs.yml /home/mkdocs.yml
 
RUN pip install mkdocs-material

WORKDIR /home/docs
RUN mkdocs serve
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
