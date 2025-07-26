#!/bin/bash

echo "Testing LaTeX build with Docker..."

# Use the same image as GitHub Actions
docker run --rm \
    --platform linux/amd64 \
    -v "$PWD":/github/workspace \
    -w /github/workspace \
    ghcr.io/xu-cheng/texlive-full:latest \
    xelatex resume.tex

if [ -f "resume.pdf" ]; then
    echo "✅ Build successful! resume.pdf created."
    ls -la resume.pdf
else
    echo "❌ Build failed!"
    exit 1
fi