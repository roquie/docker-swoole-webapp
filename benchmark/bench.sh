#!/usr/bin/env bash

wrk -t8 -c1000 -d10s http://127.0.0.1:8080/
