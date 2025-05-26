import pandas as pd
import matplotlib.pyplot as plt

# Leer datos
df = pd.read_csv("resultados_docker.csv")
grouped = df.groupby("Consulta")["Tiempo"].agg(['mean', 'std']).reset_index()
print(grouped)

# Graficar
plt.figure(figsize=(8,5))
plt.bar(grouped['Consulta'], grouped['mean'], yerr=grouped['std'], capsize=5)
plt.ylabel("Tiempo medio (s)")
plt.title("Comparativa de rendimiento (Docker)")
plt.tight_layout()
plt.savefig("grafico_comparativo.png")
plt.show()
