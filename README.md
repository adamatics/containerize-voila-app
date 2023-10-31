# Containerizing and deploying a Voilá app on AdaLab
This repository contains files that define a Voilá app (`access.log`, `poetry.lock`, `pyproject.toml`, and `logs_analytics.ipynb`) and a Containerfile (`Dockerfile`) that specifies the build steps to build a container image for the Voilá app.

In the following sections, we list the steps required to deploy a Voilá app as a containerized stand-alone app on [AdaLab](https://adamatics.com/index.php/platform-2/).

## Build the container image
First, open a terminal and make sure that the directory you are in is the cloned repository `containerize-voila-app`. Then, from the terminal, build the container image with the below command:

```docker build -t logs-analytics:1.0 .```

The argument `-t logs-analytics:1.0` specifies the name and tag to use for the built container image, and you can specify it as you wish. The only requirement is that a container image with this name does not already exist on your local computer, as this will cause an error, and that the name follows the [Open Container Initiative (OCI) naming convention](https://github.com/containers/image/blob/main/docker/reference/regexp.go).

## Add metadata
Adding metadata also pushes the image to a central storage location.

choose lab since the image was built on your local compute resource

## Deploy app


## Troubleshooting
### Running into the 404 page even after fixing bug
Try to clear cookies and site data in the browser for the AdaLab site, and then make sure you log back in before trying again.

### Unexpectedly receiving a 404 error
- Ensure the "Strip prefix" box is unchecked under advanced settings in the "Deply app" dialog.
- Ensure the Voila.base_url parameter value ends with a "/", e.g. 
voila basics.ipynb --no-browser --port=8080 --Voila.ip=0.0.0.0 --Voila.base_url=/apps/a-basic-app/
- Check that the URL you deployed the app to matches the base_url argument you specified in the start command.

### The Voila spinner appears, but remains at the last cell without rendering the app
Make sure that you specified the Voila.base_url parameter so the app and its contents are located in the expected location.