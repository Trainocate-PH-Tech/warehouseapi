# Warehouse API

A dummy Rails API backend for ReactJS tutorial.

## How this was created

1. Instantiation of a new project that is API only without testing framework

```bash
rails new warehouse --api -T
```

2. Create the database (uses sqlite by default)

```bash
rails db:Create
```

3. Create the `Item` model

```bash
rails new model Item name:string quantity:integer category:string
```

Migrate the changes

```bash
rails db:migrate
```
