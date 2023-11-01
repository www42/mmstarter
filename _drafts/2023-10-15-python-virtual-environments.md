---
title           : "Python Virtual Environments"
date            : 2023-10-15 10:59:25 +02:00
last_modified_at: 2023-10-29 13:11:01 +01:00
categories:
  - Artificial Intelligence
tags:
  - Python
classes: wide
header:
  image : /assets/images/2023-10-15-python-virtual-environments/IMG_0465_header.jpeg
  teaser: /assets/images/2023-10-15-python-virtual-environments/IMG_0465_teaser.jpeg
image1: /assets/images/2023-10-15-python-virtual-environments/Python_Extension_VSCode.png
image2: /assets/images/2023-10-15-python-virtual-environments/Python_Environment_Manager_VSCode.png
image3: /assets/images/2023-10-15-python-virtual-environments/Notebook_Kernel_1.png
---

[venv Python Docs]: https://docs.python.org/3/library/venv.html

[Python Extension]: https://marketplace.visualstudio.com/items?itemName=ms-python.python

[Python Environment Manager]: https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-environment-manager




# Wozu brauche ich das?

Um für jedes Python Projekt die richtigen Python-Pakete in der richtigen Version zu haben, außerdem die passende Python Version (openai 0.28.1 funktioniert mit Python 3.11.6 aber nicht mit Python 3.12).

Python Virtual Environments sind der Versuch, der Dependency Hell zu entkommen - zumindest für Python.




# Wie funktioniert das?

* Jedes Virtual Environment ist ein Ordner, in den die Pakete installiert werden. Das Virtual Environment nutzt genau eine Python-Version von den im Betriebssystem installierten Python-Versionen. Der Ordner kann beliebig heissen, oft wird er `.venv` genannt.

* Wird der Paketmanager `pip` im Virtual Environment verwendet, so werden die Pakete in den Ordner des Virtual Environments installiert. Damit ist diese Python Umgebung unabhängig von den anderen Python virtuellen Umgebungen und unabhängig von den Python Installationen des Betriebssystems.

* Um ein Virtual Environment zu erstellen, wird das Python Modul `venv` verwendet. Dieses Modul ist in Python 3.3 und neuer enthalten. Das Modul erstellt den Ordner des Virtual Environments und kopiert oder symlinkt die gewünschte Python Installation in den Ordner. Das Modul `venv` kann mit `python3 -m venv` ausgeführt werden.

* Soll die virtuelle Umgebung auf eine andere Python Installation als `python3` zeigen, so ruft man das Modul mit dem gewünschten Python auf, z.B. `python3.12 -m venv`.

* Um ein Virtual Environment zu aktivieren, muss ein Skript ausgeführt werden, das sich im Ordner des Virtual Environments befindet. Dieses Skript setzt die Umgebungsvariablen `PATH` und `PYTHONPATH` so, dass die Python Installation und die Pakete des Virtual Environments verwendet werden. Das Skript heisst `activate` und befindet sich im Ordner `.venv/bin`. Das Skript muss ausgeführt werden, bevor Python oder `pip` verwendet werden. Das Skript kann mit `deactivate` wieder deaktiviert werden.

* Python Virtual Environments sind abhängig von der oder den Python Installationen des Betriebssystems. Es nicht kopierbar auf einen anderen Computer. Um ein Virtual Environment auf einem anderen Computer zu verwenden, muss es auf dem anderen Computer neu erstellt werden. Der Ordner wird daher bei Git ignoriert.

* Um ein Virtual Environment zu löschen, muss einfach der Ordner gelöscht werden. 


```bash 
echo ".venv" > .gitignore

python3 -m venv .venv

source .venv/bin/activate     # Mind the prompt change.
```

Innerhalb der virtuellen Python Umgebung zeigt `which python` auf `.env/bin/python`.

Die virtuelle Umgebung kann mit `deactivate` wieder verlassen werden und mit `rm -rf .venv` ganz gelöscht werden.





# VS Code Extensions

Um in VS Code mit Python zu arbeiten braucht man grundsätzlich die [Python Extension][Python Extension]{:target="_blank"}.

<img src="{{ page.image1 | relative_url }}" alt="dummy" width="700"/>

Zusätzlich gibt es zur Verwaltung der Virtual Environments den [Python Environment Manager][Python Environment Manager]{:target="_blank"}.

<img src="{{ page.image2 | relative_url }}" alt="dummy" width="700"/>




# Venv in Jupyter Notebooks

Jetzt noch ein Jupyter Notebook in der virtuellen Python Umgebung laufen lassen. 

In VS Code kann die [Python Extension][Python Extension] den notwendigen IPython Kernel installieren:

<img src="{{ page.image3 | relative_url }}" alt="dummy" width="300"/>

Der so erzeugte Kernel ist unter `.venv/share/jupyter/kernels/python3/kernel.json` zu finden.

Weitere Infos zu Jupyter Kernels [hier](https://github.com/microsoft/vscode-jupyter/wiki/General-overview-of-Kernel-Discovery-&-Execution-in-Jupyter-%28&-extension%29#1-global-kernelspecs).




# How to copy a virtual environment to another computer?

1. Auf Computer A innerhalb einer aktivierten virtuellen Python Umgebung:

```bash
pip freeze > requirements.txt
```

2. Auf Computer B innerhalb einer aktivierten virtuellen Python Umgebung:

```bash
pip install -r requirements.txt
```
