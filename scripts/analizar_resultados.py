import pandas as pd
import matplotlib.pyplot as plt

# Leer archivos CSV
df_vm = pd.read_csv("resultados_vm.csv")
df_docker = pd.read_csv("resultados_docker.csv")

# Agregar columna de entorno
df_vm["Entorno"] = "VM"
df_docker["Entorno"] = "Docker"

# Unir los dataframes
df = pd.concat([df_vm, df_docker])

# Convertir tiempos a float por si fueran strings
df["Tiempo"] = df["Tiempo"].astype(float)

# Gráfica de líneas
plt.figure(figsize=(10, 6))

# Iterar por consulta para graficar
for consulta in df["Consulta"].unique():
    for entorno in ["VM", "Docker"]:
        sub = df[(df["Consulta"] == consulta) & (df["Entorno"] == entorno)]
        plt.plot(sub["Número"], sub["Tiempo"], marker='o', label=f"{consulta} - {entorno}")

plt.title("Comparación de tiempos de ejecución: VM vs Docker")
plt.xlabel("Repetición")
plt.ylabel("Tiempo (s)")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig("comparacion_vm_docker.png")
plt.show()
