#!/usr/bin/env bash

wrk -t4 -c400 -d10s http://127.0.0.1:8080/
