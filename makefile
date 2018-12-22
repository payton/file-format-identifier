CC = gcc
WARNING_FLAGS = -Wall -Wextra
EXE = fformat
SCAN_BUILD_DIR = scan-build-out

all: main.o
	$(CC) -o $(EXE) main.o

main.o: main.c
	$(CC) $(WARNING_FLAGS) -c main.c

clean:
	rm -f $(EXE) *.o
	rm -rf $(SCAN_BUILD_DIR)

#
# Run the Clang Static Analyzer
#
scan-build: clean
	scan-build -o $(SCAN_BUILD_DIR) make

#
# View the one scan available using firefox
#
scan-view: scan-build
	firefox -new-window $(SCAN_BUILD_DIR)/*/index.html 
