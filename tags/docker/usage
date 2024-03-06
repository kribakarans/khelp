Docker command line usage:

Build:
    Build Docker image in $PATH_NAME
    docker build [OPTIONS] PATH | URL | -

    docker build -a -t <image-name>:<tag> $PATH_NAME

    Dockerfile:
        docker build -f Dockerfile.debug .

    Build_outputs:
        docker build -o out .

    Specify_Output_Build_Type:
        docker build --output type=local,dest=out .
        docker build --output type=tar,dest=out.tar .

PS_Format:
    docker ps --format '{{.ID}}'
    docker ps --format '{{.Names}}'
    docker ps --format '{{.Image}}'
    docker ps --format '{{.Command}}'
    docker ps --format '{{.RunningFor}}'
    docker ps --format '{{.Status}}'
    docker ps --format '{{.Ports}}'

    Example:
    docker ps --format "table {{.Image}}\t{{.Ports}}\t{{.Names}}"
    docker ps --format "\nDocker Details \nID:{{.ID}} \nNames: {{.Names}} \nSize: {{.Size}} "

    Weblinks:
    https://docs.docker.com/engine/reference/commandline/ps/#formatting

Remove:
    docker rm <container-id>    # Remove container
    docker rm -f <container-id> # Force remove running container
    docker rmi <image-id>       # Remove image

    Delete all containers
        docker rm -f $(docker ps -a -q)

    Delete dangling docker images
        docker rmi $(docker images -f 'dangling=true' -q)

Rename:
    Rename Docker Image
    docker tag <image-id> <new-image-name:tag>

Load:
    Load Docker image from an archive
    docker load --input <docker-image-archive>

Save:
    Save Docker image to an archive
    docker save <image-id>:<tag>                         # Write image to stdout
    docker save -o <archive-name> <image-id>:<tag>       # Write image to Tarball
    docker save <image-id>:<tag> | gzip > <archive-name> # Write image to TGZ archive

Commit:
    Committing running container changes to new Docker Image
    docker commit <container-id> <new-image-name>
    Example:
        docker commit deddd39fa163 ubuntu-new

Port_forwarding:
    docker run -p 9000:8080 -it <image-id>:<tag> <command>

