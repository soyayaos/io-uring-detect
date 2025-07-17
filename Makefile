.SILENT:

build:
	zvm use 0.14.0 > /dev/null && zig build-exe src/main.zig -O ReleaseSmall -fstrip -flto=thin -femit-bin=io-uring-detect
