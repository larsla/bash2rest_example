# Bash2REST API mock example
Using bash2rest it's very simple to mock a REST API with bash scripts an jq.  
This is a very simple user data API.

## Create a user
```
$ curl http://127.0.0.1:5000/users/ -d '{"name": "test user"}'
{
  "created": "1439126181",
  "name": "test user",
  "id": "a5527b1efc3ab9f33c9684e13986fa59"
}
```

## Get user
```
$ curl http://127.0.0.1:5000/users/a5527b1efc3ab9f33c9684e13986fa59
{
  "created": "1439126181",
  "name": "test user",
  "id": "a5527b1efc3ab9f33c9684e13986fa59"
}
```

## Update user data
```
$ curl http://127.0.0.1:5000/users/a5527b1efc3ab9f33c9684e13986fa59 -XPUT -d '{"name": "new name of test user"}'
{
  "created": "1439126181",
  "updated": "1439126471",
  "name": "new name of test user",
  "id": "a5527b1efc3ab9f33c9684e13986fa59"
}
```

## Delete user
```
$ curl http://127.0.0.1:5000/users/a5527b1efc3ab9f33c9684e13986fa59 -XDELETE
{
  "result": "success"
}
```
