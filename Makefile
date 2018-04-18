build:
	docker-compose run build_wasm go build -o server/test.wasm src/main.go

run:
	open http://localhost:1337 && http-server ./server -p 1337
