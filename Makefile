all: tarball hash clean

tarball: install.py ramsay.py
	tar -cvf ${VERSION}.tar.xz $?
	$(info Tarball)

hash: ${VERSION}.tar.xz
	cat ${VERSION}.tar.xz | md5 > ${VERSION}.tar.xz.md5b
	head -c 32 ${VERSION}.tar.xz.md5b > ${VERSION}.tar.xz.md5
	$(info Hash)

install: ${VERSION}.tar.xz ${VERSION}.tar.xz.md5
	cp ${VERSION}.tar.xz /data/web/nebps/ramsay
	cp ${VERSION}.tar.xz.md5 /data/web/nebps/ramsay

clean:
	$(info Cleaning)
	rm ${VERSION}.tar.xz.md5b
