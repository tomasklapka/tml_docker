This is a docker image with [TML](https://github.com/IDNI/tau).

### Usage:

1. install docker
2. clone (or download) this repository
3. build image: `docker build --tag tml .`
4. run TML programs: `cat logic_program.tml | docker run -i tml`
