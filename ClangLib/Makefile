CC = /opt/zig-linux-x86_64-dev/zig cc

CFLAGS = -Wall -Wextra  -pedantic -O2 -Wunused-result -std=gnu2x
CFLAGS_ASM = -Wall -Wextra -fverbose-asm -save-temps -pedantic -O2 -std=gnu2x

BINS =  exe test libstr.so file_handle.so  asm

all: $(BINS)

LibStr.o: LibStr.c  LibStr.h 
	${CC} ${CFLAGS} -c LibStr.c 

libstr.so: LibStr.c  LibStr.h
	#$(CC) $(CFLAGS)  -shared -o $@ LibStr.c  -lc
	$(CC) $(CFLAGS) -fPIC -shared -o $@ LibStr.c  -lc


file_handle.o: file_handle.c file_handle.h 
	${CC} ${CFLAGS} -c file_handle.c

file_handle.so: file_handle.c file_handle.h
	#$(CC) $(CFLAGS)  -shared -o $@ file_handle.c -lc
	$(CC) $(CFLAGS) -fPIC -shared -o $@ file_handle.c -lc

exe: Test.c file_handle.o LibStr.o 
	$(CC) $(CFLAGS) -o $@ $^

test: ./vlunerabilities/test.c file_handle.o LibStr.o 
	$(CC) $(CFLAGS) -o $@ $^
	mv $@ ./vlunerabilities/
	
asm: Test.c 
	$(CC) $(CFLAGS_ASM) -S $^ -o ./gen_assembly/$@-AT.s
	$(CC) $(CFLAGS_ASM) -S -masm=intel  $^ -o ./gen_assembly/$@-intel.asm



clean:
	rm *.o exe *.so
	rm ./gen_assembly/*
	rm ./vlunerabilities/test
