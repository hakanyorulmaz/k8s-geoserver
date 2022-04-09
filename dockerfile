FROM openjdk:11
ENV GEOSERVER_HOME=/app/geoserver
ENV GEOSERVER_DATA_DIR=/geoserver-data
WORKDIR /app
RUN mkdir  ${GEOSERVER_DATA_DIR}
RUN wget https://versaweb.dl.sourceforge.net/project/geoserver/GeoServer/2.15.5/geoserver-2.15.5-bin.zip && unzip *.zip && rm *.zip  && mv geoserver-* geoserver
# below command is only should be use test scenario
# RUN bash ./geoserver/bin/startup.sh 

WORKDIR /app/geoserver/bin
RUN echo  '[ -d ${GEOSERVER_DATA_DIR}/styles ] && echo "GEOSERVER_DATA_DIR folder exist"  || cp -R ${GEOSERVER_HOME}/data_dir/* ${GEOSERVER_DATA_DIR} && ./startup.sh'>> start.sh
EXPOSE 8080
CMD ["bash", "start.sh"] 