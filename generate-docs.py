from pathlib import Path
result = list(Path(".").rglob("*.ttl"))
print(result)
