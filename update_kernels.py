import json
import os

kernel_name = "python313"
kernel_display_name = "Python 3.13 (Custom)"
notebooks_folder = "./"  # mets le chemin vers ton dossier projet

for filename in os.listdir(notebooks_folder):
    if filename.endswith(".ipynb"):
        path = os.path.join(notebooks_folder, filename)
        with open(path, "r", encoding="utf-8") as f:
            nb = json.load(f)

        if "kernelspec" in nb["metadata"]:
            nb["metadata"]["kernelspec"]["name"] = kernel_name
            nb["metadata"]["kernelspec"]["display_name"] = kernel_display_name
        else:
            nb["metadata"]["kernelspec"] = {
                "name": kernel_name,
                "display_name": kernel_display_name,
                "language": "python"
            }

        with open(path, "w", encoding="utf-8") as f:
            json.dump(nb, f, indent=2)

print("Kernels changés pour tous les notebooks dans", notebooks_folder)
