FROM psmware/ansible-docker:1.2
LABEL name=ie.psmware.ansible-skeleton
LABEL vendor="psmware ltd"
LABEL ie.psmware.ansible-skeleton.version="1.0"
LABEL ie.psmware.ansible-skeleton.version.release-date="2020-04-10"
LABEL ie.psmware.ansible-skeleton.version.version.is-production=""
### Setting up Post Build taks to install ssh and GPG keys in container
RUN echo "source /app/.devcontainer/.post.sh" >> /home/coder/.zshrc