#####						  #####
###								###
# makefile provided by instructor #
###								###
#####						  #####
#Program Name: hw03
#Name: Karen Nason
#WSUID: d373n567
#Homework #: 3
#Description: Makefile for homwork 3.

### Compiler variables
CXX = g++
CXXFLAGS = -Wall
EXE = hw03

### Source variables
SRCDIR = src
SRC = $(wildcard $(SRCDIR)/*.cpp)
OBJS = $(SRC:%.cpp=%.o)

### Release variables
RELDIR = rel
RELEXE = $(RELDIR)/$(EXE)
RELOBJS := $(subst src, rel, $(OBJS))

### Debug variables
DBGDIR = dbg
DBGEXE = $(DBGDIR)/$(EXE)
DBGOBJS := $(subst src, dbg, $(OBJS))
DBGFLAGS := $(CXXFLAGS) -g -O0

### Release rules
release : prep $(RELEXE)

$(RELEXE) : $(RELOBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(RELDIR)/%.o : $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

### Debug rules
debug : prep $(DBGEXE)

$(DBGEXE) : $(DBGOBJS)
	$(CXX) $(DBGFLAGS) $^ -o $@

$(DBGDIR)/%.o : $(SRCDIR)/%.cpp
	$(CXX) $(DBGFLAGS) -c -o $@ $<

### Extra rules
.PHONY : clean prep

clean :
	rm -f $(RELEXE) $(RELOBJS) $(DBGEXE) $(DBGOBJS)

prep :
	@mkdir -p dbg rel
