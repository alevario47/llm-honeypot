#!/bin/bash

cd /home/indigo/Projects/computer-security/llm-honeypot/No-Injection
docker compose down
docker compose build
docker compose up -d
python3 gemma.py > gemma-steps.txt
python3 ministral.py > ministral-steps.txt
python3 qwen.py > qwen-steps.txt
docker compose down

cd /home/indigo/Projects/computer-security/llm-honeypot/Important-Message
docker compose down
docker compose build
docker compose up -d
python3 gemma.py > gemma-steps.txt
python3 ministral.py > ministral-steps.txt
python3 qwen.py > qwen-steps.txt
docker compose down

cd /home/indigo/Projects/computer-security/llm-honeypot/Goal-Hijacking
docker compose down
docker compose build
docker compose up -d
python3 gemma.py > gemma-steps.txt
python3 ministral.py > ministral-steps.txt
python3 qwen.py > qwen-steps.txt
docker compose down
