# build
go mod tidy
rm -f ./html/*.js ./html/*.wasm ./html/*.gz
cp $(go env GOROOT)/misc/wasm/wasm_exec.js ./html/wasm_exec.js
GOOS=js GOARCH=wasm go build -o ./html/main.wasm ./app

# compress to gzip
cd html
gzip -9 -v -c main.wasm > main.wasm.gz
rm main.wasm
cd ..

# run
go run ./server