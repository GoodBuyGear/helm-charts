## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add [alias] https://[orgname].github.io/helm-charts

For exmaple:

  `helm repo add gbg-helm-charts https://goodbuygear.github.io/helm-charts/`

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
<alias>` to see the charts.

To install the <chart-name> chart:

    helm install my-<chart-name> <alias>/<chart-name>

To uninstall the chart:

    helm delete my-<chart-name>

## Updating the chart

1. Make your edits
2. Make sure to increment the chart version in `Chart.yaml` this will update the chart repo
3. Merge to main and push to remote
4. The `release` github will update the chart repo

## Troubleshooting

### Syntax check your templates

`helm template tush-app . --values values.staging.yaml  --set DD_API_KEY=****  --set SENTRY_KEY=***** --set DEPLOYMENT_ID=**** --set GITHUB_TOKEN=**** --set TARGET_SHA=***`

`kubectl config use-context GBG-Staging`

`helm template inventory-processing-app . --values values.staging.yaml  --set TARGET_SHA=0c4252b17e594f7cb2f5204085f75d130621840b`

### Run update from local
```bash
cd charts/tush-app
helm upgrade tush-app .  --debug  --atomic  --install  --kube-context GBG-Staging  --values values.staging.yaml  --set DD_API_KEY=***  --set SENTRY_KEY=*** --set TARGET_SHA=9a290ba0458e3a0fe31ef1f83e3cb6c84c050b10
```
#### Errors
##### Not authenticated to the cluster
**Error**

`Kubernetes cluster unreachable: the server has asked for the client to provide credentials`

**Fix**
```bash
AWS_PROFILE=gbg-staging aws-iam-authenticator token -i <cluster name>
AWS_PROFILE=gbg-staging aws eks update-kubeconfig --name <cluster name> --region <cluster region>
```