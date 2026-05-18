import pandas as pd
import matplotlib.pyplot as plt

# Load query results
df = pd.read_csv("../data/world_bank_query_results.csv")

# Preview data
print(df.head())

# Country frequency chart
df.iloc[:, 0].value_counts().head(10).plot(kind="bar")

plt.title("Top Countries in Dataset")
plt.xlabel("Country")
plt.ylabel("Count")

plt.show()
