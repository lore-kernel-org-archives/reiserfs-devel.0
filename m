From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Sat, 10 Oct 2015 17:03:43 +0200
Message-ID: <561928CF.9030903@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>		 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>		 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>		 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>	 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=KwnYkiP2VofyW6Qh7ZFVrTRm8NHL8fDcOPMUtdPcBtk=;
        b=IGUZNbmageiJYFFHNkOQ31N26IevnPNdOPQ5na4uOQWqhIraTRTQjbVB3yuR3ONMV6
         cWZrIoostVy8wQWq0+CYJiur17jECJGm3Pz668HIdTf7plpmJehN7ZaRMriDtX063Pui
         0BDQZZVV6i8LOC2R7rOgZi/sy3hBZBy4oiwd/5vEutohWKub0WxFUyjd96EsNQ+MXkAw
         +Z+EpP5EzQRquTETaqJdMhuae+Vr6OkkxGOXYczdhs9Z8Evml/4JXXnS84J8Il3B/zjC
         WOao4/lffxQBxpclsj999n6gCL117HcUgPLut/UBOu6cC8wa0oISiKBhl5XEjcXq1/Xn
         jyBg==
In-Reply-To: <1444473863.4257.10.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: Oleg Drokin <green@linuxhacker.ru>, reiserfs-devel@vger.kernel.org, =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>

On 10/10/2015 12:44 PM, Ivan Shapovalov wrote:
> On 2015-10-09 at 22:23 +0200, Edward Shishkin wrote:
>> On 10/09/2015 07:14 PM, Ivan Shapovalov wrote:
>>> On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:
>>>> On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
>>>>> On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
>>>>>> Hi Ivan,
>>>>>>
>>>>>> On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
>>>>>>> Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists
>>>>>>> .sou
>>>>>>> rcef
>>>>>>> orge.net/msg02745.html
>>>>>> Do you have a stack trace for reiser4?
>>>>>> How to reproduce it?
>>>>> I'll rebuild the kernel without the fix and provide you with
>>>>> the
>>>>> oops'
>>>>> stacktrace asap.
>>>>>
>>>>> I guess that it's tied to the config. In my case, it is
>>>>> reproducible on
>>>>> each boot, just as the DE starts up and something issues the
>>>>> first
>>>>> fsync().
>>>> Yes, let's try to find the culprit who doesn't set i_wb...
>>> So, here are the traces I've got after adding an
>>> assert(PageDirty(node->pg)) to queue_jnode():
>>> /* captured by hand as these are panics, not oopses */
>>>
>>> 1.
>>>
>>> queue_jnode()
>>> unformatted_make_reloc()
>>> assign_real_blocknrs()
>>> forward_relocate_unformatted()
>>> forward_alloc_unformatted_journal()
>>> ? coord_num_units()
>>> handle_pos_on_twig()
>>> flush_current_atom()
>>> flush_some_atom()
>>> reiser4_writeout()
>>> reiser4_writeback_inodes()
>>> <...>
>>>
>>> 2.
>>>
>>> znode_make_reloc()
>>> forward_alloc_formatted_wa()
>>> ? zload_ra()
>>> allocate_znode()
>>> alloc_pos_and_ancestors()
>>> flush_current_atom()
>>> reiser4_txn_end()
>>> ? reiser4_txn_end()
>>> reiser4_txn_restart_current()
>>> force_commit_atom()
>>> ? reiser4_txn_restart_current()
>>> txnmgr_force_commit_all()
>>> writepages_cryptcompress()
>>> reiser4_writepages_dispatch()
>>> <...>
>>> sys_fsync()
>>>
>>
>> Thanks Ivan.
>> Not a good news, TBH...
>>
>> For formatted nodes we can continue to narrow down the problem
>> (see the attached patch).
> Having applied the patch, I saw loads and loads of warnings (in ~10
> distinct stacktraces), but no panics or oopses in the initial location.
> The false positives are possible, right?


Yes, a lot of ones and nothing interesting.
The same for Dushan's logs. Sorry for bad idea..

Thanks,
Edward.


