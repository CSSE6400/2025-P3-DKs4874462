FROM python:latest

# Install pipx 
RUN apt-get update && apt-get install -y pipx 
RUN pipx ensurepath

# Install poetry 
RUN pip3 install poetry

# Setting the working directory 
WORKDIR /app

# Install poetry dependencies 
COPY pyproject.toml ./ 
RUN pipx run poetry install --no-root

# Copying our application into the container 
COPY todo todo

# Running our application 
CMD ["bash", "-c", "sleep 10 && pipx run poetry run flask --app todo run \ 
   --host 0.0.0.0 --port 6400"]