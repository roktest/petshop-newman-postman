FROM node
# COPY afuera_arch adentro_arch 
# COPY source dest
COPY . . 
RUN npm install newman newman-reporter-htmlextra newman-reporter-html --force
CMD [ "npm", "run", "test:json" ]
#RUN echo "voy a ejecutar en build"
#CMD [ "echo", "voy por run" ]