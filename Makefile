# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:
.PHONY : .NOTPARALLEL

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/vim/Bureau/RESEAUX

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vim/Bureau/RESEAUX

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/vim/Bureau/RESEAUX/CMakeFiles /home/vim/Bureau/RESEAUX/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/vim/Bureau/RESEAUX/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named clientssl

# Build rule for target.
clientssl: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 clientssl
.PHONY : clientssl

# fast build rule for target.
clientssl/fast:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/build
.PHONY : clientssl/fast

#=============================================================================
# Target rules for targets named serveurssl

# Build rule for target.
serveurssl: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 serveurssl
.PHONY : serveurssl

# fast build rule for target.
serveurssl/fast:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/build
.PHONY : serveurssl/fast

SOURCES/account.o: SOURCES/account.c.o
.PHONY : SOURCES/account.o

# target to build an object file
SOURCES/account.c.o:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/account.c.o
.PHONY : SOURCES/account.c.o

SOURCES/account.i: SOURCES/account.c.i
.PHONY : SOURCES/account.i

# target to preprocess a source file
SOURCES/account.c.i:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/account.c.i
.PHONY : SOURCES/account.c.i

SOURCES/account.s: SOURCES/account.c.s
.PHONY : SOURCES/account.s

# target to generate assembly for a file
SOURCES/account.c.s:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/account.c.s
.PHONY : SOURCES/account.c.s

SOURCES/chaine.o: SOURCES/chaine.c.o
.PHONY : SOURCES/chaine.o

# target to build an object file
SOURCES/chaine.c.o:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/chaine.c.o
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/chaine.c.o
.PHONY : SOURCES/chaine.c.o

SOURCES/chaine.i: SOURCES/chaine.c.i
.PHONY : SOURCES/chaine.i

# target to preprocess a source file
SOURCES/chaine.c.i:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/chaine.c.i
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/chaine.c.i
.PHONY : SOURCES/chaine.c.i

SOURCES/chaine.s: SOURCES/chaine.c.s
.PHONY : SOURCES/chaine.s

# target to generate assembly for a file
SOURCES/chaine.c.s:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/chaine.c.s
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/chaine.c.s
.PHONY : SOURCES/chaine.c.s

SOURCES/clientssl.o: SOURCES/clientssl.c.o
.PHONY : SOURCES/clientssl.o

# target to build an object file
SOURCES/clientssl.c.o:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/clientssl.c.o
.PHONY : SOURCES/clientssl.c.o

SOURCES/clientssl.i: SOURCES/clientssl.c.i
.PHONY : SOURCES/clientssl.i

# target to preprocess a source file
SOURCES/clientssl.c.i:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/clientssl.c.i
.PHONY : SOURCES/clientssl.c.i

SOURCES/clientssl.s: SOURCES/clientssl.c.s
.PHONY : SOURCES/clientssl.s

# target to generate assembly for a file
SOURCES/clientssl.c.s:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/clientssl.c.s
.PHONY : SOURCES/clientssl.c.s

SOURCES/cryptage.o: SOURCES/cryptage.c.o
.PHONY : SOURCES/cryptage.o

# target to build an object file
SOURCES/cryptage.c.o:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/cryptage.c.o
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/cryptage.c.o
.PHONY : SOURCES/cryptage.c.o

SOURCES/cryptage.i: SOURCES/cryptage.c.i
.PHONY : SOURCES/cryptage.i

# target to preprocess a source file
SOURCES/cryptage.c.i:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/cryptage.c.i
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/cryptage.c.i
.PHONY : SOURCES/cryptage.c.i

SOURCES/cryptage.s: SOURCES/cryptage.c.s
.PHONY : SOURCES/cryptage.s

# target to generate assembly for a file
SOURCES/cryptage.c.s:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/cryptage.c.s
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/cryptage.c.s
.PHONY : SOURCES/cryptage.c.s

SOURCES/fonction_client_on_serveur.o: SOURCES/fonction_client_on_serveur.c.o
.PHONY : SOURCES/fonction_client_on_serveur.o

# target to build an object file
SOURCES/fonction_client_on_serveur.c.o:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/fonction_client_on_serveur.c.o
.PHONY : SOURCES/fonction_client_on_serveur.c.o

SOURCES/fonction_client_on_serveur.i: SOURCES/fonction_client_on_serveur.c.i
.PHONY : SOURCES/fonction_client_on_serveur.i

# target to preprocess a source file
SOURCES/fonction_client_on_serveur.c.i:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/fonction_client_on_serveur.c.i
.PHONY : SOURCES/fonction_client_on_serveur.c.i

SOURCES/fonction_client_on_serveur.s: SOURCES/fonction_client_on_serveur.c.s
.PHONY : SOURCES/fonction_client_on_serveur.s

# target to generate assembly for a file
SOURCES/fonction_client_on_serveur.c.s:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/fonction_client_on_serveur.c.s
.PHONY : SOURCES/fonction_client_on_serveur.c.s

SOURCES/fonction_serveur.o: SOURCES/fonction_serveur.c.o
.PHONY : SOURCES/fonction_serveur.o

