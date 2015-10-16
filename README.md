# redis-commander

A dockerized [redis-commander](https://github.com/joeferner/redis-commander) for viewing redis store in the browser

## How to run this container

	docker run -it --rm \
		--name redis-commander \
		--link NAME_OF_REDIS_CONTAINER:redis \
		osado/redis-commander

`--link` is the key here, where you link your redis container into the redis-commander container.

### Additional configuration Options

Environment variables can be passed to the `run` command for configuring your redis-commander instance

	Name         | Default   | Description
	-------------|-----------|------------
    REDIS_PASS   | ''        | redis password
    REDIS_DB     | 0         | redis db
	REDIS_PORT   | 6379      | redis port
	WEB_USER     | 'user'    | redis-commander web console username
	WEB_PASS     | 'pass'    | redis-commander web console password

#### Example

	docker run -it --rm \
		--name redis-commander \
		--link redis_1:redis \
		-e REDIS_DB=1 \
		osado/redis-commander
	

or using Docker Compose:

    redis:
      image: redis
    redis-commander:
      image: osado/redis-commander
      links:
       - "redis:redis"
      environment:
       - REDIS_DB=0
       - WEB_USER=admin
       - WEB_PASS=password

If you have [tianon/rawdns](https://github.com/tianon/rawdns) running, this container will be accessible at:

`http://redis-commander.docker:8081`
