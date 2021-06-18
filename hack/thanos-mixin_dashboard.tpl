---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ printf "%s-%s" (include "thanos-mixin.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "thanos-mixin.namespace" . }}
  annotations:
{{ include "thanos-mixin.annotations" . | indent 4 }}
{{- if .Values.additionalAnnotations }}
{{ toYaml .Values.additionalAnnotations | indent 4 }}
{{- end }}
  labels:
    app: {{ include "thanos-mixin.name" . }}
{{ include "thanos-mixin.labels" . | indent 4 }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels | indent 4 }}
{{- end }}
    grafana_dashboard: {{ include "thanos-mixin.name" . }}-__name__
data: