" Vim syntax file
" Language: Kotlin
" Maintainer: Alexander Udalov
" Latest Revision: 1 July 2020

if exists('b:current_syntax')
    finish
endif

syn keyword ktStatement break continue return
syn keyword ktConditional if else when
syn keyword ktRepeat do for while
syn keyword ktOperator in is by
syn keyword ktKeyword get set out super this where
syn keyword ktException try catch finally throw

syn keyword ktInclude import package

syn keyword ktType Any Boolean Byte Char Double Float Int Long Nothing Short Unit
syn keyword ktModifier annotation companion enum inner internal private protected public abstract final open override sealed vararg dynamic expect actual
syn keyword ktStructure class object interface typealias fun val var constructor init

syn keyword ktStructure fun nextgroup=ktItemName skipwhite skipempty
syn keyword ktKeyword class object interface typealias nextgroup=ktClassName skipwhite skipempty

syn keyword ktReservedKeyword typeof

syn keyword ktBoolean true false
syn keyword ktConstant null

syn keyword ktModifier data tailrec lateinit reified external inline noinline crossinline const operator infix suspend

syn match ktOperator "\v\?:|::|\<\=? | \>\=?|[!=]\=\=?|<as>\??|[-!%&*+/|]"

syn keyword ktTodo TODO FIXME XXX contained
syn match ktShebang "\v^#!.*$"
syn match ktLineComment "\v//.*$" contains=ktTodo,@Spell
syn region ktComment matchgroup=ktCommentMatchGroup start="/\*" end="\*/" contains=ktComment,ktTodo,@Spell

syn region ktDocComment start="/\*\*" end="\*/" contains=ktDocTag,ktTodo,@Spell
syn match ktDocTag "\v\@(author|constructor|receiver|return|since|suppress)>" contained
syn match ktDocTag "\v\@(exception|param|property|throws|see|sample)>\s*\S+" contains=ktDocTagParam contained
syn match ktDocTagParam "\v(\s|\[)\S+" contained
syn match ktComment "/\*\*/"
syn match ktItemName "\v([a-zA-Z_][a-zA-Z0-9_]*|`[^`]+`)" contained
syn match ktClassName "\v[A-Z][a-zA-Z0-9_]*" contained

syn match ktFunctionCall "\v([[:alpha:]_][[:alnum:]_]*|`[^`]+`)(\(|\<)"he=e-1,me=e-1
syn match ktFunctionCall "\v([a-z_][[:alnum:]_]*|`[^`]+`) \{"he=e-2,me=e-2
syn match ktConstructorCall "\v[A-Z][[:alnum:]_]*(\(|\<)"he=e-1,me=e-1

syn match ktTypeParameter "\v\<\w+(, \w+)*\>"hs=s+1,he=e-1,ms=s+1,me=e-1
syn match ktTypeParameter "\v\<\w+((, )?\w+)*\<"hs=s+1,he=e-1,ms=s+1,me=e-1

" arguments, fields, locals, return types
syn match ktType "\v\:\s?\w+\s?[\<\>\)\,\=\s\{]"hs=s+1,ms=s+1,he=e-1,me=e-1

syn match ktSpecialCharError "\v\\." contained
syn match ktSpecialChar "\v\\([tbnr'"$\\]|u\x{4})" contained
syn region ktString start='"' skip='\\"' end='"' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError
syn region ktString start='"""' end='""""*' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'[^']*'" contains=ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'\\''" contains=ktSpecialChar
syn match ktCharacter "\v'[^\\]'"

" TODO: highlight label in 'this@Foo'
syn match ktAnnotation "\v(\w)@<!\@[[:alnum:]_.]*(:[[:alnum:]_.]*)?"
syn match ktLabel "\v\w+\@"

syn match ktSimpleInterpolation "\v\$\h\w*" contained
syn region ktComplexInterpolation matchgroup=ktComplexInterpolationBrace start="\v\$\{" end="\v\}" contains=ALLBUT,ktSimpleInterpolation,ktTodo,ktSpecialCharError,ktSpecialChar,ktDocTag,ktDocTagParam

syn match ktNumber "\v<\d+[_[:digit:]]*(uL?|UL?|[LFf])?"
syn match ktNumber "\v<0[Xx]\x+[_[:xdigit:]]*(uL?|UL?|L)?"
syn match ktNumber "\v<0[Bb][01]+[_01]*(uL?|UL?|L)?"
syn match ktFloat "\v<\d*(\d[eE][-+]?\d+|\.\d+([eE][-+]?\d+)?)[Ff]?"

syn match ktEscapedName "\v`.*`"

syn match ktExclExcl "!!"
syn match ktArrow "->"

hi def link ktStatement Statement
hi def link ktConditional Conditional
hi def link ktRepeat Repeat
hi def link ktOperator Operator
hi def link ktKeyword Keyword
hi def link ktException Exception
hi def link ktReservedKeyword Error

hi def link ktInclude Include

hi def link ktType Type
hi def link ktTypeParameter Type
hi def link ktClassName Type
hi def link ktModifier StorageClass
hi def link ktStructure Structure
hi def link ktTypedef Typedef
hi def link ktItemName Function
hi def link ktFunctionCall Function
hi def link ktConstructorCall Type

hi def link ktBoolean Boolean
hi def link ktConstant Constant

hi def link ktTodo Todo
hi def link ktShebang Comment
hi def link ktLineComment Comment
hi def link ktComment Comment
hi def link ktCommentMatchGroup Comment
hi def link ktDocComment Comment
hi def link ktDocTag Special
hi def link ktDocTagParam Identifier

hi def link ktSpecialChar SpecialChar
hi def link ktSpecialCharError Error
hi def link ktString String
hi def link ktCharacter Character

hi def link ktAnnotation Identifier
hi def link ktLabel Identifier

hi def link ktSimpleInterpolation Identifier
hi def link ktComplexInterpolationBrace Identifier

hi def link ktNumber Number
hi def link ktFloat Float

hi def link ktExclExcl Special
hi def link ktArrow Structure

let b:current_syntax = 'kotlin'
