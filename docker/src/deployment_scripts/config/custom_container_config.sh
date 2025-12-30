#!/bin/sh

# define any database/apex credentials necessary to deploy the database schemas and/or applications


# define SIA schema credentials
DB_PICADM_USER="PICADM"
DB_SIA_PASSWORD="[CONTAINER_PW]"

# define SIA connection string
PICADM_CREDENTIALS="$DB_PICADM_USER/$DB_SIA_PASSWORD@${DBHOST}:${DBPORT}/${DBSERVICENAME}"

# define the SIA database folder path
SIA_FOLDER_PATH="/usr/src/staff-info-app/SQL"

# GIM username
DB_SIA_USER="STAFF_INFO_APP"

# define GIM connection string
SIA_CREDENTIALS="$DB_SIA_USER/$DB_SIA_PASSWORD@${DBHOST}:${DBPORT}/${DBSERVICENAME}"