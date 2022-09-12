#CC = /opt/zig-linux-x86_64-dev/zig c++
CC = g++

CFLAGS = -Wall -Wextra  -pedantic -O2 -Wunused-result -std=gnu++20
CFLAGS_ASM = -Wall -Wextra -fverbose-asm -save-temps -pedantic -O2 -std=gnu++20

BINS =  exe test Libstr.so file_handle.so  asm

all: $(BINS)

LibStr.o: LibStr.cpp  LibStr.hpp 
	${CC} ${CFLAGS} -c LibStr.cpp 

Libstr.so: LibStr.cpp  LibStr.hpp
	#$(CC) $(CFLAGS)  -shared -o $@ LibStr.cpp  -lc
	$(CC) $(CFLAGS) -fPIC -shared -o $@ LibStr.cpp  -lc


file_handle.o: file_handle.cpp file_handle.hpp 
	${CC} ${CFLAGS} -c file_handle.cpp

file_handle.so: file_handle.cpp file_handle.hpp
	#$(CC) $(CFLAGS)  -shared -o $@ file_handle.cpp -lc
	$(CC) $(CFLAGS) -fPIC -shared -o $@ file_handle.cpp -lc

exe: Test.cpp file_handle.o LibStr.o 
	$(CC) $(CFLAGS) -o $@ $^

test: ./vlunerabilities/test.cpp file_handle.o LibStr.o 
	$(CC) $(CFLAGS) -o $@ $^
	mv $@ ./vlunerabilities/
	
asm: Test.cpp 
	$(CC) $(CFLAGS_ASM) -S $^ -o ./gen_assembly/$@-AT.s
	$(CC) $(CFLAGS_ASM) -S -masm=intel  $^ -o ./gen_assembly/$@-intel.asm



clean:
	rm *.o exe *.so
	rm ./gen_assembly/*
	rm ./vlunerabilities/test
