{{- /* templates/_helpers.tpl */ -}}

{{- define "examkube_chart.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "examkube_chart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "examkube_chart.name" . -}}
{{- if .Values.nameOverride -}}
{{- printf "%s" (.Values.nameOverride | trunc 63 | trimSuffix "-") -}}
{{- else if .Release.Name -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "examkube_chart.labels" -}}
app.kubernetes.io/name: {{ include "examkube_chart.name" . }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end -}}

{{- define "examkube_chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "examkube_chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

