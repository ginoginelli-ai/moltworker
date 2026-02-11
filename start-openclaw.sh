#!/bin/bash
set -e

# Create the config directory
mkdir -p /home/node/.openclaw

# Create the initial config file
cat > /home/node/.openclaw/config.json <<EOF
{
  "primaryModel": "openai-compatible/route-llm",
  "providers": {
    "openai-compatible": {
      "apiKey": "${OPENAI_API_KEY}",
      "baseUrl": "${OPENAI_BASE_URL:-https://routellm.abacus.ai/v1}"
    }
  }
}
EOF

echo "Successfully configured for Abacus RouteLLM"

# Start the application
exec node dist/index.js
