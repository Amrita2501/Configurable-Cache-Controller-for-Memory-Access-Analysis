import pandas as pd
import matplotlib.pyplot as plt

# Workload statistics from simulation
data = {
    "Workload": ["Sequential", "Random", "Conflict", "2-Way Cache"],
    "Hits": [2, 0, 0, 4],
    "Misses": [4, 6, 6, 2]
}

df = pd.DataFrame(data)

# Parameters
HIT_LATENCY = 1
MISS_LATENCY = 50
INSTRUCTIONS = 10000

# Calculations
df["Accesses"] = df["Hits"] + df["Misses"]
df["Hit Rate (%)"] = (df["Hits"] / df["Accesses"]) * 100
df["Miss Rate (%)"] = (df["Misses"] / df["Accesses"]) * 100

# Memory stall cycles
df["Memory Stall Cycles"] = (
    df["Hits"] * HIT_LATENCY +
    df["Misses"] * MISS_LATENCY
)

# Estimated execution cycles
df["Execution Cycles"] = (
    INSTRUCTIONS +
    df["Memory Stall Cycles"]
)

# IPC estimation
df["IPC"] = INSTRUCTIONS / df["Execution Cycles"]

# Bottleneck classification
def classify(row):
    if row["Miss Rate (%)"] > 50:
        return "Memory Bottleneck"
    elif row["IPC"] < 0.8:
        return "Performance Limited"
    else:
        return "Cache Efficient"

df["Classification"] = df.apply(classify, axis=1)

print("\n===== PERFORMANCE ANALYSIS =====\n")
print(df)

# Save report
df.to_csv("performance_report.csv", index=False)

# Plot 1: Hit Rate
plt.figure(figsize=(8,5))
plt.bar(df["Workload"], df["Hit Rate (%)"])
plt.title("Hit Rate vs Workload")
plt.ylabel("Hit Rate (%)")
plt.tight_layout()
plt.savefig("hit_rate_comparison.png")
plt.close()

# Plot 2: IPC
plt.figure(figsize=(8,5))
plt.bar(df["Workload"], df["IPC"])
plt.title("Estimated IPC vs Workload")
plt.ylabel("IPC")
plt.tight_layout()
plt.savefig("ipc_comparison.png")
plt.close()

print("\nGenerated files:")
print("1. performance_report.csv")
print("2. hit_rate_comparison.png")
print("3. ipc_comparison.png")
