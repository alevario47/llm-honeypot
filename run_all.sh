#!/bin/bash

cd /home/indigo/Projects/computer-security/llm-honeypot/No-Injection
docker compose down
docker compose build
docker compose up -d
python3 -u gemma.py 2>&1 | tee gemma-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_gemma.txt"
docker compose down
docker compose build
docker compose up -d
python3 -u qwen.py 2>&1 | tee qwen-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_qwen.txt"
docker compose down
docker compose build
docker compose up -d
python3 -u gpt.py 2>&1 | tee gpt-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_gpt.txt"
docker compose down

cd /home/indigo/Projects/computer-security/llm-honeypot/Important-Message
docker compose down
docker compose build
docker compose up -d
python3 -u gemma.py 2>&1 | tee gemma-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_gemma.txt"
docker compose down
docker compose build
docker compose up -d
python3 -u qwen.py 2>&1 | tee qwen-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_qwen.txt"
docker compose down
docker compose build
docker compose up -d
python3 -u gpt.py 2>&1 | tee gpt-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_gpt.txt"
docker compose down

cd /home/indigo/Projects/computer-security/llm-honeypot/Goal-Hijacking
docker compose down
docker compose build
docker compose up -d
python3 -u gemma.py 2>&1 | tee gemma-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_gemma.txt"
docker compose down
docker compose build
docker compose up -d
python3 -u qwen.py 2>&1 | tee qwen-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_qwen.txt"
docker compose down
docker compose build
docker compose up -d
python3 -u gpt.py 2>&1 | tee gpt-steps.txt
docker compose logs --no-color > "logs_$(basename "$PWD")_gpt.txt"
docker compose down
