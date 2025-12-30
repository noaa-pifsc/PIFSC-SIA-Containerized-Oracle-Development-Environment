#!/bin/sh

echo "running the custom database and/or application deployment scripts"


	# change the directory to the SIA folder path so the SQL scripts can run without alterations
	cd ${SIA_FOLDER_PATH}

	# create the SIA schema(s)
sqlplus -s /nolog <<EOF
@dev_container_setup/create_docker_schemas.sql
$SYS_CREDENTIALS
EOF

	echo "Create the SIA data objects"

	# execute the SIA database deployment scripts
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_dev.sql
$PICADM_CREDENTIALS
EOF

	echo "the SIA data objects were created"



	echo "Create the SIA app objects"

	# execute the SIA database deployment scripts
sqlplus -s /nolog <<EOF
@automated_deployments/deploy_SIA_dev.sql
$SIA_CREDENTIALS
EOF

	echo "the SIA app objects were created"


	echo "SQL scripts executed successfully!"

echo "custom deployment scripts have completed successfully"
