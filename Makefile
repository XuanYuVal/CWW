# Makefile for the Lid-Driven Cavity Problem Solver

# Compiler and compiler flags
CXX = g++
CXXFLAGS = -Wall -O3
LDFLAGS = 

# Libraries
LIBS = -lmpi -lboost_system -lcblas

# Source files and object files
SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)

# Executable name
EXEC = solver

# Default target
all: $(EXEC)

$(EXEC): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS) $(LIBS)

# To obtain object files
%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@

# To remove generated files
clean:
	rm -f $(OBJS) $(EXEC)
	
# Add doc
doc:
	doxygen Doxyfile

# Dependecies
SolverCG.o: SolverCG.h
LidDrivenCavity.o: LidDrivenCavity.h SolverCG.h
LidDrivenCavitySolver.o: LidDrivenCavity.h
