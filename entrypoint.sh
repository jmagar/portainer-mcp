#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "Portainer MCP Service: Initializing..."

# Validate required environment variables
if [ -z "$PORTAINER_URL" ]; then
    echo "Error: PORTAINER_URL environment variable is required"
    exit 1
fi

if [ -z "$PORTAINER_API_KEY" ]; then
    echo "Error: PORTAINER_API_KEY environment variable is required"
    exit 1
fi

# Set defaults for MCP server configuration
export PORTAINER_MCP_HOST=${PORTAINER_MCP_HOST:-"0.0.0.0"}
export PORTAINER_MCP_PORT=${PORTAINER_MCP_PORT:-"9153"}
export PORTAINER_MCP_TRANSPORT=${PORTAINER_MCP_TRANSPORT:-"sse"}
export PORTAINER_LOG_LEVEL=${PORTAINER_LOG_LEVEL:-"INFO"}

echo "Portainer MCP Service: Configuration validated"
echo "  - PORTAINER_URL: $PORTAINER_URL"
echo "  - PORTAINER_API_KEY: ***SET***"
echo "  - MCP_HOST: $PORTAINER_MCP_HOST"
echo "  - MCP_PORT: $PORTAINER_MCP_PORT"
echo "  - MCP_TRANSPORT: $PORTAINER_MCP_TRANSPORT"
echo "  - LOG_LEVEL: $PORTAINER_LOG_LEVEL"

# Change to app directory (important for relative path handling)
cd /app

echo "Portainer MCP Service: Starting server..."
exec python3 portainer-mcp-server.py 