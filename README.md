
# Docker MySQL Sample

This repository provides a sample project demonstrating how to quickly set up a MySQL development environment using Docker. This setup allows you to easily manage your MySQL database within a containerized environment.

## Prerequisites

Make sure you have the following installed on your local machine:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Project Structure

- **`docker-compose.yml`**: The Docker Compose configuration file that defines the services, including the MySQL database and phpMyAdmin.
- **`.env`**: Environment variables for configuring MySQL and phpMyAdmin, such as database name, user, passwords, and ports.
- **`scripts/init.sql`**: SQL script that initializes the database, creates tables, and inserts initial data.
- **`mysql_data/`**: A directory where the MySQL database files are stored. This directory is mounted as a volume in the container to persist data.
- **`.env.sample`**: A sample environment file to provide an example of the required environment variables.
- **`.gitignore`**: A file that specifies which files and directories to ignore in the Git repository.

## Getting Started

Follow these steps to get your MySQL environment up and running:

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/RubenMoraVargas/docker-mysql-sample.git
cd docker-mysql-sample
```

### 2. Set Up Environment Variables

Copy the sample `.env.sample` file to `.env` and modify the variables as needed:

```bash
cp .env.sample .env
```

Add the `.env` file to set the values for:

```env
MYSQL_DATABASE=mydatabase
MYSQL_ROOT_PASSWORD=
MYSQL_USER=[user]
MYSQL_PASSWORD=[password]
PHPMYADMIN_PORT=8080
```

### 3. Start the Docker Compose Services

Start the MySQL service and initialize the database:

```bash
docker-compose up -d
```

This command will:

- Start a MySQL container with the specified environment variables.
- Mount the `mysql_data/` directory to persist database data.
- Run the `init.sql` script located in the `scripts/` directory to initialize the database, create tables, and insert initial data.
- Start a phpMyAdmin container to manage your MySQL database through a web interface.

### 4. Access phpMyAdmin

Once the services are running, you can access phpMyAdmin to manage your database via the browser:

- **URL**: `http://localhost:8080`
- **Server**: `db`
- **Username**: `[user]`
- **Password**: `[password]`

### 5. Connect to MySQL

You can also connect to the MySQL database using a MySQL client, or using [DBeaver](https://dbeaver.io/), following these connection settings:

- **Host**: `localhost`
- **Port**: `3306`
- **Database**: `mydatabase`
- **Username**: `[user]`
- **Password**: `[password]`

### 6. Stopping the Services

To stop the MySQL and phpMyAdmin containers, run:

```bash
docker-compose down
```

This will stop and remove the containers. The data will still be persisted in the `mysql_data/` directory.

### 7. Cleaning Up

If you want to remove all containers and data, you can use the following command:

```bash
docker-compose down -v
```

This command will remove the containers and the volume containing your database data.

## Troubleshooting

- Ensure Docker is running on your system.
- If the MySQL container fails to start, check for any port conflicts or issues with the environment variables.

## License

This project is licensed under the MIT License.
