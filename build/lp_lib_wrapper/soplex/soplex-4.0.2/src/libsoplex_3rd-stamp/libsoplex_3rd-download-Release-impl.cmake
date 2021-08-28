set(command "/usr/bin/cmake;-P;/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/verify-libsoplex_3rd.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()
set(command "/usr/bin/cmake;-P;/home/alen/ibex-lib/build/lp_lib_wrapper/soplex/soplex-4.0.2/src/libsoplex_3rd-stamp/extract-libsoplex_3rd.cmake")

execute_process(COMMAND ${command} RESULT_VARIABLE result)
if(result)
  set(msg "Command failed (${result}):\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  message(FATAL_ERROR "${msg}")
endif()