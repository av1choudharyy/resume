# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX-based resume template using the Resumake Template 6 format. The project uses XeLaTeX for compilation to support custom fonts.

## Build Commands

### Manual Build

This project requires XeLaTeX to compile because it uses custom fonts.

To build the resume:

```bash
xelatex resume.tex
```

### Installing XeLaTeX

#### macOS

```bash
# Option 1: Install BasicTeX (smaller, ~80MB)
brew install --cask basictex

# Option 2: Install full MacTeX (larger, ~4GB)
brew install --cask mactex
```

#### Windows

1. Download and install [MiKTeX](https://miktex.org/download)
2. Open command prompt and run: `xelatex resume.tex`

#### Linux (Ubuntu/Debian)

```bash
sudo apt-get install texlive-xetex texlive-fonts-extra
```

### Online Build (No Installation Required)

1. Go to [Overleaf](https://www.overleaf.com)
2. Create a new project
3. Upload all files including the `fonts/` directory
4. Change compiler to XeLaTeX (Menu → Compiler → XeLaTeX)
5. Click Recompile

### GitHub Actions Build

The project includes GitHub Actions workflows that automatically build the resume when you push changes:

1. **Simple Build** (`.github/workflows/build-simple.yml`):

   - Builds resume.pdf on every push
   - Downloads PDF from Actions tab → click workflow run → Artifacts

2. **Release Build** (`.github/workflows/build-resume.yml`):
   - Builds resume.pdf on every push to main branch
   - Creates a GitHub release with the PDF attached automatically
   - Triggered by changes to: resume.tex, config/, fonts/ or workflow files
   - Releases are tagged as v{run_number} with the PDF attached
   - Uses Docker caching for faster builds

To use:

1. Push this project to GitHub
2. Go to Actions tab
3. Click "Build Resume" workflow
4. Download the PDF artifact or check Releases

## Architecture and Structure

### Core Files

- `resume.tex`: Main resume document containing personal information and content sections (experience, education, skills)
- `config/minimal-resume-config.tex`: Configuration loader that imports the style package and custom commands
- `config/minimal-resume.sty`: Style package defining layout, fonts, spacing, and custom commands
- `config/custom-command.tex`: Additional custom LaTeX commands (currently only page numbering settings)

### Key Components

#### Style System

The resume uses a custom style system defined in `config/minimal-resume.sty` that provides:

- Custom font size commands: `\sizeone` through `\sizesix` using golden ratio scaling
- Font families: Montserrat for headers, Crimson Text for body text
- Custom environments: `newitemize` for formatted lists
- Custom commands: `\personal`, `\chap`, `\job`, `\school`, `\skills`, `\format`

#### Document Structure

The resume follows this pattern:

1. Personal information header (name, contact, professional summary)
2. Experience section with `\job` entries containing formatted bullet points
3. Skills section with categorized technical skills
4. Education section with `\school` entries

#### Font Dependencies

The project uses the following fonts from the `fonts/` directory:

- Montserrat-Regular.ttf (headers)
- Montserrat-Light.otf (contact info)
- Montserrat-Bold.ttf (section titles)
- CrimsonText-Regular.ttf (body text)
- CrimsonText-Italic.ttf (italic text)
- CrimsonText-SemiBold.ttf (emphasis)

All fonts must be present for XeLaTeX compilation to succeed.

## Documentation

- `README.md`: Project documentation with setup instructions, features, and usage guide
- `CLAUDE.md`: Instructions for Claude Code when working with this repository

## GitHub Actions Integration

The project includes Claude Code GitHub App integration for seamless AI-assisted development. The workflows automatically:

- Build PDF on every push to main
- Create releases with versioned PDFs
- Cache Docker layers for improved performance
- Support manual triggering via workflow_dispatch

## Development Workflow

1. Edit `resume.tex` with your content
2. Push changes to trigger automatic builds
3. Download PDFs from GitHub releases or Actions artifacts
4. Use Claude Code for automated assistance with LaTeX editing and troubleshooting
