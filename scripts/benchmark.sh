#!/bin/bash

OUTPUT="resultados_docker.csv"
echo "Consulta,Número,Tiempo" > $OUTPUT

for i in {1..5}; do
  T=$( (time cypher-shell "MATCH (u:User) RETURN count(u);") 2>&1 | grep real | awk '{print $2}' )
  echo "count(u),$i,$T" >> $OUTPUT

done

for i in {1..5}; do
  T=$( (time cypher-shell "MATCH (u:User)-[:CREATED]->(p:Post) RETURN count(p);") 2>&1 | grep real | awk '{print $2}' )
  echo "count(p CREATED),$i,$T" >> $OUTPUT

done

for i in {1..5}; do
  T=$( (time cypher-shell "MATCH (u:User)-[:FOLLOWS]->(f)-[:CREATED]->(p:Post)-[:HAS_TAG]->(t:Tag) RETURN count(p);") 2>&1 | grep real | awk '{print $2}' )
  echo "count(p FCT),$i,$T" >> $OUTPUT

done
