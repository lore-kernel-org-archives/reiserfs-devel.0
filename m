From: Yury Umanets <umka@namesys.com>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52:
 operator '==' has no left operand
Date: Thu, 16 Jan 2003 17:04:40 +0300
Message-ID: <3E26BBF8.40003@namesys.com>
References: <20030116120230.J7526@humilis> <3E2692AE.2030704@namesys.com> <20030116121007.L7526@humilis> <3E269499.2090909@namesys.com> <20030116123949.N7526@humilis> <3E26A2A6.702@namesys.com> <20030116133100.O7526@humilis> <3E26A821.4060006@namesys.com> <20030116140405.P7526@humilis> <3E26B263.2000909@namesys.com> <20030116145519.Q7526@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12393-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030116145519.Q7526@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ookhoi@humilis.net
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Ookhoi wrote:

>Yury Umanets wrote (ao):
>  
>
>>Ookhoi wrote:
>>    
>>
>>>Aha, oke. I edited prepare-conf to use the newer tools on my system.
>>>I also made a tar of the bk clone+pull.
>>>
>>>ookhoi $ tar xf reiser4progs.tar
>>>
>>>      
>>>
>>Actually you might be use
>>
>>make dist
>>    
>>
>
>Ah, nice :-)
>
>  
>
>>Send me please the output of the command
>>
>>nm libreiser4.so
>>    
>>
>
>I don't have a libreiser4.so on the system. Closest to that is
>/usr/local/lib/libreiser4.a  Is that oke?
>
No, it is not nornal case. It is pretty strange. Try the fllowing sequence:
bk pull
aclocall && autoheader && aitomake --add-missing && autoconf
./configure
make distclean
./configure
make
make install
ldconfig -v | grep reiser4

And let's see what happen

