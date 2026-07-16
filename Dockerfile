FROM archlinux

ARG USERNAME=apple
ARG UID=1000
ARG GID=1000

RUN pacman -Syu --noconfirm --needed \
  vim lolcat lazygit git curl nodejs npm wget make cmake gcc openssh \
  lua luarocks luajit starship zoxide fzf diffutils which yazi trash-cli \
  less bat man locate sudo tree \
  && pacman -Scc --noconfirm

# Build and install Neovim from source
RUN cd /tmp && \
  git clone https://github.com/neovim/neovim && \
  cd neovim && \
  git checkout v0.11.6 && \
  make CMAKE_BUILD_TYPE=Release && \
  sudo make install && \
  nvim --version && \
  cd / && rm -rf /tmp/neovim

# Create group and user matching host UID/GID
RUN groupadd -g ${GID} ${USERNAME} && \
  useradd -m -l -u ${UID} -g ${GID} -G wheel -s /bin/bash ${USERNAME} && \
  echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel && \
  chmod 440 /etc/sudoers.d/wheel

WORKDIR /home/${USERNAME}
COPY .fonts/   /home/${USERNAME}/.fonts/
COPY yazi/     /home/${USERNAME}/.config/yazi/
COPY starship/ /home/${USERNAME}/.config/starship/
COPY .bashrc   /home/${USERNAME}/.bashrc
COPY nvim/     /home/${USERNAME}/.config/nvim/

RUN chown -R ${UID}:${GID} /home/${USERNAME}
USER ${USERNAME}
CMD ["/bin/bash"]
