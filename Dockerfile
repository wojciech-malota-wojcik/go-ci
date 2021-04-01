FROM fedora:33

ENV PATH="/root/go/bin:${PATH}"
RUN dnf --setopt=install_weak_deps=False --best -y install \
    golang \
    nodejs \
    git \
    diffutils && \
  go get github.com/vugu/vgrun && \
  vgrun -install-tools && \
  curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /root/go/bin v1.35.2 && \
  dnf clean all && \
  rm -rf /root/go/pkg
