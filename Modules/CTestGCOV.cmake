#.rst:
# CTestGCOV
# -----------------------------
#
# CTestGCOV.cmake
#
# This module provides the function run_gcov_and_package_for_cdash. The
# function will run gcov on the .gcda files in a binary tree and then
# package all of the .gcov files into a tar file with a data.json. This
# file can be sent to a CDash server for display with ctest_submit
# CDASH_UPLOAD.
#
# ::
#
#  run_gcov_and_package_for_cdash(<tarfile> <source_dir> <binary_dir>
#                                 <gcov_command>)
#
#  Run gcov and package a tar gz file for cdash. tarfile is the name
#  of the tarfile that is created and it will be placed in binary_dir.
#  source_dir is the source directory for the build and binary_dir is
#  the binary directory for the build. The gcov_command is a full path
#  to gcov for the machine.

#=============================================================================
# Copyright 2008-2009 Kitware, Inc.
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

function(run_gcov_and_package_for_cdash tarfile source_dir binary_dir
    gcov_command)
  # run gcov on each gcda file in the binary tree
  file(GLOB_RECURSE GCDA_FILES RELATIVE  ${binary_dir} "*.gcda")

  # return early if no coverage files were found
  list(LENGTH GCDA_FILES len)
  if(len EQUAL 0)
    message("CTestGCOV: No .gcda files found, ignoring coverage request.")
    return()
  endif()

  foreach (gcda_file ${GCDA_FILES})
    # get the directory of the gcda file
    get_filename_component(gcov_dir ${gcda_file} DIRECTORY)
    # run gcov
    execute_process(COMMAND
      ${gcov_command} -b -o ${gcov_dir} ${gcda_file}
      OUTPUT_VARIABLE out
      WORKING_DIRECTORY ${binary_dir})
  endforeach()
  # create json file with project information
  file(WRITE ${binary_dir}/data.json
    "{
    \"Source\": \"${source_dir}\",
    \"Binary\": \"${binary_dir}\"
}"
    )
  # collect the gcov files
  file(GLOB_RECURSE gcov_files RELATIVE ${binary_dir} "*.gcov")
  # tar up the coverage info
  execute_process(COMMAND
    ${CMAKE_COMMAND} -E tar cvf ${tarfile}
    --mtime=1970-01-01\ 0:0:0\ UTC ${gcov_files} data.json
    WORKING_DIRECTORY ${binary_dir})
endfunction()
