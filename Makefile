.PHONY: install test run clean docker-build docker-run docker-test

# installation des dépendances
install:
	pip install -r requirements.txt
 # exécution des tests
test:
	python3 -m pytest test.py -v
run:
	python3 app.py
#  nettoyage des fichiers compilés Python
clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
#  construction de l'image Docker
docker-build:
	docker build -t calculator:latest .
#  exécution de l'image Docker
docker-run:
	docker run -p 5000:5000 calculator:latest
#  exécution des tests dans Docker
docker-test:
	docker run calculator:latest python -m pytest test.py -v