>
> The traces:
>
> 1.
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffff8145ddac>] dump_stack+0x4c/0x6e
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033cc88>] longterm_unlock_znode+0x738/0xe80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036de5c>] scan_by_coord+0x62c/0xed0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036e86d>] scan_unformatted+0x16d/0x320 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032b1f0>] ? incr_load_count+0x20/0xd0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036ed9b>] scan_common+0x37b/0x790 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc0370074>] flush_current_atom+0xec4/0x1b40 [reiser4]
> <...>
>
> 2.
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffff8145ddac>] dump_stack+0x4c/0x6e
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033cc88>] longterm_unlock_znode+0x738/0xe80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036b952>] neighbor_in_slum.constprop.12+0x82/0x1c0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036bc4a>] handle_pos_on_formatted+0x1ba/0xa40 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036c546>] handle_pos_on_leaf+0x16/0x80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc0370400>] flush_current_atom+0x1250/0x1b40 [reiser4]
> <...>
>
> 3.
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffff8145ddac>] dump_stack+0x4c/0x6e
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033cc88>] longterm_unlock_znode+0x738/0xe80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032f0c3>] unlock_carry_level+0xb3/0xd80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032fdb0>] done_carry_level+0x20/0x1f0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc0332036>] reiser4_carry+0x396/0x7b0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032bc0c>] ? reiser4_add_obj+0x9c/0x370 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033fb4a>] insert_into_item+0x1fa/0x610 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033ffd4>] reiser4_resize_item+0x74/0x190 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03ec314>] add_entry_cde+0x104/0x2f0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc0329af5>] ? znode_invariant+0x3a5/0xd50 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03aa19e>] reiser4_rename2_common+0xbce/0x1140 [reiser4]
> <...>
>
> 4.
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffff8145ddac>] dump_stack+0x4c/0x6e
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033cc88>] longterm_unlock_znode+0x738/0xe80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03f48af>] free_item_convert_data+0x3f/0x150 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03f5656>] detach_convert_idata+0x26/0x110 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03fd0f6>] convert_ctail+0x1016/0x2060 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03648ba>] convert_node+0x22a/0xd30 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032b40d>] ? zrelse+0x1d/0x70 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036bfc2>] handle_pos_on_formatted+0x532/0xa40 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc036c546>] handle_pos_on_leaf+0x16/0x80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc0370400>] flush_current_atom+0x1250/0x1b40 [reiser4]
> <...>
>
> 5.
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033cc88>] longterm_unlock_znode+0x738/0xe80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032f0c3>] unlock_carry_level+0xb3/0xd80 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032fdb0>] done_carry_level+0x20/0x1f0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc0332036>] reiser4_carry+0x396/0x7b0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc032bc0c>] ? reiser4_add_obj+0x9c/0x370 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033edda>] insert_with_carry_by_coord+0xea/0x250 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03d6016>] ? free_space_node40+0x16/0x170 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc033f3c6>] insert_by_coord+0x166/0x360 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03fa16f>] ctail_insert_unprepped_cluster+0x1df/0x750 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03c98e3>] prepare_logical_cluster+0x753/0x17f0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03cabdf>] do_write_cryptcompress+0x25f/0xed0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc0347a69>] ? is_in_reiser4_context+0x19/0x30 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03ce8d1>] write_cryptcompress+0xa1/0x1d0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03477fa>] ? _reiser4_init_context+0x6a/0xf0 [reiser4]
> Oct 10 00:28:42 intelfx-laptop kernel:  [<ffffffffc03bcc66>] reiser4_write_dispatch+0x166/0x4f0 [reiser4]
> <...>
>
> 6.
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffff8145ddac>] dump_stack+0x4c/0x6e
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc033cc88>] longterm_unlock_znode+0x738/0xe80 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc036611a>] move_flush_pos+0xba/0x2c0 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc036c10e>] handle_pos_on_formatted+0x67e/0xa40 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc036c546>] handle_pos_on_leaf+0x16/0x80 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc0370400>] flush_current_atom+0x1250/0x1b40 [reiser4]
> <...>
>
> 7.
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffff8145ddac>] dump_stack+0x4c/0x6e
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc033cc88>] longterm_unlock_znode+0x738/0xe80 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc03f48af>] free_item_convert_data+0x3f/0x150 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc03f5656>] detach_convert_idata+0x26/0x110 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc03fd0f6>] convert_ctail+0x1016/0x2060 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc03648ba>] convert_node+0x22a/0xd30 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc0363b9e>] ? znode_check_flushprepped+0xfe/0x360 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc036bb28>] handle_pos_on_formatted+0x98/0xa40 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc036c546>] handle_pos_on_leaf+0x16/0x80 [reiser4]
> Oct 10 00:28:43 intelfx-laptop kernel:  [<ffffffffc0370400>] flush_current_atom+0x1250/0x1b40 [reiser4]
> <...>
>
> ...and so on.
>
> I didn't check the code yet; I'll probably try with that assertion converted into warning and split into two
> (one for formatted and another for unformatted nodes), so that I could check what type of nodes is responsible
> for generating the final oops in set_page_writeback().
>
>> For unformatted nodes only code review
>> can help. Normally, all modifications of unformatted nodes should
>> look like the following:
>>
>> struct page *page = jnode_page(node);
>> lock_page(page);
>> char *data = kmap(page);
>> /* modifications are going here */
>> kunmap(page);
>> set_page_dirty_nobuffers(page); /* somebody forgets to do this */
>> unlock_page(page);
>>
>> Modifications of formatted nodes should look like the following:
>>
>> longterm_lock_znode(node);
>> zload(node);
>> /* modifications are going here */
>> zrelse(node);
>> znode_make_dirty(node); /* somebody forgets to do this */
>> longterm_unlock_znode();
>>
>> Anyway, we can use your patch 3 as a temporal fixup.
> The most persistent things are those conseived as the most temporary
> ones... ;)

