VERSION = 1_0

all: zip

zip:
	zip at_cacti_${VERSION}.zip snmp_queries/* templates/*

clean:
	rm -rf *.zip

version:
	echo VERSION=`git describe --dirty` > $@

.PHONY: all zip clean

