file(REMOVE_RECURSE
  "libGKLS.pdb"
  "libGKLS.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/GKLS.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
