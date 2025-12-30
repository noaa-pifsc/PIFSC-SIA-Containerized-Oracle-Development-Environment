# PIFSC SIA Oracle Developer Environment

## Overview
The PIFSC Staff Info App (SIA) Oracle Developer Environment (SCODE) project was developed to provide a custom containerized Oracle development environment (CODE) for the SIA.  This repository can be forked to extend the existing functionality to any data systems that depend on the SIA for both development and testing purposes.  

## Resources
-   ### SCODE Version Control Information
    -   URL: https://github.com/noaa-pifsc/PIFSC-SIA-Containerized-Oracle-Development-Environment
    -   Version: 1.0 (git tag: SIA_CODE_v1.0)
    -   Upstream repository:
        -   CODE Version Control Information:
            -   URL: https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment
            -   Version: 1.3 (git tag: CODE_v1.3)

## Dependencies
\* Note: all dependencies are implemented as git submodules in the [modules](./modules) folder
-   ### SIA Version Control Information
    -   folder path: [modules/staff-info-app](./modules/staff-info-app)
    -   Version Control Information:
        -   URL: <git@picgitlab.nmfs.local:omi-apps/staff-info-app.git>
        -   Application: 1.3 (Git tag: staff_info_app_v1.3)
-   ### Container Deployment Scripts (CDS) Version Control Information
    -   folder path: [modules/CDS](./modules/CDS)
    -   Version Control Information:
        -   URL: <git@github.com:noaa-pifsc/PIFSC-Container-Deployment-Scripts.git>
        -   Scripts: 1.1 (Git tag: pifsc_container_deployment_scripts_v1.1)

## Prerequisites
-   See the CODE [Prerequisites](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#prerequisites) for details

## Repository Fork Diagram
-   See the CODE [Repository Fork Diagram](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#repository-fork-diagram) for details

## Runtime Scenarios
-   See the CODE [Runtime Scenarios](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#runtime-scenarios) for details

## Automated Deployment Process
-   ### Prepare the project
    -   Recursively clone (use --recurse-submodules option) the [SCODE repository](#scode-version-control-information) to a working directory
    -   (optional) Update the [.env](./secrets/.env) custom environment variables accordingly for the SIA app
-   ### Build and Run the Containers 
    -   See the CODE [Build and Run the Containers](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#build-and-run-the-containers) for details
    -   #### SIA Database Deployment
        -   [create_docker_schemas.sql](https://picgitlab.nmfs.local/omi-apps/staff-info-app/-/blob/master/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads) is executed by the SYS schema to create the SIA schema and grant the necessary privileges
        -   [deploy_dev.sql](https://picgitlab.nmfs.local/omi-apps/staff-info-app/-/blob/master/SQL/automated_deployments/deploy_dev.sql?ref_type=heads) is executed with the PICADM schema to deploy the objects to the PICADM schema
        -   [deploy_SIA_dev.sql](https://picgitlab.nmfs.local/omi-apps/staff-info-app/-/blob/master/SQL/automated_deployments/deploy_SIA_dev.sql?ref_type=heads) is executed with the STAFF_INFO_APP schema to deploy the objects to the STAFF_INFO_APP schema

## Customization Process
-   ### Implementation
    -   \*Note: this process will fork the SCODE parent repository and repurpose it as a project-specific CODE
    -   Fork [this repository](#scode-version-control-information)
    -   See the CODE [Implementation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#implementation) for details 
-   ### Upstream Updates
    -   See the CODE [Upstream Updates](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file#upstream-updates) for details

## Container Architecture
-   See the CODE [container architecture documentation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file/-/blob/main/README.md?ref_type=heads#container-architecture) for details
-   ### SCODE Customizations:
    -   [docker/.env](./docker/.env) was updated to define an appropriate APP_SCHEMA_NAME value and remove the TARGET_APEX_VERSION since there is no Apex app or Apex dependencies for the SCODE project
    -   [custom_deployment_functions.sh](./deployment_scripts/functions/custom_deployment_functions.sh) was updated to add the SIA docker-compose.yml file and the [secrets/.env](./secrets/.env) file.  It was also updated to remove the [CODE-ords.yml](./docker/CODE-ords.yml) configuration file
    -   [custom-docker-compose.yml](./docker/custom-docker-compose.yml) was updated to implement file-based secrets, SIA and CODE-specific mounted volume overrides 
    -   [custom_db_app_deploy.sh](./docker/src/deployment_scripts/custom_db_app_deploy.sh) was updated to deploy the SIA database and application schemas
    -   [custom_container_config.sh](./docker/src/deployment_scripts/config/custom_container_config.sh) was updated to define DB credentials and mounted volume file paths for the SIA SQL scripts
    -   Multiple files were added in the [secrets](./secrets) folder to specify secret values (e.g. [sia_pass.txt](./secrets/sia_pass.txt) to specify the SIA database password)
        -   [secrets/.env](./secrets/.env) was updated to specify SIA-specific and CODE-specific environment variables

## Connection Information
-   See the CODE [connection information documentation](https://github.com/noaa-pifsc/PIFSC-Containerized-Oracle-Development-Environment?tab=readme-ov-file/-/blob/main/README.md?ref_type=heads#connection-information) for details
-   ### SIA Database Connection Information
    -   Connection information can be found in [create_docker_schemas.sql](https://picgitlab.nmfs.local/omi-apps/staff-info-app/-/blob/master/SQL/dev_container_setup/create_docker_schemas.sql?ref_type=heads)

## License
See the [LICENSE.md](./LICENSE.md) for details

## Disclaimer
This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project code is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.