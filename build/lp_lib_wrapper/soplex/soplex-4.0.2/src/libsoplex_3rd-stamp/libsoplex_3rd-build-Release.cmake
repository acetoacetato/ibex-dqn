

set(command "${make};USRCXXFLAGS=;GMP=false;ZLIB=false;INSTALLDIR=/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2;install")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-build-out.log"
  ERROR_FILE "/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-build-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-build-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "libsoplex_3rd build command succeeded.  See also /home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-build-*.log")
  message(STATUS "${msg}")
endif()
