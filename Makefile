CC = g++
CXXFLAGS = -g -Wall -Wextra -pedantic -o3
WX_CONF = wx-config
WX_CXXFLAGS = `$(WX_CONF) --cxxflags`
WX_LIBS = `$(WX_CONF) --libs`

SOURCE = $(wildcard src/*.cpp)	# source files.
OBJECT = $(patsubst src/%.cpp, bin/%.o, $(SOURCE))	# object files.

all : app

app : $(OBJECT)
	$(CC) -o $@ $^ $(WX_LIBS)

bin/%.o: src/%.cpp
	@mkdir -p bin
	$(CC) -c $< -o $@  $(WX_CXXFLAGS)

clean:
	rm -rf bin/*.o app