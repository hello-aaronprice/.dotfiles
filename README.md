# .dotfiles

Heavy inspiration from '[ThePrimeagen's GitHub](https://github.com/ThePrimeagen/.dotfiles)' and '[JessFraz's GitHub](https://github.com/jessfraz/dotfiles)'

### Pre-reqs

To setup, see my Ansible Repo to download and install individual applications
'[hello-aaronprice/ansible](https://github.com/hello-aaronprice/ansible)'
```console
$ git clone git@github.com:hello-aaronprice/ansible.git . && cd ansible
$ ansible-playbook local.yml
```

### Installing

```console
$ cd ~
$ git clone git@github.com:hello-aaronprice/.dotfiles.git .
$ cd ~/.dotfiles
$ ./stow
```

This will create symlinks from this repo to your home folder.

