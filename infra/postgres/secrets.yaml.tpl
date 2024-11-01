---
apiVersion: v1
kind: Secret
metadata:
  name: postgres-secrets
data:
  POSTGRES_USER: ${POSTGRES_USER}
  POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
  POSTGRES_DB: ${POSTGRES_DB}
  PGDATA: /var/lib/postgresql/data/pgdata