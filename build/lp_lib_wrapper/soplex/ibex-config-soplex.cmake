add_library (Ibex::soplex STATIC IMPORTED GLOBAL)
set_target_properties (Ibex::soplex PROPERTIES IMPORTED_LOCATION /usr/local/lib/ibex/3rd/libsoplex.a)
set_target_properties (Ibex::soplex PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "/usr/local/include/ibex/3rd")
