# Compiler/Debugger options
CC=gcc
DEBUGGER=gdb
CFLAGS=-Wall

# Source and executable names
FILE=cache1
UTIL=util
EXE=$(FILE).out

# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the first as argument for gunzip, making sure to set a default of 'art'
  ifeq (,$(word 2, $(MAKECMDGOALS)))
  	TRACE := art
  else
	TRACE := $(word 2, $(MAKECMDGOALS))
  endif
  # use the rest as arguments for cachesim
  CACHE_ARGS := $(wordlist 3,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

build:
	$(CC) $(CFLAGS) $(FILE).c $(UTIL).c -o $(EXE)

run: build
	gunzip -c traces/$(TRACE).trace.gz | ./$(EXE) $(CACHE_ARGS)

test1: build
	gunzip -c art.trace.gz | java cache -a 1 -s 16 -l 16 -mp 30

debug: build
	$(DEBUGGER) $(EXE)

clean:
	rm -rf $(EXE)