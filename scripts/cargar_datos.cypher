UNWIND range(1, 50) AS i
CREATE (:User {name: 'Usuario' + i, edad: 20 + (i % 10)});

UNWIND range(1, 100) AS i
CREATE (:Post {contenido: 'Post número ' + i, fecha: date()});

UNWIND ['tech', 'neo4j', 'python', 'docker', 'vm', 'graph', 'data'] AS nombre
CREATE (:Tag {nombre: nombre});

MATCH (u:User), (p:Post) WHERE rand() < 0.1
CREATE (u)-[:CREATED]->(p);

MATCH (p:Post), (t:Tag) WHERE rand() < 0.3
CREATE (p)-[:HAS_TAG]->(t);

MATCH (a:User), (b:User) WHERE a <> b AND rand() < 0.05
CREATE (a)-[:FOLLOWS]->(b);
