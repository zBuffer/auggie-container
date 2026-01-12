# Auggie Container

A Docker container wrapper for running [Auggie](https://www.npmjs.com/package/@augmentcode/auggie), Augment Code's CLI-based agentic coding assistant.

## Prerequisites

- Docker installed and running
- An Augment Code account with API access

## Quick Start

1. **Build the Docker image:**

   ```bash
   ./auggie.sh build
   ```

2. **Run Auggie:**

   ```bash
   ./auggie.sh
   ```

   This mounts your current directory to `/app` inside the container and shares your `~/.augment` credentials.

## Optional: Create an Alias

For convenience, add an alias to your shell:

```bash
./auggie.sh alias
```

This adds `aug` as an alias to your `~/.bashrc`, allowing you to run Auggie from any directory:

```bash
aug
```

## How It Works

- The Dockerfile installs `@augmentcode/auggie` globally in a Node.js 24 container
- The `auggie.sh` script handles building the image and running the container
- Your working directory is mounted at `/app` inside the container
- Augment credentials are shared from `~/.augment`

## License

MIT License - see [LICENSE](LICENSE) for details.
