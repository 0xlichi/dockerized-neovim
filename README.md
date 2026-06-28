## Arch Linux Dockerized Neovim Setup Script

This is a Dockerfile designed to create a personalized and highly customized Arch Linux environment, optimized for a user experience focused on power tools, text editing, and efficient system management.

Before using set a strong password for sudo users

###  Features Included

This image sets up a base environment with a curated set of essential and powerful tools:

* **Powerful Text Editors & Utilities:** `neovim`, `vim`, `lolcat`, `bat`, `less`, `fzf`, `diffutils`.
* **Git & Version Control:** `git`, `lazygit`.
* **System & Build Tools:** `make`, `cmake`, `gcc`, `wget`, `make`, `pacman`.
* **Shell & Navigation Enhancements:** `starship`, `zoxide`, `fzf`, `yazi`.
* **System Utilities:** `ls`, `tree`, `locate`, `sudo`, `trash-cli`.
* **Programming & Scripting:** `nodejs`, `npm`, `lua`, `luajit`, `luarocks`.
* **Networking & Access:** `curl`, `openssh`.
* **Essential Tooling:** `which`, `man`.

###  Build Details

The Dockerfile is built upon the **Arch Linux** base.

**Customization Variables:**

The setup uses build arguments to easily customize the default username and user/group IDs:

| Argument | Default Value | Description |
| :--- | :--- | :--- |
| `USERNAME` | `apple` | The desired primary username. |
| `UID` | `1000` | The numerical User ID. |
| `GID` | `1000` | The numerical Group ID. |

**Installation Process:**

1. **System Update:** Runs `pacman -Syu --noconfirm --needed` to ensure the system is fully updated.
2. **Package Installation:** Installs all specified packages.
3. **Cleanup:** Runs `pacman -Scc --noconfirm` to clean up the package cache, keeping the image size manageable.

###  File Structure & Configuration

The Dockerfile copies specific configuration files and fonts into the user's home directory to customize the experience:

* **Configuration Overrides:**
    * `.fonts/` (Custom fonts)
    * `yazi/` (Yazi configuration)
    * `starship/` (Starship prompt configuration)
    * `.bashrc` (Custom shell configuration)
    * `nvim/` (Neovim configuration)

###  How to Use This Image

This Dockerfile is intended to be used to build a custom environment within a Docker container.

**1. Build the Image:**

Save the code above as `Dockerfile` and run:

```bash
docker build -t custom-arch-env .
```

**2. Run the Container:**

Run the resulting container interactively to enter your new environment:

```bash
docker run -it --name my-custom-shell custom-arch-env /bin/bash
```
**3. A pre build image:**
```bash
docker run -it --name custom-name 0xlichi/neovim
```

You will be dropped directly into the home directory of the newly created user (`apple`), ready to start using your powerful toolset!
---
