Benchmark
---------

Testing environment

* 8 vCPU
* 32 GB RAM
* Ubuntu 18.04
* Running from Docker-ce 18.09.0~3-0~ubuntu-bionic
* Swoole version 4.2.7

Hetzner CX51 Virtual Machine from Cloud.

Command to run app:

```bash
docker run -d --rm -it --init -p 8080:8080 roquie/docker-swoole-webapp:latest
```

Command to run http tests:
```bash
./examples/bench.sh # wrk -t8 -c1000 -d10s http://127.0.0.1:8080/
```

Results:

```bash
root@test-server ~/wrk/docker-swoole-webapp # wrk -t8 -c1000 -d10s http://127.0.0.1:8080/
Running 10s test @ http://127.0.0.1:8080/
  8 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    12.07ms    7.21ms 249.03ms   87.74%
    Req/Sec    10.09k     1.83k   27.86k    87.31%
  806302 requests in 10.10s, 126.88MB read
Requests/sec:  79826.96
Transfer/sec:     12.56MB
```
