" Vim syntax file
" Language: C++ Additions
" Maintainer: Jon Haggblad <jon@haeggblad.com>
" URL: http://www.haeggblad.com
" Last Change: 12 Oct 2016
" Version: 0.6
" Changelog:
"   0.1 - initial version.
"   0.2 - C++14
"   0.3 - Incorporate lastest changes from Mizuchi/STL-Syntax
"   0.4 - Add template function highlight
"   0.5 - Redo template function highlight to be more robust. Add options.
"   0.6 - more C++14, C++17, library concepts
"
" Additional Vim syntax highlighting for C++ (including C++11/14/17)
"
" This file contains additional syntax highlighting that I use for C++11/14
" development in Vim. Compared to the standard syntax highlighting for C++ it
" adds highlighting of (user defined) functions and the containers and types
" in the standard library / boost.
"
" Based on:
"   http://stackoverflow.com/q/736701
"   http://www.vim.org/scripts/script.php?script_id=4293
"   http://www.vim.org/scripts/script.php?script_id=2224
"   http://www.vim.org/scripts/script.php?script_id=1640
"   http://www.vim.org/scripts/script.php?script_id=3064


" -----------------------------------------------------------------------------
"  Highlight Class and Function names.
"
" Based on the discussion in: http://stackoverflow.com/q/736701
" -----------------------------------------------------------------------------

" Functions
syn match   cCustomParen    "(" contains=cParen contains=cCppParen
syn match   cCustomFunc     "\w\+\s*(\@="
hi def link cCustomFunc  Function

syn match   cCustomScope    "::"
syn match   cCustomClass    "\w\+\s*::" contains=cCustomScope
hi def link cCustomClass Function

syn match    cCustomType    /\<[A-Z]\w\+\>/
hi def link cCustomType Type

syntax keyword cppType float32 uint32 double64 int32 int64 int16 uint16 vector map set unordered_map std boost string  string_cref char_cptr string_vector string_matrix int_vector bool_vector map_int int_map string_map int_map_int float_vector float_matrix int_matrix  float_cube int_cube int_matrix
hi def link cppType Type

syntax keyword cppFunction get_data get_attr getdata lexical_cast
hi def link cppFunction Function

syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
hi def link cCustomClass Type  


" -----------------------------------------------------------------------------
"  Standard library types and functions.
"
" Mainly based on the excellent STL Syntax vim script by
" Mizuchi <ytj000@gmail.com>
"   http://www.vim.org/scripts/script.php?script_id=4293
" which in turn is based on the scripts
"   http://www.vim.org/scripts/script.php?script_id=2224
"   http://www.vim.org/scripts/script.php?script_id=1640
" -----------------------------------------------------------------------------


" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppSTLbool         Boolean
  HiLink cppStorageClass    StorageClass
  HiLink cppStatement       Statement
  HiLink cppSTLfunction     Function
  HiLink cppSTLfunctional   Typedef
  HiLink cppSTLconstant     Constant
  HiLink cppSTLnamespace    Constant
  HiLink cppSTLtype         Typedef
  HiLink cppSTLexception    Exception
  HiLink cppSTLiterator     Typedef
  HiLink cppSTLiterator_tag Typedef
  HiLink cppSTLenum         Typedef
  HiLink cppSTLios          Function
  HiLink cppSTLcast         Statement " be consistent with official syntax
  HiLink cppRawString       String
  HiLink cppRawDelimiter    Delimiter
  delcommand HiLink
endif
