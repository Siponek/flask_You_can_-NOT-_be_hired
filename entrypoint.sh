#!/bin/bash
npm create vite-app my-vite-app

npm rebuild esbuild

exec "$@"

npm install