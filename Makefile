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
help:
    @echo "Available commands:"
    @echo "  make help         Display this help message"
    @echo "  make init         Set up the environment (create virtualenv and install dependencies)"
    @echo "  make install      Install dependencies from requirements.txt"
    @echo "  make build        Build the application (e.g., Docker image)"
    @echo "  make rn           Run the application locally"
    @echo "  make test         Run unit tests"
    @echo "  make test-api     Test API endpoints using curl"
    @echo "  make clean        Remove temporary and compiled files"
    @echo "  make docker-build Build the Docker image for the app"
    @echo "  make docker-run   Run the app in a Docker container"
    @echo "  make docker-test  Run tests inside a Docker container"