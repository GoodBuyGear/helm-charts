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

## Troubleshooting

Syntax check your templates
`helm template tush-app . --values values.staging.yaml`

## Updating the chart

1. Make your edits/
2. Make sure to increment the chart version in `Chart.yaml` this will update the chart repo
3. Merge to main and push to remote
4. The `release` github will update the chart repo
