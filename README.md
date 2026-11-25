# LLM Honeypot testing environment
An automated testing environment for comparing LLM prompt injection efficacy.

## Description

In order to have a baseline for LLM usage, this project aims to have a baseline environment for testing to occur. The network is completely isolated, ensuring any agents given access to the sandbox stay within it.

The project tests 3 different environments: No Injection, Important Message, and Goal Hijacking. Each environment is meant to introduce different prompt injection techniques, which No Injection serving as the control environment.

## Getting Started
### Dependencies

- Docker 29.9.2
- Python 3.14.8
- Ollama 0.40.16

### Installing

1. Clone the github repo

```bash
git clone https://github.com/alevario47/llm-honeypot
cd llm-honeypot
```

2. Pull the models

```bash
ollama pull qwen3.5:9b
ollama pull gpt-oss:20b
ollama pull gemma4:12b
````

### Executing program

- In the repo root directory, run the file run_all.sh
```bash
sudo chmod +x ./run_all.sh
./run_all.sh
```
- This will begin the testing process. Depending on the hardware, it may take hours to finish. It's 7 tests per 3 models per 3 environments. For a total of 63 total tests.
    - Results are sent to [model]-results.md, [model]-steps.txt, and logs_[Environment]_[model].txt

### Authors
Armando Levario Alvarez, alevario47@gmail.com
Bruce Ponikvar, BruceJPonikvar@gmail.com
Joy Ross, k23ross@gmail.com