>
>  
>
>>It seems it doesn't contain plugins at all :) The output should contain 
>>a lot of __plugin_fini and __plugin_init private symbols.
>>    
>>
>
>nm /usr/local/lib/libreiser4.a
>libreiser4.o:
>         U __assert
>         U aal_exception_throw
>         U aal_stream_fini
>         U aal_stream_init
>00000654 t arginfo_k
>00000000 D core
>00000000 t factory_ifind
>00000018 t factory_nfind
>         U fprintf
>000006f4 T libreiser4_done
>         U libreiser4_factory_done
>         U libreiser4_factory_ifind
>         U libreiser4_factory_init
>         U libreiser4_factory_nfind
>000006b4 T libreiser4_init
>00000638 T libreiser4_max_interface_version
>00000640 T libreiser4_min_interface_version
>00000648 T libreiser4_version
>00000670 t print_key
>         U register_printf_function
>         U reiser4_coord_open
>         U reiser4_item_key
>         U reiser4_key_print
>         U reiser4_node_items
>         U reiser4_node_left
>         U reiser4_node_lock
>         U reiser4_node_maxspace
>         U reiser4_node_overhead
>         U reiser4_node_right
>         U reiser4_node_unlock
>         U reiser4_tree_insert
>         U reiser4_tree_lookup
>         U reiser4_tree_remove
>00000588 t tree_blockspace
>00000028 t tree_insert
>00000364 t tree_left
>00000480 t tree_lock
>00000168 t tree_lookup
>000005d4 t tree_nodespace
>000000e4 t tree_remove
>00000260 t tree_right
>00000504 t tree_unlock
>
>filesystem.o:
>         U __assert
>         U aal_block_create
>         U aal_block_number
>         U aal_block_sync
>         U aal_calloc
>         U aal_device_len
>         U aal_device_name
>         U aal_device_readonly
>         U aal_device_set_bs
>         U aal_exception_throw
>         U aal_free
>         U aal_pow_of_two
>         U reiser4_alloc_close
>         U reiser4_alloc_create
>         U reiser4_alloc_open
>         U reiser4_alloc_sync
>         U reiser4_alloc_valid
>         U reiser4_format_close
>         U reiser4_format_create
>         U reiser4_format_get_len
>         U reiser4_format_mark
>         U reiser4_format_name
>         U reiser4_format_open
>         U reiser4_format_reopen
>         U reiser4_format_sync
>         U reiser4_format_valid
>00000900 T reiser4_fs_blocksize
>00000378 T reiser4_fs_clobber
>000007c8 T reiser4_fs_close
>0000041c T reiser4_fs_create
>00000874 T reiser4_fs_format_pid
>000002ac T reiser4_fs_host_device
>00000328 T reiser4_fs_journal_device
>00000860 T reiser4_fs_name
>00000000 T reiser4_fs_open
>000006f0 T reiser4_fs_sync
>         U reiser4_journal_close
>         U reiser4_journal_create
>         U reiser4_journal_open
>         U reiser4_journal_replay
>         U reiser4_journal_sync
>         U reiser4_journal_valid
>         U reiser4_master_blocksize
>         U reiser4_master_close
>         U reiser4_master_create
>         U reiser4_master_format
>         U reiser4_master_open
>         U reiser4_master_reopen
>         U reiser4_master_sync
>         U reiser4_master_valid
>         U reiser4_oid_close
>         U reiser4_oid_create
>         U reiser4_oid_open
>         U reiser4_oid_sync
>         U reiser4_oid_valid
>         U reiser4_tree_close
>         U reiser4_tree_create
>         U reiser4_tree_open
>         U reiser4_tree_sync
>
>format.o:
>         U __assert
>         U aal_calloc
>         U aal_device_name
>         U aal_exception_throw
>         U aal_free
>00000300 t callback_action_mark
>000010b0 t callback_check_block
>         U libreiser4_factory_ifind
>         U reiser4_alloc_mark
>00000ff4 T reiser4_format_alloc_layout
>00000c58 T reiser4_format_alloc_pid
>000010d8 T reiser4_format_belongs
>00000598 T reiser4_format_close
>00000610 T reiser4_format_confirm
>000000f4 T reiser4_format_create
>00000e7c T reiser4_format_format_layout
>00000818 T reiser4_format_get_free
>000008a4 T reiser4_format_get_height
>0000078c T reiser4_format_get_len
>0000091c T reiser4_format_get_make_stamp
>00000700 T reiser4_format_get_root
>00000f38 T reiser4_format_journal_layout
>00000bd8 T reiser4_format_journal_pid
>00000d58 T reiser4_format_layout
>00000310 T reiser4_format_mark
>00000688 T reiser4_format_name
>00000cd8 T reiser4_format_oid_pid
>00000000 T reiser4_format_open
>00000470 T reiser4_format_print
>0000052c T reiser4_format_reopen
>00000a7c T reiser4_format_set_free
>00000af0 T reiser4_format_set_height
>00000a08 T reiser4_format_set_len
>00000b68 T reiser4_format_set_make_stamp
>00000994 T reiser4_format_set_root
>00000dc0 T reiser4_format_skipped_layout
>00000208 T reiser4_format_sync
>00000284 T reiser4_format_valid
>
>journal.o:
>         U __assert
>         U aal_calloc
>         U aal_device_name
>         U aal_exception_throw
>         U aal_free
>         U libreiser4_factory_ifind
>         U reiser4_format_journal_pid
>0000046c T reiser4_journal_close
>00000118 T reiser4_journal_create
>00000000 T reiser4_journal_open
>000003b0 T reiser4_journal_print
>00000238 T reiser4_journal_replay
>000002b4 T reiser4_journal_sync
>00000330 T reiser4_journal_valid
>
>alloc.o:
>         U __assert
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>         U aux_bitmap_clear
>         U aux_bitmap_close
>         U aux_bitmap_create
>         U aux_bitmap_mark
>         U libreiser4_factory_ifind
>00000640 T reiser4_alloc_allocate
>000001d8 T reiser4_alloc_assign
>0000097c T reiser4_alloc_assign_forb
>00000a94 T reiser4_alloc_assign_perm
>00000394 T reiser4_alloc_close
>000000ec T reiser4_alloc_create
>00000854 T reiser4_alloc_forbid
>00000420 T reiser4_alloc_free
>00000530 T reiser4_alloc_mark
>00000000 T reiser4_alloc_open
>000008e8 T reiser4_alloc_permit
>000002dc T reiser4_alloc_print
>000007c8 T reiser4_alloc_region_layout
>000005b8 T reiser4_alloc_release
>00000260 T reiser4_alloc_sync
>00000744 T reiser4_alloc_test
>000004a8 T reiser4_alloc_used
>000006c8 T reiser4_alloc_valid
>         U reiser4_format_alloc_pid
>
>oid.o:
>         U __assert
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>         U libreiser4_factory_ifind
>         U reiser4_format_oid_pid
>0000033c T reiser4_oid_allocate
>00000124 T reiser4_oid_close
>0000019c T reiser4_oid_create
>0000065c T reiser4_oid_free
>000002c0 T reiser4_oid_next
>00000000 T reiser4_oid_open
>00000524 T reiser4_oid_print
>000003b8 T reiser4_oid_release
>0000074c T reiser4_oid_root_locality
>000007c0 T reiser4_oid_root_objectid
>000006d8 T reiser4_oid_root_parent_locality
>000004a8 T reiser4_oid_sync
>000005e0 T reiser4_oid_used
>0000042c T reiser4_oid_valid
>
>factory.o:
>         U __assert
>         U __plugin_end
>         U __plugin_start
>         U aal_exception_throw
>         U aal_list_append
>         U aal_list_find_custom
>         U aal_list_first
>         U aal_list_last
>         U aal_list_length
>         U aal_list_next
>         U aal_list_prev
>         U aal_list_remove
>00000078 t callback_check_plugin
>00000000 t callback_match_id
>0000001c t callback_match_name
>         U core
>000006cc T libreiser4_factory_cfind
>0000054c T libreiser4_factory_done
>00000798 T libreiser4_factory_foreach
>000005d0 T libreiser4_factory_ifind
>00000484 T libreiser4_factory_init
>00000338 T libreiser4_factory_load
>00000650 T libreiser4_factory_nfind
>00000418 T libreiser4_factory_unload
>000002e8 T libreiser4_plugin_close
>000001ac T libreiser4_plugin_fini
>0000010c T libreiser4_plugin_init
>0000022c T libreiser4_plugin_open
>         U memset
>00000000 D plugins
>         U snprintf
>         U strncmp
>
>node.o:
>         U __assert
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>         U aal_list_find_custom
>         U aal_list_first
>         U aal_list_free
>         U aal_list_insert_sorted
>         U aal_list_next
>         U aal_list_remove
>         U aal_lru_attach
>         U aal_lru_detach
>         U aal_lru_touch
>00002488 t callback_comp_blk
>00002444 t callback_comp_key
>0000091c t callback_comp_node
>0000019c t callback_guess_node
>         U libreiser4_factory_cfind
>         U libreiser4_factory_ifind
>         U reiser4_coord_init
>         U reiser4_coord_open
>         U reiser4_item_estimate
>         U reiser4_item_key
>         U reiser4_item_max_poss_key
>         U reiser4_item_nodeptr
>         U reiser4_item_type
>         U reiser4_item_units
>         U reiser4_item_update
>         U reiser4_key_compare
>00000cec T reiser4_node_attach
>0000083c T reiser4_node_cbk
>000008a4 T reiser4_node_cbp
>00000314 T reiser4_node_close
>00000ec0 T reiser4_node_confirm
>00000000 T reiser4_node_create
>00000e10 T reiser4_node_detach
>000009f0 t reiser4_node_fnn
>00002380 T reiser4_node_get_flush_stamp
>000022c4 T reiser4_node_get_make_stamp
>00000230 t reiser4_node_guess
>00001a78 T reiser4_node_insert
>0000113c T reiser4_node_items
>00000bac T reiser4_node_left
>0000139c T reiser4_node_level
>00000528 T reiser4_node_lkey
>0000045c T reiser4_node_lock
>00000f38 T reiser4_node_lookup
>000012a4 T reiser4_node_maxspace
>000005f4 T reiser4_node_nkey
>00000270 T reiser4_node_open
>0000122c T reiser4_node_overhead
>00000774 T reiser4_node_pos
>000000e8 T reiser4_node_print
>00000950 t reiser4_node_register
>00001d60 T reiser4_node_remove
>00000c4c T reiser4_node_right
>000023dc T reiser4_node_set_flush_stamp
>00002324 T reiser4_node_set_make_stamp
>0000141c T reiser4_node_shift
>000011b4 T reiser4_node_space
>000017f0 T reiser4_node_sync
>00001f40 T reiser4_node_traverse
>000018e4 T reiser4_node_ukey
>000004a4 T reiser4_node_unlock
>00000da4 t reiser4_node_unregister
>0000131c T reiser4_node_valid
>         U reiser4_tree_load
>
>tree.o:
>         U __assert
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>         U aal_list_first
>         U aal_list_next
>         U aal_lru_adjust
>         U aal_lru_create
>         U aal_lru_free
>         U aal_mpressure_disable
>         U aal_mpressure_enable
>         U aal_mpressure_handler_create
>         U aal_mpressure_handler_free
>         U aal_stream_fini
>00000054 t callback_get_next
>00000070 t callback_get_prev
>00000000 t callback_node_free
>00000038 t callback_node_sync
>00000060 t callback_set_next
>0000007c t callback_set_prev
>00000474 t callback_tree_mpressure
>         U libreiser4_factory_ifind
>00000000 d lru_ops
>         U reiser4_alloc_allocate
>         U reiser4_alloc_free
>         U reiser4_alloc_release
>         U reiser4_coord_blk
>         U reiser4_coord_init
>         U reiser4_coord_realize
>         U reiser4_format_get_height
>         U reiser4_format_get_make_stamp
>         U reiser4_format_get_root
>         U reiser4_format_set_free
>         U reiser4_format_set_height
>         U reiser4_format_set_root
>         U reiser4_item_estimate
>         U reiser4_item_nodeptr
>         U reiser4_key_build_generic
>         U reiser4_key_compare
>         U reiser4_key_print
>         U reiser4_node_attach
>         U reiser4_node_cbp
>         U reiser4_node_close
>         U reiser4_node_create
>         U reiser4_node_get_flush_stamp
>         U reiser4_node_insert
>         U reiser4_node_items
>         U reiser4_node_left
>         U reiser4_node_level
>         U reiser4_node_lkey
>         U reiser4_node_lookup
>         U reiser4_node_maxspace
>         U reiser4_node_open
>         U reiser4_node_overhead
>         U reiser4_node_remove
>         U reiser4_node_right
>         U reiser4_node_set_flush_stamp
>         U reiser4_node_set_make_stamp
>         U reiser4_node_shift
>         U reiser4_node_space
>         U reiser4_node_sync
>0000008c T reiser4_tree_allocate
>00000cb8 T reiser4_tree_attach
>000002bc t reiser4_tree_build_key
>000008c0 T reiser4_tree_close
>0000064c T reiser4_tree_create
>00000518 T reiser4_tree_fini
>000007bc T reiser4_tree_flush
>00000ef4 t reiser4_tree_grow
>00000920 T reiser4_tree_height
>000004bc t reiser4_tree_init
>00001454 T reiser4_tree_insert
>00000274 T reiser4_tree_key
>00000208 T reiser4_tree_load
>000009e0 T reiser4_tree_lookup
>000010b8 T reiser4_tree_mkspace
>00000580 T reiser4_tree_open
>00000174 T reiser4_tree_release
>000017c8 T reiser4_tree_remove
>00000420 T reiser4_tree_root
>00000fa4 T reiser4_tree_shift
>0000086c T reiser4_tree_sync
>
>key.o:
>         U __assert
>         U aal_exception_throw
>         U libreiser4_factory_ifind
>00000260 T reiser4_key_assign
>000005a4 T reiser4_key_build_direntry
>000006b0 T reiser4_key_build_entryid
>000003ec T reiser4_key_build_generic
>000004d0 T reiser4_key_build_objid
>00000350 T reiser4_key_clean
>00000138 T reiser4_key_compare
>00000cd4 T reiser4_key_get_hash
>00000e5c T reiser4_key_get_locality
>00000d98 T reiser4_key_get_objectid
>00000c10 T reiser4_key_get_offset
>00000b60 T reiser4_key_get_type
>000000f0 T reiser4_key_guess
>00000000 T reiser4_key_init
>00000f20 T reiser4_key_maximal
>00000fc8 T reiser4_key_minimal
>00001070 T reiser4_key_print
>00000920 T reiser4_key_set_hash
>00000aa0 T reiser4_key_set_locality
>000009e0 T reiser4_key_set_objectid
>00000860 T reiser4_key_set_offset
>000007a8 T reiser4_key_set_type
>00001128 T reiser4_key_valid
>
>file.o:
>         U __assert
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>         U aal_stream_fini
>         U aal_stream_init
>00000000 t callback_guess_file
>         U libreiser4_factory_cfind
>         U memset
>00000380 T reiser4_file_begin
>00000b1c T reiser4_file_close
>00000800 T reiser4_file_create
>00000048 t reiser4_file_guess
>00000ea0 T reiser4_file_layout
>00000d34 T reiser4_file_offset
>0000052c T reiser4_file_open
>00000c78 T reiser4_file_read
>0000009c t reiser4_file_realize
>00000bc4 T reiser4_file_reset
>00000de8 T reiser4_file_seek
>00000684 T reiser4_file_truncate
>00000744 T reiser4_file_write
>         U reiser4_item_key
>         U reiser4_key_build_generic
>         U reiser4_key_get_locality
>         U reiser4_key_get_objectid
>         U reiser4_key_init
>         U reiser4_key_print
>         U reiser4_key_set_offset
>         U reiser4_key_set_type
>         U reiser4_oid_allocate
>         U reiser4_oid_root_locality
>         U reiser4_oid_root_objectid
>         U reiser4_oid_root_parent_locality
>         U reiser4_tree_lookup
>         U strchr
>         U strncat
>         U strncpy
>
>coord.o:
>         U __assert
>         U aal_exception_throw
>         U libreiser4_factory_ifind
>00000000 T reiser4_coord_blk
>00000050 T reiser4_coord_device
>0000025c T reiser4_coord_init
>000001f0 T reiser4_coord_open
>00000094 T reiser4_coord_realize
>
>master.o:
>         U __assert
>         U aal_block_close
>         U aal_block_create
>         U aal_block_number
>         U aal_block_open
>         U aal_block_sync
>         U aal_calloc
>         U aal_device_error
>         U aal_device_set_bs
>         U aal_exception_throw
>         U aal_free
>         U aal_stream_format
>00000130 t callback_guess_format
>         U libreiser4_factory_cfind
>00000684 T reiser4_master_blocksize
>0000059c T reiser4_master_close
>00000290 T reiser4_master_confirm
>00000000 T reiser4_master_create
>00000638 T reiser4_master_format
>0000017c T reiser4_master_guess
>00000714 T reiser4_master_label
>000005f4 T reiser4_master_magic
>0000037c T reiser4_master_open
>00000194 T reiser4_master_print
>000004a8 T reiser4_master_reopen
>0000050c T reiser4_master_sync
>000006cc T reiser4_master_uuid
>000000f4 T reiser4_master_valid
>         U strncpy
>
>item.o:
>         U __assert
>         U aal_exception_throw
>00000738 T reiser4_item_body
>00000450 T reiser4_item_direntry
>00000094 T reiser4_item_estimate
>000003b8 T reiser4_item_extent
>000007fc T reiser4_item_key
>000006b8 T reiser4_item_len
>00000a20 T reiser4_item_max_poss_key
>00000b20 T reiser4_item_max_real_key
>00000580 T reiser4_item_nodeptr
>00000288 T reiser4_item_permissn
>000007b8 T reiser4_item_plugin
>0000019c T reiser4_item_print
>000004e8 T reiser4_item_statdata
>00000320 T reiser4_item_tail
>00000618 T reiser4_item_type
>00000000 T reiser4_item_units
>00000954 T reiser4_item_update
>         U reiser4_key_guess
>
>bitmap.o:
>         U __assert
>         U aal_calloc
>         U aal_clear_bit
>         U aal_clear_bits
>         U aal_exception_throw
>         U aal_find_next_set_bit
>         U aal_find_next_zero_bit
>         U aal_free
>         U aal_set_bit
>         U aal_set_bits
>         U aal_test_bit
>00000798 t aux_bitmap_calc
>000008d4 T aux_bitmap_calc_cleared
>00000914 T aux_bitmap_calc_cleared_in_area
>000008ac T aux_bitmap_calc_marked
>000008f4 T aux_bitmap_calc_marked_in_area
>00000090 T aux_bitmap_clear
>00000180 T aux_bitmap_clear_all
>0000034c T aux_bitmap_clear_range
>00000984 T aux_bitmap_cleared
>00000a54 T aux_bitmap_clone
>00000ad0 T aux_bitmap_close
>000009dc T aux_bitmap_create
>00000630 T aux_bitmap_find_cleared
>000006e4 T aux_bitmap_find_marked
>00000b58 T aux_bitmap_map
>00000000 T aux_bitmap_mark
>00000120 T aux_bitmap_mark_all
>00000260 T aux_bitmap_mark_range
>00000934 T aux_bitmap_marked
>000001dc T aux_bitmap_test
>00000438 T aux_bitmap_test_range_cleared
>00000534 T aux_bitmap_test_range_marked
>         U memcpy
>         U memset
>
>aux.o:
>         U __errno_location
>         U __strtol_internal
>00000000 T aux_binsearch
>00000100 T aux_strncat
>000000a8 T aux_strtol
>         U vsnprintf
>
>sdext_unix.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_stream_format
>00000000 d core
>         U ctime
>         U memset
>00000000 t sdext_unix_init
>00000158 t sdext_unix_length
>000000ac t sdext_unix_open
>00000020 d sdext_unix_plugin
>00000164 t sdext_unix_print
>000002c8 t sdext_unix_start
>
>key40.o:
>00000058 r MAXIMAL_KEY
>00000040 r MINIMAL_KEY
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_exception_throw
>         U aal_stream_format
>00000000 d core
>0000229c t k40_set_el
>000004e8 t key40_assign
>0000167c t key40_build_direntry
>00001934 t key40_build_entryid
>000019b8 t key40_build_generic
>000014b0 t key40_build_hash
>00001e1c t key40_build_objid
>000013a4 t key40_clean
>00000330 t key40_compare
>000000e4 t key40_compare_short
>00000574 t key40_confirm
>000012ac t key40_get_hash
>00000c30 t key40_get_locality
>00000e74 t key40_get_objectid
>00001070 t key40_get_offset
>000009f8 t key40_get_type
>00000000 T key40_m2n
>00000074 t key40_m2t
>000000d8 t key40_maximal
>000000cc t key40_minimal
>000013ec t key40_pack_string
>00000020 d key40_plugin
>000021b0 T key40_print
>00001154 t key40_set_hash
>00000ad8 t key40_set_locality
>00000d28 t key40_set_objectid
>00000f64 t key40_set_offset
>0000089c t key40_set_type
>00002288 t key40_start
>0000001c t key40_t2m
>000005b0 t key40_valid
>00000000 r minor_names
>
>reg40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_block_close
>         U aal_block_open
>         U aal_calloc
>         U aal_device_get_bs
>         U aal_exception_throw
>         U aal_free
>00000000 d core
>         U file40_get_mode
>         U file40_get_size
>         U file40_init
>         U file40_locality
>         U file40_lock
>         U file40_objectid
>         U file40_realize
>         U file40_unlock
>         U getgid
>         U getuid
>         U memcpy
>         U memset
>00000dc0 t reg40_close
>00000e74 t reg40_confirm
>00000730 t reg40_create
>00000b40 t reg40_layout
>0000012c t reg40_next
>00000e24 t reg40_offset
>000005dc t reg40_open
>00000020 d reg40_plugin
>00000b24 t reg40_policy
>000001d8 t reg40_read
>00000000 t reg40_reset
>00000ef4 t reg40_seek
>00000f00 t reg40_start
>00000b18 t reg40_truncate
>00000b38 t reg40_write
>         U time
>
>alloc40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U __udivdi3
>         U aal_adler32
>         U aal_block_close
>         U aal_block_create
>         U aal_block_open
>         U aal_block_size
>         U aal_block_sync
>         U aal_calloc
>         U aal_device_get_bs
>         U aal_exception_throw
>         U aal_free
>000009e0 t alloc40_allocate
>00000434 t alloc40_assign
>00000824 t alloc40_close
>0000030c t alloc40_create
>00000b18 t alloc40_free
>000008b8 t alloc40_mark
>00000190 t alloc40_open
>00000020 d alloc40_plugin
>00000aa0 t alloc40_print
>00000ec4 T alloc40_region_layout
>0000094c t alloc40_release
>0000103c t alloc40_start
>00000764 t alloc40_sync
>00000c30 t alloc40_test
>00000ba4 t alloc40_used
>00000e0c T alloc40_valid
>         U aux_bitmap_calc_marked
>         U aux_bitmap_clear
>         U aux_bitmap_cleared
>         U aux_bitmap_close
>         U aux_bitmap_create
>         U aux_bitmap_find_cleared
>         U aux_bitmap_map
>         U aux_bitmap_mark
>         U aux_bitmap_marked
>         U aux_bitmap_test
>00000cc8 t callback_check_bitmap
>00000000 t callback_fetch_bitmap
>00000550 t callback_sync_bitmap
>00000000 d core
>         U memcpy
>
>dir40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>00000000 d core
>0000118c t dir40_close
>00001290 t dir40_confirm
>000006dc t dir40_create
>0000011c t dir40_guess
>000010d4 t dir40_layout
>00000320 t dir40_lookup
>00000130 t dir40_next
>000011f0 t dir40_offset
>00000560 t dir40_open
>00000020 d dir40_plugin
>000001e8 t dir40_read
>00000000 t dir40_reset
>0000123c t dir40_seek
>00001310 t dir40_start
>00000de0 t dir40_truncate
>00000dec t dir40_write
>         U file40_get_mode
>         U file40_init
>         U file40_locality
>         U file40_lock
>         U file40_objectid
>         U file40_realize
>         U file40_unlock
>         U getgid
>         U getuid
>         U memset
>         U time
>
>key40_repair.o:
>
>journal40_repair.o:
>         U __assert
>00000000 t __blk_type_name
>         U aal_block_close
>         U aal_block_number
>         U aal_block_open
>         U aal_exception_throw
>         U aux_bitmap_create
>         U aux_bitmap_mark
>         U aux_bitmap_test
>00000000 d blk_types
>00000024 t callback_check_format_block
>000001b4 t callback_find_sec_blk
>00000160 t callback_find_txh_blk
>00000314 t callback_journal_sec_check
>00000200 t callback_journal_txh_check
>0000004c t journal40_blk_format_check
>000007e4 T journal40_check
>         U journal40_device
>         U journal40_traverse
>         U journal40_traverse_trans
>         U memset
>
>tea_hash.o:
>00000004 d __plugin_fini
>00000000 d __plugin_init
>00000000 T tea_hash_build
>00000000 d tea_hash_plugin
>000007cc t tea_hash_start
>
>footer.o:
>00000000 D __plugin_end
>
>node40_repair.o:
>         U __assert
>         U aal_block_number
>         U aal_device_get_bs
>         U aal_exception_throw
>         U aal_test_bit
>00000780 T node40_check
>00000720 t node40_corrupt
>         U node40_free_space_end
>00000000 t node40_get_offset_at
>         U node40_ih_at
>00000244 t node40_item_array_check
>000005fc t node40_item_count_check
>         U node40_items
>00000080 t node40_region_delete
>         U node40_remove
>00000040 t node40_set_offset_at
>
>direntry40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_exception_throw
>         U aal_stream_format
>         U aux_binsearch
>00001990 t callback_comp_entry
>00000000 d core
>00000000 T direntry40_body
>         U direntry40_check
>000004e0 t direntry40_estimate
>00000228 t direntry40_fetch
>000010c8 t direntry40_init
>00000cf4 t direntry40_insert
>00001738 t direntry40_lookup
>00001434 t direntry40_max_poss_key
>000015ec t direntry40_max_real_key
>000003f0 t direntry40_mergeable
>00000020 d direntry40_plugin
>00000588 t direntry40_predict
>000012b0 t direntry40_print
>00001124 t direntry40_remove
>000007f4 t direntry40_shift
>0000197c t direntry40_start
>00000038 t direntry40_unit_key
>0000000c t direntry40_unit_len
>000001d8 t direntry40_units
>         U memcpy
>         U memmove
>         U memset
>
>file40.o:
>         U __assert
>         U aal_exception_throw
>00000148 T file40_get_mode
>000001f4 T file40_get_size
>00000384 T file40_init
>0000007c T file40_locality
>000000f8 T file40_lock
>00000000 T file40_objectid
>00000420 T file40_realize
>000001e8 T file40_set_mode
>0000029c T file40_set_size
>00000120 T file40_unlock
>         U memset
>
>rupasov_hash.o:
>00000004 d __plugin_fini
>00000000 d __plugin_init
>00000000 T rupasov_hash_build
>00000000 d rupasov_hash_plugin
>00000194 t rupasov_hash_start
>
>direntry40_repair.o:
>         U __assert
>         U aal_exception_throw
>         U direntry40_body
>000001b0 T direntry40_check
>00000000 t direntry40_count_check
>00000194 t direntry40_region_delete
>
>format40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U __udivdi3
>         U aal_block_close
>         U aal_block_create
>         U aal_block_number
>         U aal_block_open
>         U aal_block_sync
>         U aal_calloc
>         U aal_device_error
>         U aal_device_get_bs
>         U aal_device_len
>         U aal_exception_throw
>         U aal_free
>         U aal_stream_format
>00000860 t callback_clobber_block
>00000000 d core
>00000300 t format40_alloc_layout
>00000c54 t format40_alloc_pid
>         U format40_check
>00000b30 t format40_close
>00000b88 t format40_confirm
>000008f4 t format40_create
>0000074c t format40_device
>0000050c t format40_format_layout
>00000144 t format40_get_free
>00000198 t format40_get_height
>000000f0 t format40_get_len
>0000009c t format40_get_root
>000001e0 t format40_get_stamp
>00000228 t format40_journal_layout
>00000c4c t format40_journal_pid
>000005fc t format40_layout
>00000728 t format40_magic
>00000c40 t format40_name
>00000bec t format40_oid_area
>00000c5c t format40_oid_pid
>000007d4 t format40_open
>00000020 d format40_plugin
>00000df4 T format40_print
>00000d0c t format40_set_free
>00000d60 t format40_set_height
>00000cb8 t format40_set_len
>00000c64 t format40_set_root
>00000dac t format40_set_stamp
>00000430 t format40_skipped_layout
>00000f94 t format40_start
>00000000 t format40_start_at
>0000066c t format40_super_check
>00000758 t format40_super_open
>00000a44 t format40_sync
>00000ad4 t format40_valid
>00000004 d formats
>         U random
>         U srandom
>         U time
>
>sdext_lt.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_stream_format
>00000000 d core
>00000000 t sdext_lt_init
>00000120 t sdext_lt_length
>00000090 t sdext_lt_open
>00000020 d sdext_lt_plugin
>0000012c t sdext_lt_print
>000001dc t sdext_lt_start
>
>sdext_lw.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_stream_format
>00000000 d core
>0000013c t sdext_lw_file_type
>00000000 t sdext_lw_init
>00000130 t sdext_lw_length
>00000098 t sdext_lw_open
>00000198 t sdext_lw_parse_mode
>00000020 d sdext_lw_plugin
>00000254 t sdext_lw_print
>00000334 t sdext_lw_start
>
>tail40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_exception_throw
>         U aal_stream_format
>00000000 d core
>         U memcpy
>         U memmove
>         U memset
>00000000 t tail40_body
>000006a4 t tail40_fetch
>00000364 t tail40_init
>00000158 t tail40_insert
>000006c8 t tail40_lookup
>0000044c t tail40_max_poss_key
>00000574 t tail40_max_real_key
>00000890 t tail40_mergeable
>00000020 d tail40_plugin
>00000a20 t tail40_predict
>000003bc t tail40_print
>00000270 t tail40_remove
>00000b00 t tail40_shift
>00000c58 t tail40_start
>00000018 t tail40_unit_key
>0000000c t tail40_units
>
>nodeptr40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_stream_format
>00000000 d core
>         U memset
>00000000 t nodeptr40_body
>00000108 t nodeptr40_estimate
>000001e8 t nodeptr40_fetch
>00000018 t nodeptr40_init
>00000070 t nodeptr40_insert
>00000020 d nodeptr40_plugin
>00000150 t nodeptr40_print
>0000031c t nodeptr40_start
>0000000c t nodeptr40_units
>00000288 t nodeptr40_update
>
>oid40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_calloc
>         U aal_free
>         U aal_stream_format
>00000000 d core
>000001a4 t oid40_allocate
>0000004c t oid40_close
>00000094 t oid40_create
>00000340 t oid40_free
>0000015c t oid40_next
>00000000 t oid40_open
>00000020 d oid40_plugin
>00000250 t oid40_print
>0000020c t oid40_release
>000003e8 t oid40_root_locality
>000003f4 t oid40_root_objectid
>000003dc t oid40_root_parent_locality
>00000400 t oid40_start
>00000100 t oid40_sync
>00000394 t oid40_used
>000002e8 t oid40_valid
>
>stat40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_exception_throw
>         U aal_stream_format
>0000058c t callback_body
>00000118 t callback_open
>000005dc t callback_present
>00000668 t callback_print
>00000628 t callback_sdexts
>00000000 d core
>         U memset
>         U stat40_check
>000002b4 t stat40_estimate
>0000025c t stat40_init
>000003b4 t stat40_insert
>00000000 t stat40_layout
>000001d0 t stat40_open
>00000020 d stat40_plugin
>00000730 t stat40_print
>00000538 t stat40_remove
>000005a8 t stat40_sdext_body
>000005fc t stat40_sdext_present
>00000638 t stat40_sdexts
>000007e8 t stat40_start
>00000580 t stat40_units
>00000544 t stat40_valid
>
>r5_hash.o:
>00000004 d __plugin_fini
>00000000 d __plugin_init
>00000000 T r5_hash_build
>00000000 d r5_hash_plugin
>0000005c t r5_hash_start
>
>extent40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_device_get_bs
>         U aal_exception_throw
>         U aal_stream_format
>00000000 d core
>00000000 t extent40_body
>00000d84 t extent40_fetch
>00000428 t extent40_init
>00000238 t extent40_insert
>00000b54 t extent40_lookup
>00000780 t extent40_max_poss_key
>000008b4 t extent40_max_real_key
>00000efc t extent40_mergeable
>00000020 d extent40_plugin
>00001094 t extent40_predict
>000005dc t extent40_print
>00000480 t extent40_remove
>000010a0 t extent40_shift
>000006e8 t extent40_size
>000010ac t extent40_start
>00000078 t extent40_unit_key
>0000000c t extent40_units
>00000e40 t extent40_update
>         U memmove
>         U memset
>
>stat40_repair.o:
>00000000 T stat40_check
>
>journal40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_block_close
>         U aal_block_create
>         U aal_block_number
>         U aal_block_open
>         U aal_block_relocate
>         U aal_block_sync
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>         U aal_list_append
>         U aal_list_first
>         U aal_list_last
>         U aal_list_remove
>000002b8 t callback_alloc_journal
>000000ec t callback_fetch_journal
>0000053c t callback_journal_handler
>000003f8 t callback_sync_journal
>00000000 d core
>         U journal40_check
>00000dd8 t journal40_close
>0000034c t journal40_create
>00000078 T journal40_device
>0000003c t journal40_fcheck
>00000000 t journal40_hcheck
>00000198 t journal40_open
>00000020 d journal40_plugin
>00000d60 t journal40_print
>00000cec t journal40_replay
>00000e38 t journal40_start
>000004b4 t journal40_sync
>00000a5c T journal40_traverse
>00000800 T journal40_traverse_trans
>00000594 t journal40_update
>00000240 t journal40_valid
>
>header.o:
>00000000 D __plugin_start
>
>fnv1_hash.o:
>00000004 d __plugin_fini
>00000000 d __plugin_init
>00000000 t fnv1_hash_build
>00000000 d fnv1_hash_plugin
>0000007c t fnv1_hash_start
>
>node40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_block_close
>         U aal_block_create
>         U aal_block_number
>         U aal_block_open
>         U aal_block_size
>         U aal_block_sync
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>         U aal_stream_format
>         U aux_binsearch
>00002c34 t callback_comp_key
>00000000 d core
>0000001c d groups
>00000004 d levels
>         U memcpy
>         U memmove
>         U memset
>         U node40_check
>00000224 t node40_close
>000002bc t node40_confirm
>00000000 t node40_create
>000011c4 t node40_cut
>00000928 t node40_expand
>00002c0c T node40_free_space_end
>00001494 t node40_get_flush_stamp
>0000035c t node40_get_key
>000013b4 T node40_get_level
>00001400 t node40_get_make_stamp
>00002bd8 T node40_ib_at
>00002bac T node40_ih_at
>00000d8c t node40_insert
>000007c4 t node40_item
>000004e8 t node40_item_body
>000019e4 T node40_item_legal
>000006a8 t node40_item_len
>000005c8 t node40_item_pid
>00000310 T node40_items
>00001aa8 t node40_lookup
>00000494 t node40_maxspace
>00001bd8 t node40_mergeable
>0000017c t node40_open
>00000488 t node40_overhead
>00000fd4 t node40_paste
>00000130 t node40_pid
>00000040 d node40_plugin
>000022fc t node40_predict_items
>00001c40 t node40_predict_units
>00001780 t node40_print
>00001114 T node40_remove
>000014ec t node40_set_flush_stamp
>00001540 t node40_set_key
>000016d8 t node40_set_level
>0000144c t node40_set_make_stamp
>0000172c t node40_set_stamp
>00002a50 t node40_shift
>000025e0 t node40_shift_items
>00001ed0 t node40_shift_units
>00000ba4 t node40_shrink
>00001368 t node40_space
>00002b98 t node40_start
>000000e0 t node40_sync
>0000130c t node40_valid
>
>sdext_symlink.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_stream_format
>00000000 d core
>         U memcpy
>00000000 t sdext_symlink_init
>00000130 t sdext_symlink_length
>00000098 t sdext_symlink_open
>00000020 d sdext_symlink_plugin
>00000180 t sdext_symlink_print
>0000022c t sdext_symlink_start
>
>format40_repair.o:
>         U __assert
>         U aal_device_len
>         U aal_exception_throw
>         U aal_ui_get_numeric
>00000000 t callback_len_check
>00000044 t callback_tail_check
>00000084 T format40_check
>
>symlink40.o:
>         U __assert
>00000004 d __plugin_fini
>00000000 d __plugin_init
>         U aal_calloc
>         U aal_exception_throw
>         U aal_free
>00000000 d core
>         U file40_get_mode
>         U file40_init
>         U file40_locality
>         U file40_objectid
>         U file40_realize
>         U file40_unlock
>         U getgid
>         U getuid
>         U memset
>00000604 t symlink40_close
>0000065c t symlink40_confirm
>00000230 t symlink40_create
>0000010c t symlink40_open
>00000020 d symlink40_plugin
>00000000 t symlink40_read
>000006dc t symlink40_start
>000005fc t symlink40_write
>         U time
>
>
>  
>


-- 
Yury Umanets


