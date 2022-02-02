FROM kasmweb/core-ubuntu-focal
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

# install Ansible per 
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu
RUN apt update && apt -y install software-properties-common && add-apt-repository --yes --update ppa:ansible/ansible && apt install -y ansible && rm -rf /var/lib/apt/lists/*

# run Ansible commands
COPY ./requirements.yaml ./playbook.yaml ./
RUN ansible-galaxy install -r requirements.yaml && ansible-playbook -i,localhost playbook.yaml && rm -f ./*.yaml

# Custom Desktop Background - replace bg_custom.png on disk with your own background image
COPY ./bg_custom.png /usr/share/extra/backgrounds/bg_default.png

# Create .profile and set XFCE terminal to use it
RUN cp /etc/skel/.profile $HOME/.profile && mkdir $HOME/.config/xfce4/terminal/
COPY ./terminalrc /home/kasm-default-profile/.config/xfce4/terminal/terminalrc

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000