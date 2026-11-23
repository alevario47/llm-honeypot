docker compose down
docker compose build
docker compose up -d
python3 -u gpt.py 2>&1 | tee gpt-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_gpt.txt"
docker compose down
