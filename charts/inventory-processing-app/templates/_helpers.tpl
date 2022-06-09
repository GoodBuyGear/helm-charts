{{/*
Expand the name of the chart.
*/}}
{{- define "inventory-processing-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "inventory-processing-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "inventory-processing-app.labels" -}}
helm.sh/chart: {{ include "inventory-processing-app.chart" . }}
{{ include "inventory-processing-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "inventory-processing-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "inventory-processing-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

