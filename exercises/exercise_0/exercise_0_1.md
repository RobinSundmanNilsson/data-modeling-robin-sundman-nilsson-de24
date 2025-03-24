## 1. Convert json-file to tables

### You have this json data, convert it into three tables: Hospital, Department and Doctor. Fill these tables with data. Do this manually and not programmatically.

```json
{
  "hospital": "Sjukhusstock",
  "address": "Drottninggatan 3, Stockholm",
  "departments": [
    {
      "name": "Kardiologi",
      "doctors": [
        { "id": 1, "name": "Dr. Abra Abrahamson" },
        { "id": 2, "name": "Dr. Erika Eriksson" }
      ]
    },
    {
      "name": "Neurologi",
      "doctors": [{ "id": 3, "name": "Dr. Sven Svensson" }]
    }
  ]
}
```

### Hospital Table:

| hospital_id | name         | adress                      |
|-------------|--------------|----------------------------:|
| 1           | Sjukhusstock | Drottninggatan 3, Stockholm |

### Department Table:

| department_id | name       | hospital_id |
|---------------|------------|------------:|
| 1             | Kardiologi | 1           |
| 2             | Neurologi  | 1           |

### Doctor Table:

| doctor_id | name                | department_id |
|-----------|---------------------|--------------:|
| 1         | Dr. Abra Abrahamson | 1             |
| 2         | Dr. Erika Eriksson  | 1             |
| 3         | Dr. Sven Svensson   | 2             |