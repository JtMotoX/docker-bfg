# docker-bfg

This is a lightweight (~30mb compressed) Docker image with [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/).

<br />

# Usage

Then you can just execute bfg ([examples](https://rtyley.github.io/bfg-repo-cleaner/#examples)).

## Examples

### Linux

*You need to run the container with same user id as current user to prevent repo permission issues*

```bash
docker run --rm -it -v "$(pwd):/work" -u $(id -u ${USER}):$(id -g ${USER}) jtmotox/bfg --replace-text passwords.txt my-repo.git
```

If you have the [alias](#alias) set, you can run it as:

```bash
bfg --replace-text passwords.txt my-repo.git
```

### Windows

```bash
docker run --rm -it -v "%cd%:/work" jtmotox/bfg --replace-text passwords.txt my-repo.git
```

<br />

# Alias

If you don't want to run the docker command every time, you can set the following alias:

```bash
alias bfg='docker run --rm -it -v "$(pwd):/work" -u $(id -u ${USER}):$(id -g ${USER}) jtmotox/bfg'
```

<br />

# Tags

- **alpine, latest**

	Size: ~30mb

	Supports the following architectures:
	- linux/amd64
	- linux/arm64
	- linux/arm64/v8

<br />

- **ubuntu**

	Size: ~60mb

	Supports the following architectures:
	- linux/amd64
	- linux/arm/v7
	- linux/arm64
	- linux/arm64/v8
	- linux/ppc64le
