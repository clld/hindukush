# Releasing the hindukush web app

```shell
git clone https://github.com/clld/hindukush
cd hindukush
pip install -e .[test]
```

Recreate the app db:
```shell
clld initdb development.ini --cldf ../../hindukush/liljegrenhindukush/cldf/cldf-metadata.json --glottolog ../../glottolog/glottolog
```

```shell
pytest
```

Store the tested requirements:
```shell
pip freeze > requirements.txt
```

Store a db dump:
```shell
pg_dump -xO hindukush > hindukush.sql
zip hindukush.sql.zip hindukush.sql
rm hindukush.sql
```

