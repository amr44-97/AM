CC = c++

CFLAGS = -Wall -Wextra -O2 -std=gnu++20

LIBS = -lSDL2 -lSDL2_image -lSDL2_ttf -lm

SRC =  new.cpp 

LINK = render_text.cpp la.cpp

BIN = Draw


Draw: $(SRC)
	$(CC) $(CFLAGS)  $(SRC) $(LINK) -o $(BIN) $(LIBS)

clean:
	rm $(BIN)
