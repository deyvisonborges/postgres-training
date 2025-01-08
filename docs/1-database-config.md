Aqui vamos subir um servico postgres usando docker via linha de comando mesmo:
docker run --name postgres-estudos \
  -e POSTGRES_USER=admin \
  -e POSTGRES_PASSWORD=admin \
  -e POSTGRES_DB=estudos \
  -p 5432:5432 \
  -d ecommerce

usuario: admin
senha: admin
base de dados: ecommerce
porta: 5432
host: localhost ou 127.0.0.1

