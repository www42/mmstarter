---
title: "Python virtual environments"
date: 2023-10-15 10:59:25 +02:00
1categories:
  - Artificial Intelligence
tags:
  - Python
image1: /assets/images/2023-10-15-python-virtual-environments/Python_Environment_Manager_VSCode.png
---

[Python Environment Manager]: https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-environment-manager

# Wozu brauche ich das?

Der [Python Environment Manager][Python Environment Manager]{:target="_blank"} für VS Code ist ein hilfreiches Tool, um virtuelle Python Umgebungen zu verwalten. 

<img src="{{ page.image1 | relative_url }}" alt="dummy" width="500"/>



# Wie installiere ich das?

Gar nicht, dieses Feature ist in aktuellen Python Versionen (ab 3.3) bereits enthalten.

```bash
python3 -m venv .venv
```

Dabei ist `.venv` der Name des Verzeichnisses, in dem die virtuelle Umgebung angelegt werden soll. Dieses Verzeichnis wird automatisch erzeugt, wenn es noch nicht existiert.

Virtuelle Umgebungen sind geräteabhängig. Daher nicht in ein Git Repo aufnehmen

```bash
echo ".venv" >> .gitignore
```

Die virtuelle Umgebung wird aktiviert mit

```bash
source .venv/bin/activate
```

und deaktiviert mit

```bash
deactivate
```


