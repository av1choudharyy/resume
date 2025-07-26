# LaTeX Resume

A professional resume template built with LaTeX using the Resumake Template 6 format. This project uses XeLaTeX for compilation to support custom fonts and includes automated GitHub Actions workflows for building and releasing PDF versions.

## Features

- Clean, professional LaTeX resume template
- Custom font support (Montserrat and Crimson Text)
- Automated PDF builds via GitHub Actions
- Automatic releases when changes are made
- Support for local and online (Overleaf) compilation

## Quick Start

### Prerequisites

You'll need XeLaTeX installed to compile the resume locally.

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

### Building Locally

To compile the resume:
```bash
xelatex resume.tex
```

This will generate `resume.pdf` in the current directory.

### Online Compilation (No Installation Required)

1. Go to [Overleaf](https://www.overleaf.com)
2. Create a new project
3. Upload all files including the `fonts/` directory
4. Change compiler to XeLaTeX (Menu → Compiler → XeLaTeX)
5. Click Recompile

## GitHub Actions

This project includes automated workflows that build your resume when you push changes:

### Automatic Releases
When you push changes to `resume.tex`, `config/`, or `fonts/`, the workflow will:
1. Build the PDF using XeLaTeX
2. Create a new GitHub release
3. Attach the PDF to the release

### Manual Builds
You can also trigger builds manually from the GitHub Actions tab.

## Project Structure

```
.
├── resume.tex                          # Main resume document
├── config/
│   ├── minimal-resume-config.tex       # Configuration loader
│   ├── minimal-resume.sty              # Style definitions
│   └── custom-command.tex              # Custom LaTeX commands
├── fonts/                              # Custom font files
│   ├── Montserrat-Regular.ttf
│   ├── Montserrat-Light.otf
│   ├── Montserrat-Bold.ttf
│   ├── CrimsonText-Regular.ttf
│   ├── CrimsonText-Italic.ttf
│   └── CrimsonText-SemiBold.ttf
└── .github/workflows/                  # GitHub Actions workflows
    ├── build-resume.yml                # Automated release builds
    └── build-simple.yml                # Simple artifact builds
```

## Customization

### Personal Information
Edit the personal information section in `resume.tex`:
```latex
\personal{Your Name}{your.email@example.com}{(123) 456-7890}{Your Professional Title}
```

### Content Sections
The resume includes sections for:
- Professional Summary
- Experience (`\job` command)
- Skills (`\skills` command)  
- Education (`\school` command)

### Styling
Customize fonts, colors, and layout in `config/minimal-resume.sty`.

## License

This project is based on the Resumake Template 6 format.