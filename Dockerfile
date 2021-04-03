FROM fedora:33

ENV PATH="/root/go/bin:${PATH}"
RUN dnf --setopt=install_weak_deps=False --best -y install \
    golang \
    nodejs \
    npm \
    git \
    diffutils && \
  go get github.com/vugu/vgrun && \
  vgrun -install-tools && \
  curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /root/go/bin v1.35.2 && \
  curl -L https://github.com/ethereum/solidity/releases/download/v0.8.3/solc-static-linux > /usr/bin/solc && \
  chmod a+x /usr/bin/solc && \
  dnf clean all && \
  rm -rf /root/go/pkg
