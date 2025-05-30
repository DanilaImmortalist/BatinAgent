#!/bin/bash

# Deployment script for Batin Assistant n8n workflows

echo "🚀 Deploying Batin Assistant to Render..."

# Export workflows to JSON (when working locally)
echo "📦 Exporting workflows..."
# This will be populated when we have actual n8n workflows

# Commit changes to git
echo "💾 Committing changes..."
git add .
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"

# Push to trigger Render deployment
echo "🔄 Pushing to repository..."
git push origin main

echo "✅ Deployment initiated! Check Render dashboard for status." 