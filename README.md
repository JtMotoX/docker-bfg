# docker-bfg

This is a lightweight (~60mb compressed) Docker image with [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/).

---

Supports multiple architectures:
- linux/amd64
- linux/arm/v7
- linux/arm64
- linux/ppc64le

---

## Usage

If you don't want to run the docker command every time, you can set the following alias:

```bash
alias bfg='docker run --rm -v "$(pwd):$(pwd)" -w "$(pwd)" jtmotox/bfg'
```

Then you can just execute bfg ([examples](https://rtyley.github.io/bfg-repo-cleaner/#examples)).
