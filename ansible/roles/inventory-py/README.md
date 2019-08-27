# inventory-py

Необходимо использовать симлинк в инвентори до файла inventory.py.

Например:

```
ln -sf ../../roles/inventory-py/files/inventory.py inventory.py
```

Добавляем в requirements.yml

```
- src: git@gitlab.fbs-d.com:ansible/inventory-py.git
  scm: git
  version: master
  name: inventory-py
```

Установка:

```
ansible-galaxy install -f -r ./requirements.yml -vv
```

## Пример структуры inventory

```
roles
└── inventory-py
    └── files
        └── inventory.py
inventory
└── stage
    ├── group_vars
    │   ├── all.yml
    │   ├── journalbeat-test-01.yml
    │   ├── journalbeat-test-02.yml
    │   ├── journalbeat.yml
    │   ├── redis-test-01.yml
    │   └── redis-test-02.yml
    ├── host_vars
    │   ├── db-01.test-01.cabinet.office.int.fbs.dev.yml
    │   └── db-01.test-02.cabinet.office.int.fbs.dev.yml
    ├── inventory.py -> ../../roles/inventory-py/files/inventory.py
    ├── inventory-test-01.yml
    └── inventory-test-02.yml

```

## stage

Хосты описываются в YAML inventory файлах *.yml, например:

- stage/inventory-test-01.yml

```
#### YAML inventory file

# the two first lines above are needed for the script
# to identify the file as an inventory file

## Structure
# hosts:
#   - host: <HOSTNAME>
#     # if needed
#     hostvars:
#      key: value
#     # if needed
#     limits:
#       - limit1
#       - limit2
```

### group_vars

Переменные для всей среды, например:

- stage/group_vars/all.yml

Переменные тэгов хостов, например:

- journalbeat.yml и journalbeat-test-01.yml

---

## Примеры использования

**Проверка общего inventory и использования переменных:**
```
ansible-inventory --list -i inventory/stage/inventory.py
```
---
**Показать все journalbeat хосты всех стендов:**
```
ansible-playbook playbooks/main.yml -i inventory/stage/inventory.py -l journalbeat --list-hosts
```
