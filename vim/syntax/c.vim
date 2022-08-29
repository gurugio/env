" gvim Source code highlighting for Altibase
" Shawn <shawn@altibase.com>

" cShawnNote and cTodo will be highlighted even inside comment

" ================
" Common
" ================

syn cluster cCommentGroup contains=cShawnNote,cTodo

syn keyword cTodo         contained BUGBUG
syn keyword cShawnNote    contained Note note NOTE

syn keyword cOperator     sizeof offsetof


" ================
" for Altibase
" ================

syn keyword cType       UInt   SInt  UShort SShort ULong  SLong   vULong vSLong
syn keyword cType       IDE_RC UChar SChar  idBool SFloat SDouble SQLRETURN

syn keyword cShawnNote  ULN_INIT_FUNCTION_CONTEXT
syn keyword cAssertion  IDE_TEST      IDE_TEST_RAISE     IDE_RAISE
syn keyword cAssertion  IDE_ASSERT    IDE_DASSERT
syn keyword cException  IDE_EXCEPTION IDE_EXCEPTION_END

syn keyword cIdeReturn  IDE_SUCCESS IDE_FAILURE NULL ID_FALSE ID_TRUE

syn keyword cStatement  ID_SIZEOF
syn keyword cIDULIST    IDU_LIST_ITERATE  IDU_LIST_ITERATE_SAFE
syn keyword cIDULIST    IDU_LIST_ADD_LAST IDU_LIST_ADD_FIRST  IDU_LIST_REMOVE
syn keyword cIDULIST    IDU_LIST_INIT       IDU_LIST_INIT_OBJ
syn keyword cIDULIST    IDU_LIST_SPLIT_LIST IDU_LIST_JOIN_LIST
syn keyword cIDULIST    IDU_LIST_JOIN_NODE
syn keyword cUlnFlag    ULN_FLAG
syn keyword cUlnFlag    ULN_FLAG_UP   ULN_FLAG_DOWN  ULN_IS_FLAG_UP

" ====================
" for ACP & ACE & ACL
" ====================

syn keyword cType       acp_rc_t      acp_char_t   ACP_EXPORT     ACP_INLINE
syn keyword cType       acp_sint8_t   acp_sint16_t acp_sint32_t   acp_sint64_t
syn keyword cType       acp_uint8_t   acp_uint16_t acp_uint32_t   acp_uint64_t
syn keyword cType       acp_float_t   acp_double_t acp_slong_t    acp_ulong_t
syn keyword cType       acp_str_t     acp_bool_t   acp_offset_t   acp_size_t acp_ssize_t
syn keyword cType       acp_time_t    acp_file_t   acp_list_t     acp_list_node_t
syn keyword cType       acl_context_t acp_proc_t   acp_thr_attr_t
syn keyword cType       acl_hash_table_t           acl_hash_traverse_t
syn keyword cType       acp_thr_mutex_t
syn keyword cType       itgContext      

syn keyword cIdeReturn  ACP_TRUE    ACP_FALSE

syn keyword cAssertion  ACE_TEST      ACE_TEST_RAISE     ACE_RAISE
syn keyword cAssertion  ACE_ASSERT    ACE_DASSERT
syn keyword cException  ACE_EXCEPTION ACE_EXCEPTION_END

syn keyword cUlnFlag    ACL_CONTEXT_DECLARE   ACL_CONTEXT_INIT  ACL_CONTEXT_FINAL
syn keyword cUlnFlag    ITG_CONTEXT_INIT_PROC ITG_CONTEXT_FINAL_PROC
syn keyword cUlnFlag    ITG_CONTEXT_INIT_THR  ITG_CONTEXT_FINAL_THR 

syn keyword cType       ace_rc_t

hi def link cUlnFlag    UlnFlag
hi def link cIdeReturn  IdeReturn
hi def link cIDULIST    IDULIST
hi def link cAssertion  AltibaseAssertion
hi def link cException  AltibaseException
hi def link cShawnNote  ShawnNote

