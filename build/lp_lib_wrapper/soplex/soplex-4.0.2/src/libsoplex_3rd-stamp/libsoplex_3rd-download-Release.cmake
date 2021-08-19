

set(command "/usr/bin/cmake;-Dmake=${make};-Dconfig=${config};-P;/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-download-Release-impl.cmake")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-download-out.log"
  ERROR_FILE "/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-download-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-download-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "libsoplex_3rd download command succeeded.  See also /home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/libsoplex_3rd-download-*.log")
  message(STATUS "${msg}")
endif()
