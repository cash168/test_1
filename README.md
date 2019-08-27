
1)  **Установка зависимостей:**
```
ansible-galaxy install -f -r requirements.yml
```

2)  **Vagrant up:**
```
up.sh
```

3) **Configuring vrrp:**
```
ansible-playbook playbooks/vrrp-configure.yml -i inventory/stage/ -l lb --list-hosts
ansible-playbook playbooks/vrrp-configure.yml -i inventory/stage/ -l lb
```
