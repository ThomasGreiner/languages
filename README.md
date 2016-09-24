## Experiments

1. Factorial of n
2. n-th number in the Fibonacci sequence
3. content length of a local file: [data/file.txt](data/file.txt)
4. content length of a remote file: [https://example.com/](https://example.com/)
5. comma-separated, ascending list of function arguments: "He", "l", "10", "W", "0", "r", "l", "d"

## Expected output

```
fac(12) = 479001600
fib(12) = 144
read() = 15
get() = 1270
sort() = 0,10,He,W,d,l,l,r
```

## Languages

Note: Unless otherwise noted, the following requirements are for running within an Ubuntu environment.

- Assembly (nasm, gcc)
    - Linux 64-bit
- Bash (bash)
    - curl: `apt-get install curl`
- BASIC (fbc)
    - fbc:
        - download from http://www.freebasic.net/get
        - extract to lib/FreeBASIC
- Befunge (bef)
    - bef: `git clone https://github.com/catseye/Befunge-93.git lib/Befunge-93 && cd lib/Befunge-93 && make`
- C++ (g++)
    - libcurl: `apt-get install libcurl4-openssl-dev`
- C# (mcs)
- Go (go)
- Haskell (ghc)
    - cabal: `apt-get install cabal-install`
    - http: `cabal update && cabal install http`
- Java (javac, jar)
- JavaScript (node)
  - TypeScript (tsc)
    - tsd: `npm install -g tsd`
- Lua (lua)
- Pascal (pc)
    - fcl-web: `apt-get install fp-units-fcl`
- Perl (perl)
- PHP (php)
- Python (python)
- Ruby (ruby)
- Rust (rustc)
    - cargo
    - libssl-dev: `apt-get install libssl-dev`
    - hyper: dependency needs to be resolved manually to avoid [Cargo conventions](http://doc.crates.io/guide.html#cargo-conventions)
    `git clone https://github.com/hyperium/hyper lib/hyper && cd lib/hyper && git checkout tags/v0.5.0 && cargo build`
- VBScript (cscript)
    - Windows
