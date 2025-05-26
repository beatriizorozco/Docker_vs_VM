# 🔍 Proyecto de Benchmark: Neo4j en VM vs Docker

Este proyecto tiene como objetivo comparar el rendimiento de una base de datos Neo4j ejecutando consultas Cypher en dos entornos diferentes: una máquina virtual (VM) y un contenedor Docker. A través de esta comparativa se busca analizar cuál de los dos entornos ofrece mayor eficiencia, rapidez y estabilidad en tareas relacionadas con bases de datos orientadas a grafos.

---

## 🖥️ Entornos virtualizados: VM vs Docker

Antes de analizar los resultados, es importante entender las diferencias fundamentales entre los dos entornos evaluados.

### 🖥️ Máquinas Virtuales (VM)

Una máquina virtual es una emulación de un sistema operativo completo que corre sobre hardware físico, administrado por un hipervisor como VirtualBox o VMware. Tiene su propio kernel, sistema operativo y entorno aislado del host.

* **Ventajas:**

  * Aislamiento total entre sistemas.
  * Ideal para simular entornos completos de prueba.
* **Desventajas:**

  * Requiere más recursos (CPU, RAM).
  * Inicio más lento y mayor latencia.

### 🚢 Contenedores (Docker)

Los contenedores ejecutan las aplicaciones de forma aislada pero compartiendo el mismo kernel del sistema operativo del host. Son más ligeros y están diseñados para rapidez y eficiencia.

* **Ventajas:**

  * Menor consumo de recursos.
  * Inicio rápido.
  * Fácil portabilidad.
* **Desventajas:**

  * Menor aislamiento a nivel de sistema.

---

## ⚙️ Entorno de pruebas

* **Host del proyecto**: Ubuntu 22.04 LTS con Docker instalado.
* **VM invitada**: Ubuntu 24.04 LTS, Neo4j instalado manualmente.
* **Docker**: Imagen oficial de `neo4j:latest`, sin autenticación.
* **Herramientas usadas**: `cypher-shell`, `time`, Python para análisis.

---

## 📂 Estructura del proyecto

```bash
Docker_vs_VM/
├── notebooks/
│   ├── comparacion_vm_docker.png
│   └── vm_vs_docker_comparison.ipynb
│
├── results/
│   ├── docker/
│   │   ├── Screenshot from 2025-05-19 12-33-19.png
│   │   ├── ...
│   ├── vm/
│   │   ├── results_1.jpeg
│   │   ├── ...
│
├── scripts/
│   ├── analizar_resultados.py
│   ├── benchmark.sh
│   ├── cargar_datos.cypher
│   ├── comparacion_vm_docker.png
│   ├── consultas_benchmark.cypher
│   ├── docker_setup.sh
│   ├── resultados_docker.csv
│   ├── resultados_vm.csv
│   ├── vm_setup.sh
│   └── Dockerfile
│
├── proyecto.py
└── README.md
```

---

## 🗃️ Base de datos: modelo y consultas

Se simuló una red social con usuarios, publicaciones y etiquetas:

* **Nodos**: `User`, `Post`, `Tag`
* **Relaciones**: `FOLLOWS`, `CREATED`, `HAS_TAG`

Se midieron los tiempos de ejecución de tres consultas:

1. `MATCH (u:User) RETURN count(u);`
2. `MATCH (u)-[:CREATED]->(p) RETURN count(p);`
3. `MATCH (u)-[:FOLLOWS]->(f)-[:CREATED]->(p)-[:HAS_TAG]->(t) RETURN count(p);`

Cada consulta se ejecutó 5 veces y se calcularon la media y la desviación estándar.

---

## 📈 Resultados

| Consulta                   | Media VM (s) | Desv. VM | Media Docker (s) | Desv. Docker |
| -------------------------- | ------------ | -------- | ---------------- | ------------ |
| count(u)                   | 3.99         | 0.09     | 1.35             | 0.04         |
| count(p) CREATED           | 4.17         | 0.21     | 1.38             | 0.04         |
| FOLLOWS->CREATED->HAS\_TAG | 4.33         | 0.29     | 1.38             | 0.06         |

Se observa una mejora de hasta un 65% en los tiempos de ejecución en Docker respecto a la VM.

---

## 🔍 Análisis e interpretación

Docker demostró ser no solo más rápido sino también más estable, con menor variabilidad entre ejecuciones. La VM, aunque funcional, tiene mayor sobrecarga por emular un entorno completo.

Esto hace que Docker sea ideal para tareas de desarrollo y pruebas con bases de datos como Neo4j.

---

## 🧪 Reproducibilidad

* Ejecutar `cargar_datos.cypher` para insertar los datos en ambos entornos.
* Usar `time cypher-shell` para las consultas.
* Guardar los resultados y analizarlos con Python.

---

## 📦 Requisitos del entorno

```bash
Neo4j Community Edition
Docker
Ubuntu 22.04 / 24.04
Python 3.10+
pandas, matplotlib
```

---

## 📚 Bibliografía y Recursos

* [Neo4j Docs](https://neo4j.com/docs/)
* [Docker Docs](https://docs.docker.com/)
* [Cypher Manual](https://neo4j.com/docs/cypher-refcard/current/)
* [Ubuntu](https://ubuntu.com)

---

## ✅ Conclusión general

Docker se comporta mejor que una máquina virtual para ejecutar operaciones intensivas en Neo4j, tanto en tiempo como en estabilidad. Este trabajo ilustra cómo la elección del entorno puede afectar directamente el rendimiento de aplicaciones basadas en grafos.

El código fuente, los datos de pruebas y los resultados están disponibles en el siguiente repositorio:

🔗 [https://github.com/beatriizorozco/Docker_vs_VM](https://github.com/beatriizorozco/Docker_vs_VM)
