#!/bin/bash

echo "Desafio 2 DevOps"

echo "Creando Directorios"
DIR=tempdir
APP=mydevapp

mkdir $DIR
mkdir $DIR/templates
mkdir $DIR/static
echo "Directorios creados satisfactoriamente"

cp desafio2_app.py $DIR/.
cp -r templates/* $DIR/templates/.
cp -r static/* $DIR/static/.
echo "Archivos copiados satisfactoriamente"

echo "Creando archivo Dockerfile"
echo "FROM python" >> $DIR/Dockerfile
echo "RUN pip install flask" >> $DIR/Dockerfile
echo "COPY ./static /home/myapp/static/" >> $DIR/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> $DIR/Dockerfile
echo "COPY desafio2_app.py /home/myapp/" >> $DIR/Dockerfile
echo "EXPOSE 5050" >> $DIR/Dockerfile
echo "CMD python3 /home/myapp/desafio2_app.py" >> $DIR/Dockerfile
echo "Archivo Dockerfile creado satisfactoriamente"

cd $DIR
echo "Construyendo imagen de Docker..."
docker build -t $APP .
echo "Imagen completada"
docker run -t -d -p 5050:5050 --name $APP $APP
echo "Imagen corriendo"
docker ps -a
echo "FIN"
