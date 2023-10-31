# app-templates



## Getting started


## Troubleshooting
### Running into the 404 page even after fixing bug
Try to clear cookies and site data in the browser for the AdaLab site, and then make sure you log back in before trying again.

### Unexpectedly hitting 404
- Ensure the "Strip prefix" box is unchecked under advanced settings in the "Deply app" dialog.
- Ensure the Voila.base_url parameter value ends with a "/", e.g. 
voila basics.ipynb --no-browser --port=8080 --Voila.ip=0.0.0.0 --Voila.base_url=/apps/a-basic-app/
- Check that the URL you deployed the app to matches the base_url argument you specified in the start command.

### The Voila spinner appears, but remains at the last cell without rendering the app
Make sure that you specified the Voila.base_url parameter so the app and its contents are located in the expected location.