# target to build an object file
SOURCES/fonction_serveur.c.o:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/fonction_serveur.c.o
.PHONY : SOURCES/fonction_serveur.c.o

SOURCES/fonction_serveur.i: SOURCES/fonction_serveur.c.i
.PHONY : SOURCES/fonction_serveur.i

# target to preprocess a source file
SOURCES/fonction_serveur.c.i:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/fonction_serveur.c.i
.PHONY : SOURCES/fonction_serveur.c.i

SOURCES/fonction_serveur.s: SOURCES/fonction_serveur.c.s
.PHONY : SOURCES/fonction_serveur.s

# target to generate assembly for a file
SOURCES/fonction_serveur.c.s:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/fonction_serveur.c.s
.PHONY : SOURCES/fonction_serveur.c.s

SOURCES/serveurssl.o: SOURCES/serveurssl.c.o
.PHONY : SOURCES/serveurssl.o

# target to build an object file
SOURCES/serveurssl.c.o:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/serveurssl.c.o
.PHONY : SOURCES/serveurssl.c.o

SOURCES/serveurssl.i: SOURCES/serveurssl.c.i
.PHONY : SOURCES/serveurssl.i

# target to preprocess a source file
SOURCES/serveurssl.c.i:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/serveurssl.c.i
.PHONY : SOURCES/serveurssl.c.i

SOURCES/serveurssl.s: SOURCES/serveurssl.c.s
.PHONY : SOURCES/serveurssl.s

# target to generate assembly for a file
SOURCES/serveurssl.c.s:
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/serveurssl.c.s
.PHONY : SOURCES/serveurssl.c.s

SOURCES/strdup.o: SOURCES/strdup.c.o
.PHONY : SOURCES/strdup.o

# target to build an object file
SOURCES/strdup.c.o:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/strdup.c.o
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/strdup.c.o
.PHONY : SOURCES/strdup.c.o

SOURCES/strdup.i: SOURCES/strdup.c.i
.PHONY : SOURCES/strdup.i

# target to preprocess a source file
SOURCES/strdup.c.i:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/strdup.c.i
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/strdup.c.i
.PHONY : SOURCES/strdup.c.i

SOURCES/strdup.s: SOURCES/strdup.c.s
.PHONY : SOURCES/strdup.s

# target to generate assembly for a file
SOURCES/strdup.c.s:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/strdup.c.s
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/strdup.c.s
.PHONY : SOURCES/strdup.c.s

SOURCES/strsplit.o: SOURCES/strsplit.c.o
.PHONY : SOURCES/strsplit.o

# target to build an object file
SOURCES/strsplit.c.o:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/strsplit.c.o
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/strsplit.c.o
.PHONY : SOURCES/strsplit.c.o

SOURCES/strsplit.i: SOURCES/strsplit.c.i
.PHONY : SOURCES/strsplit.i

# target to preprocess a source file
SOURCES/strsplit.c.i:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/strsplit.c.i
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/strsplit.c.i
.PHONY : SOURCES/strsplit.c.i

SOURCES/strsplit.s: SOURCES/strsplit.c.s
.PHONY : SOURCES/strsplit.s

# target to generate assembly for a file
SOURCES/strsplit.c.s:
	$(MAKE) -f CMakeFiles/clientssl.dir/build.make CMakeFiles/clientssl.dir/SOURCES/strsplit.c.s
	$(MAKE) -f CMakeFiles/serveurssl.dir/build.make CMakeFiles/serveurssl.dir/SOURCES/strsplit.c.s
.PHONY : SOURCES/strsplit.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... clientssl"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... serveurssl"
	@echo "... SOURCES/account.o"
	@echo "... SOURCES/account.i"
	@echo "... SOURCES/account.s"
	@echo "... SOURCES/chaine.o"
	@echo "... SOURCES/chaine.i"
	@echo "... SOURCES/chaine.s"
	@echo "... SOURCES/clientssl.o"
	@echo "... SOURCES/clientssl.i"
	@echo "... SOURCES/clientssl.s"
	@echo "... SOURCES/cryptage.o"
	@echo "... SOURCES/cryptage.i"
	@echo "... SOURCES/cryptage.s"
	@echo "... SOURCES/fonction_client_on_serveur.o"
	@echo "... SOURCES/fonction_client_on_serveur.i"
	@echo "... SOURCES/fonction_client_on_serveur.s"
	@echo "... SOURCES/fonction_serveur.o"
	@echo "... SOURCES/fonction_serveur.i"
	@echo "... SOURCES/fonction_serveur.s"
	@echo "... SOURCES/serveurssl.o"
	@echo "... SOURCES/serveurssl.i"
	@echo "... SOURCES/serveurssl.s"
	@echo "... SOURCES/strdup.o"
	@echo "... SOURCES/strdup.i"
	@echo "... SOURCES/strdup.s"
	@echo "... SOURCES/strsplit.o"
	@echo "... SOURCES/strsplit.i"
	@echo "... SOURCES/strsplit.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

