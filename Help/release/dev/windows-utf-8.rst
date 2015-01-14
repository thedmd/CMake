windows-utf-8
-------------------------

* The Windows version of CMake has been enhanced to use Unicode.  This
  allows using characters from multiple languages in CMake.  Because CMake
  interoperates with many other tools, there may still be some limitations
  when using certain Unicode characters.

  The Visual Studio generators have been enhanced to write solution and
  project files in UTF-8 instead of Windows-1252.  Windows-1252 supported
  Latin 1 languages such as those found in North and South America and Western
  Europe.  With UTF-8, additional languages are supported.

  The CMakeLists.txt file and other files read by CMake file are expected
  to be UTF-8 encoded.  If files are already ASCII, they will be compatible.
  If files were in a different encoding, including Latin 1, they will need to
  be converted.
