# Leptos CSR with vite and stylance

This is a template for using Leptos in CSR mode and Vite as bundler and stylance for styles.

## Installation

Make sure  you have NodeJS installed in your system then run:
```bash
npm install
```

Install the following cargo tools:
```bash
cargo install wasm-pack cargo-watch just stylance-cli
```

## Usage

### Development
During development simply run:
```bash
just dev
```

This will simultaneously run:
* vite in dev mode (which will create a dev server)
* stylance-cli in watch mode
* cargo-watch to rebuild the wasm


### Release
To make a release build run:

```bash
just build
```

which will first build your wasm file, then build styles with stylance-cli and finally use vite to bundle bundle it into the dist folder.
