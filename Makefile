build : hello.c uninstall.sh build/
	make build/hello build/hello-uninstall
build/ : 
	mkdir build
build/hello : hello.c build/
	gcc hello.c -o build/hello
build/hello-uninstall : uninstall.sh build/
	cp uninstall.sh build/hello-uninstall
	chmod +x build/hello-uninstall
install : build/hello build/hello-uninstall build/
	cp build/hello build/hello-uninstall /usr/bin
clean : build/
	rm -rf build/
