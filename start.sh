#!/bin/bash
docker build -t foirshtein_db .
docker run -d -p 1433:1433 foirshtein_db
