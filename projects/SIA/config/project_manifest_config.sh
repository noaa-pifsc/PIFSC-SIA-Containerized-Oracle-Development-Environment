#!/bin/bash

	# define the database scripts mapping using the pipe character as a delimiter
	# The elements should contain encoded values with the "|" character as the delimiter: sql path (within container)|sql script file|User Secret Name|Password Secret Name|Script Password Secrets (this can be one or more optional pipe-delimited secret names when a password is injected into the script - examples include a CREATE USER command) 
	
	# create schemas script - executed as SYSDBA
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/SIA/modules/SIA/SQL|@dev_container_setup/create_docker_schemas.sql|oracle_admin_user|oracle_pwd|picadm_db_password_secret|sia_db_password_secret")

	# create PICADM data schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/SIA/modules/SIA/SQL|@automated_deployments/deploy_dev.sql|picadm_db_username_secret|picadm_db_password_secret")

	# create STAFF_INFO_APP schema objects
	DB_SCRIPTS_MAP+=("${BUILD_PATH}/../../projects/SIA/modules/SIA/SQL|@automated_deployments/deploy_SIA_dev.sql|sia_db_username_secret|sia_db_password_secret")

	# define the array of compose files that are used by the individual projects (specify the path relative to the core/build directory

	# add the secrets for PRI to the code-db-ords-deploy container
	COMPOSE_FILES+=("../../projects/SIA/build/sia_secrets.yml")
	
	# add the PRI application container
	COMPOSE_FILES+=("../../projects/SIA/modules/SIA/container_application_deployment/docker-compose.yml")

	# Override and define additional properties for the PRI application container
	COMPOSE_FILES+=("../../projects/SIA/build/custom_sia.yml")

	# add the secrets
	# Example:
	SECRET_MAPPING_ARR+=(
		["picadm_db_username_secret"]="DB_PICADM_USER"
		["picadm_db_password_secret"]="DB_PICADM_PASSWORD"
		["sia_db_username_secret"]="DB_SIA_USER"
		["sia_db_password_secret"]="DB_SIA_PASSWORD"
		)