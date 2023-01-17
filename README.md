install docker 
create a docker hub account
create dockerfile inside project
COPY . . inserts code files inside the container
run the following command to build an image 
docker build . -t newmandocker
. means to look for the dockerfile inside the project directory tree
-t means tag
newmandocker is the name of the image
check on docker app for the new image called 'newmandocker'
run the following command to run the image
docker run newmandocker
once it is tested and we know it is working we proceed to create the .dockerignore file
to add the following folder to be ignored
/node_modules
once the previous steps are complete we can proceed to delete the created iamge, uncomment what's commented and run the commands to build and to run the image again
file should be something like 
FROM node
COPY . .
RUN npm install
CMD [ "npm", "run". "test:json" ]

github actions
crear archivo ci-testing.yaml
de aca puedo sacar un template https://gist.github.com/weibeld/f136048d0a82aacc063f42e684e3c494
name: NOMBRE_DEL_PIPELINE (pipeline es en referencia a todas las herramientas automatizadas que se necesitan tener para llevar a cabo un proceso de CI o CD, sea desarrollo o testing)
name: NOMBRE_DEL_PIPELINE
on: CUANDO_SE_EJECUTA_EL_PIPELINE(TRIGGER)

    #ejemplo1 cuando se crea un pull request
    #Ejecuta un proceso automatizado para validar el PR (ej: sonarq, correr el feature automatizado, etc)
    pull_request:

    #ejemplo2 cuando se hace un merge al nombre del branch, en este ejemplo develop
    #Ejecuta la regresion de pruebas, a nivel funcional para validar la aplicacion
    push:
        branch: "develop"

#jobs hace referencia a las tareas que se van a ejecutar de manera automatizada
jobs:
  my-job:
    #dentro de que entorno van a correr las pruebas automatizadas, en que imagen base se van a correr las pruebas
    runs-on: ubuntu-latest
    #los pasos que quiero que se ejecuten en el job, por cada step voy a ver un guion medio
    steps:
      - uses: actions/checkout@v3
        name: PASO1
        run: echo "Hello World!"