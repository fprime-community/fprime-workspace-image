# Ansible based template for KASM Ubuntu Focal Images

## Introduction

This repo provides an [Ansible](https://www.ansible.com/) based template for building [Kasm](https://www.kasmweb.com/) workspaces (images) using Ubuntu Focal.  The included Dockerfile is based on the KASM documentaion on [building custom images](https://kasmweb.com/docs/latest/how_to/building_images.html).  

## How to Use this Repo

1. Fork this repo, giving the new repo a descriptive name for the workspace image to be created
1. Edit `README.md` to reflect the purpose and configuration of the new workspace image (make sure to edit the page title at the top of the file)
1. Edit the `docker-compose.yml` file and update the `image:` entry to reflect the workspace image to be created
1. Add Ansible Galaxy packages to the `requirements.yaml` file as needed for the playbook
1. Add new Ansible plays to the `playbook.yaml` file to implement the workspace
1. Replace `bg_custom.png` with a new desktop wallpaper if desired, making sure to maintain the filename `bg_custom.png` 
1. Run `docker-compose build` to build the workspace image.  Note, debugging build errors is easier when you switch the docker-compose [progress mode](https://docs.docker.com/engine/reference/commandline/compose_build/#options) to plain (`docker-compose build --progress plain`).  Alternatively, you can pull the published version (when available) by calling `docker-compose pull`.
1. Be sure to add a repository secret named `GHCR_AUTH_TOKEN` containing a valid token value with packages write access to properly enable GitHub CI.

If you encounter Ansible errors, revise the requirements and playbook files as necessary.  

## Dev Resources

See the `devResources` directory for instructions and templates related to installing various tools that require additional steps to properly install/execute.  Examples include Chrome and VS Code (including extensions)

## Using the image locally

Once built, the image can be pushed into the Kasm server per Kasm documentation or it can be run locally on port 6901 using docker-compose.

- **Starting the image locally:** Run `docker-compose up -d`
- **Stopping the image locally:** Run `docker-compose down`

When running locally, the workspace can be accessed at https://localhost:6901 with
- **User:** `kasm_user`
- **Passwordd:** `password`
