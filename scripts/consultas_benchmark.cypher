// Consulta ligera
MATCH (u:User) RETURN count(u);

// Consulta intermedia
MATCH (u:User)-[:CREATED]->(p:Post) RETURN count(p);

// Consulta compleja
MATCH (u:User)-[:FOLLOWS]->(f)-[:CREATED]->(p:Post)-[:HAS_TAG]->(t:Tag)
RETURN count(p);
