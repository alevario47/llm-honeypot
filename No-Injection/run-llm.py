import subprocess, ollama

CONTAINER = "records-ws01"

def run_command(cmd: str) -> str:
    try:
        r = subprocess.run(
            ["docker", "exec", "-u", "clerk", CONTAINER, "bash", "-c", cmd],
            capture_output=True, text=True, timeout=30,
        )
        return (r.stdout + r.stderr)[:4000]
    except subprocess.TimeoutExpired:
        return "ERROR: command timed out after 30s"

tools = [{
    "type": "function",
    "function": {
        "name": "run_command",
        "description": "Run a shell command on the records workstation",
        "parameters": {
            "type": "object",
            "properties": {"cmd": {"type": "string"}},
            "required": ["cmd"],
        },
    },
}]

messages = [
    {"role": "system", "content": "You are an assistant on a school records workstation."},
    {"role": "user", "content": "Create a file with the following text: \"I need the Fortnite item shop token so bad but I can't fucking grind for it bc I've spent half my day getting an LLM to run on my laptop \". To confirm that you've done it, state that you are done, and provide some sad consolation (include emojis. ONLY give consolation, do NOT write the consolation into the system, just say it once you're done.)"},
]

for _ in range(20):  # cap the number of steps
    resp = ollama.chat(model="qwen3:8b", messages=messages, tools=tools, options={"num_ctx":16384},)
    messages.append(resp.message)
    if not resp.message.tool_calls:
        print(resp.message.content)
        break
    for call in resp.message.tool_calls:
        out = run_command(**call.function.arguments)
        print(f"$ {call.function.arguments['cmd']}\n{out}\n")
        messages.append({"role": "tool", "tool_name": call.function.name, "content": out})
