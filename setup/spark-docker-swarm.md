# Installation of spark on mac/linux using docker swarm with postgre

***[docker: jupyter notebook with spark](https://programmaticponderings.com/2018/11/19/getting-started-with-pyspark-for-big-data-analytics-using-jupyter-notebooks-and-docker/)***

***[docker: jupyter notebook with spark & neo4j](https://resources.oreilly.com/learning-paths/graph-algorithms-in-practice)***

## Prepare postgre

1. create `$HOME/Data/postgre` dorectory to be used with volumn mounting in spark-notebook-postgre-stack.yml

## Prepare pyspark

1. for local dev, install related python packages with:
   > pip3 install -r requirements.txt
2. run docker manually for test purpose:
   > sudo docker run -d -p 8888:8888 -v $PWD:/home/jovyan/work jupyter/all-spark-notebook start-notebook.sh --NotebookApp.password='sha1:c2a73212ae07:068c44d9bc9275e917a9e2f8a7c70b6191f6fd21'
3. deploy docker stack for pyspark (should go to root folder of this project):
   > docker stack deploy -c setup/spark-notebook-postgre-stack.yml leopyspark
4. delete stack:
   > docker stack rm leopyspark
5. check status:
   > docker stack ps leopyspark \
   > 

## Go to Neo4j

http://localhost:7474/browser/


docker service inspect xd4
docker stack ps leopyspark --no-trunc
docker stack services --format {{.Name}} leopyspark 
docker service logs leopyspark_pyspark

docker logs $(docker ps | grep _pyspark | awk '{print $NF}')
docker logs 00e
docker exec -it 00e /bin/bash
sudo kill 5680
sudo lsof -i :4040
sudo lsof -PiTCP -sTCP:LISTEN