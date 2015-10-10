From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Sat, 10 Oct 2015 09:19:16 +0200
Message-ID: <CADW=+3=uLsi-iPOuE1cwm8_sMjv7w_uMQNXVhL=4daBkKsguEA@mail.gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	<1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	<5617C0C1.6060806@gmail.com>
	<1444398642.6030.3.camel@gmail.com>
	<5617D55D.2040908@gmail.com>
	<1444410842.2213.5.camel@gmail.com>
	<56182257.7060304@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=VCKOlVTB90fGcRr5WiViG02C2odACYoZTFWd9yseWWI=;
        b=BiMyJcFaEunRqveWE/ygfRHLXO6lQCI3Xy/NGKamTyXMFyV90oYKZZ7nmrfjv/bjSk
         nq3W6oaW+IAir+PU9wJ8NrRfhbm5Bp46vgfDZNk6zrMna1Z+hE/ARj5hdei9Nl6cLL3R
         671nkb0E1Jmczsbc3J1AD2MnC8zNbykFu9Py+HMzUWNDespW733AjQ9LvzVTX2rVZ3LJ
         Qe3Lk+R1kTAbsZfYA7EQHM2p6KN6Lp3/LyCbxenv80lBAiwhjTmZ+of0tHLEgwqy3rDQ
         9wvUeMKmeq4f7XkKzyf4gkKcdJSlhgcTF9VoE92P7VMEMnsrj1lGeAFUmXdaCCax5pI3
         +dQw==
In-Reply-To: <56182257.7060304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>, Oleg Drokin <green@linuxhacker.ru>

On Fri, Oct 9, 2015 at 10:23 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 10/09/2015 07:14 PM, Ivan Shapovalov wrote:
>>
>> On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:
>>>
>>> On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
>>>>
>>>> On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
>>>>>
>>>>> Hi Ivan,
>>>>>
>>>>> On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
>>>>>>
>>>>>> Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sou
>>>>>> rcef
>>>>>> orge.net/msg02745.html
>>>>>
>>>>> Do you have a stack trace for reiser4?
>>>>> How to reproduce it?
>>>>
>>>> I'll rebuild the kernel without the fix and provide you with the
>>>> oops'
>>>> stacktrace asap.
>>>>
>>>> I guess that it's tied to the config. In my case, it is
>>>> reproducible on
>>>> each boot, just as the DE starts up and something issues the first
>>>> fsync().
>>>
>>>
>>> Yes, let's try to find the culprit who doesn't set i_wb...
>>
>> So, here are the traces I've got after adding an
>> assert(PageDirty(node->pg)) to queue_jnode():
>> /* captured by hand as these are panics, not oopses */
>>
>> 1.
>>
>> queue_jnode()
>> unformatted_make_reloc()
>> assign_real_blocknrs()
>> forward_relocate_unformatted()
>> forward_alloc_unformatted_journal()
>> ? coord_num_units()
>> handle_pos_on_twig()
>> flush_current_atom()
>> flush_some_atom()
>> reiser4_writeout()
>> reiser4_writeback_inodes()
>> <...>
>>
>> 2.
>>
>> znode_make_reloc()
>> forward_alloc_formatted_wa()
>> ? zload_ra()
>> allocate_znode()
>> alloc_pos_and_ancestors()
>> flush_current_atom()
>> reiser4_txn_end()
>> ? reiser4_txn_end()
>> reiser4_txn_restart_current()
>> force_commit_atom()
>> ? reiser4_txn_restart_current()
>> txnmgr_force_commit_all()
>> writepages_cryptcompress()
>> reiser4_writepages_dispatch()
>> <...>
>> sys_fsync()
>>
>
>
> Thanks Ivan.
> Not a good news, TBH...
>
> For formatted nodes we can continue to narrow down the problem
> (see the attached patch). For unformatted nodes only code review
> can help. Normally, all modifications of unformatted nodes should
> look like the following:
>
> struct page *page = jnode_page(node);
> lock_page(page);
> char *data = kmap(page);
> /* modifications are going here */
> kunmap(page);
> set_page_dirty_nobuffers(page); /* somebody forgets to do this */
> unlock_page(page);
>
> Modifications of formatted nodes should look like the following:
>
> longterm_lock_znode(node);
> zload(node);
> /* modifications are going here */
> zrelse(node);
> znode_make_dirty(node); /* somebody forgets to do this */
> longterm_unlock_znode();
>
I can easily reproduce these problems with
xfstests/generic/013,014,015,023,029.... and
reiser4-debug-formatted-make-dirty.patch
./check -s r4Hybrid -s r4ccHybrid -g quick

PLATFORM      -- Linux/i686 reiser4 4.2.1
MKFS_OPTIONS  -- /dev/hda7
MOUNT_OPTIONS -- -o noatime /dev/hda7 /mnt/scratch


A lot of following in logs:

Oct 10 11:10:28 reiser4 kernel: reiser4[kworker/u2:2(7908)]:
longterm_unlock_znode (fs/reiser4/lock.c:646)[]:
Oct 10 11:10:28 reiser4 kernel: WARNING: releasing last write-lock,
but page is fishily clean
Oct 10 11:10:28 reiser4 kernel: CPU: 0 PID: 7908 Comm: kworker/u2:2
Not tainted 4.2.1 #2
Oct 10 11:10:28 reiser4 kernel: Hardware name: System Manufacturer
System Name/A7V8X, BIOS ASUS A7V8X ACPI BIOS Revision 1014 04/21/2004
Oct 10 11:10:28 reiser4 kernel: Workqueue: writeback wb_workfn (flush-3:0)
Oct 10 11:10:28 reiser4 kernel: de846638 de846638 dc093c74 c135e99e
dc093cb0 c112b7c0 c1404058 dd0e2430
Oct 10 11:10:28 reiser4 kernel: 00001ee4 c1376238 c13fdd65 00000286
c13f52e3 c112eb83 00000000 d1bd9244
Oct 10 11:10:28 reiser4 kernel: de846600 c145166c dc093cd8 dc093d10
c1134cba 00000020 00000000 c113535b
Oct 10 11:10:28 reiser4 kernel: Call Trace:
Oct 10 11:10:28 reiser4 kernel: [<c135e99e>] dump_stack+0x16/0x18
Oct 10 11:10:28 reiser4 kernel: [<c112b7c0>] longterm_unlock_znode+0x1e0/0x200
Oct 10 11:10:28 reiser4 kernel: [<c112eb83>] ? coord_next_unit+0x63/0xd0
Oct 10 11:10:28 reiser4 kernel: [<c1134cba>] scan_unformatted+0x3ca/0x460
Oct 10 11:10:28 reiser4 kernel: [<c113535b>] ? flush_current_atom+0x4ab/0x920
Oct 10 11:10:28 reiser4 kernel: [<c1134e5c>] scan_common+0x10c/0x160
Oct 10 11:10:28 reiser4 kernel: [<c1135378>] flush_current_atom+0x4c8/0x920
Oct 10 11:10:28 reiser4 kernel: [<c1130d45>] ? atom_free+0x65/0x70
Oct 10 11:10:28 reiser4 kernel: [<c1150e2a>] ?
writepages_cryptcompress+0x11a/0x180
Oct 10 11:10:28 reiser4 kernel: [<c1131b66>] flush_some_atom+0xa6/0x260
Oct 10 11:10:28 reiser4 kernel: [<c1087a4b>] ? mapping_tagged+0xb/0x10
Oct 10 11:10:28 reiser4 kernel: [<c113de99>] reiser4_writeout+0x89/0x180
Oct 10 11:10:28 reiser4 kernel: [<c10d070e>] ?
generic_writeback_sb_inodes+0x18e/0x270
Oct 10 11:10:28 reiser4 kernel: [<c113ad74>] reiser4_writeback_inodes+0x64/0xf0
Oct 10 11:10:28 reiser4 kernel: [<c11a75eb>] ? fprop_fraction_percpu+0x2b/0x80
Oct 10 11:10:28 reiser4 kernel: [<c113ad10>] ? reiser4_show_options+0xa0/0xa0
Oct 10 11:10:28 reiser4 kernel: [<c10d086f>] writeback_sb_inodes+0x7f/0xa0
Oct 10 11:10:28 reiser4 kernel: [<c10d09c5>] wb_writeback+0x95/0x120
Oct 10 11:10:28 reiser4 kernel: [<c10d0b00>] wb_workfn+0xb0/0x2b0
Oct 10 11:10:28 reiser4 kernel: [<c1047630>] ? __dequeue_entity+0x20/0x40
Oct 10 11:10:28 reiser4 kernel: [<c1047901>] ? pick_next_task_fair+0xb1/0x130
Oct 10 11:10:28 reiser4 kernel: [<c103c671>] process_one_work+0xd1/0x290
Oct 10 11:10:28 reiser4 kernel: [<c103c916>] worker_thread+0xe6/0x3c0
Oct 10 11:10:28 reiser4 kernel: [<c103c830>] ? process_one_work+0x290/0x290
Oct 10 11:10:28 reiser4 kernel: [<c1040be5>] kthread+0x95/0xb0
Oct 10 11:10:28 reiser4 kernel: [<c1361e00>] ret_from_kernel_thread+0x20/0x30
Oct 10 11:10:28 reiser4 kernel: [<c1040b50>] ? __kthread_parkme+0x60/0x60
Oct 10 11:10:28 reiser4 kernel: reiser4[kworker/u2:2(7908)]:
longterm_unlock_znode (fs/reiser4/lock.c:646)[]:
Oct 10 11:10:28 reiser4 kernel: WARNING: releasing last write-lock,
but page is fishily clean
Oct 10 11:10:28 reiser4 kernel: CPU: 0 PID: 7908 Comm: kworker/u2:2
Not tainted 4.2.1 #2
Oct 10 11:10:28 reiser4 kernel: Hardware name: System Manufacturer
System Name/A7V8X, BIOS ASUS A7V8X ACPI BIOS Revision 1014 04/21/2004
Oct 10 11:10:28 reiser4 kernel: Workqueue: writeback wb_workfn (flush-3:0)
Oct 10 11:10:28 reiser4 kernel: dc093d80 dc093d80 dc093cec c135e99e
dc093d28 c112b7c0 c1404058 dd0e2430
Oct 10 11:10:28 reiser4 kernel: 00001ee4 c1376238 c13fdd65 00000286
c13f52e3 dc093d70 00000000 d1bd9244
Oct 10 11:10:28 reiser4 kernel: dc093dd4 de846600 d4c39460 dc093dac
c1135655 00000040 dc093d40 c1130d45
Oct 10 11:10:28 reiser4 kernel: Call Trace:
Oct 10 11:10:28 reiser4 kernel: [<c135e99e>] dump_stack+0x16/0x18
Oct 10 11:10:28 reiser4 kernel: [<c112b7c0>] longterm_unlock_znode+0x1e0/0x200
Oct 10 11:10:28 reiser4 kernel: [<c1135655>] flush_current_atom+0x7a5/0x920
Oct 10 11:10:28 reiser4 kernel: [<c1130d45>] ? atom_free+0x65/0x70
Oct 10 11:10:28 reiser4 kernel: [<c1131b66>] flush_some_atom+0xa6/0x260
Oct 10 11:10:28 reiser4 kernel: [<c1087a4b>] ? mapping_tagged+0xb/0x10
Oct 10 11:10:28 reiser4 kernel: [<c113de99>] reiser4_writeout+0x89/0x180
Oct 10 11:10:28 reiser4 kernel: [<c10d070e>] ?
generic_writeback_sb_inodes+0x18e/0x270
Oct 10 11:10:28 reiser4 kernel: [<c113ad74>] reiser4_writeback_inodes+0x64/0xf0
Oct 10 11:10:28 reiser4 kernel: [<c11a75eb>] ? fprop_fraction_percpu+0x2b/0x80
Oct 10 11:10:28 reiser4 kernel: [<c113ad10>] ? reiser4_show_options+0xa0/0xa0
Oct 10 11:10:28 reiser4 kernel: [<c10d086f>] writeback_sb_inodes+0x7f/0xa0
Oct 10 11:10:28 reiser4 kernel: [<c10d09c5>] wb_writeback+0x95/0x120
Oct 10 11:10:28 reiser4 kernel: [<c10d0b00>] wb_workfn+0xb0/0x2b0
Oct 10 11:10:28 reiser4 kernel: [<c1047630>] ? __dequeue_entity+0x20/0x40
Oct 10 11:10:28 reiser4 kernel: [<c1047901>] ? pick_next_task_fair+0xb1/0x130
Oct 10 11:10:28 reiser4 kernel: [<c103c671>] process_one_work+0xd1/0x290
Oct 10 11:10:28 reiser4 kernel: [<c103c916>] worker_thread+0xe6/0x3c0
Oct 10 11:10:28 reiser4 kernel: [<c103c830>] ? process_one_work+0x290/0x290
Oct 10 11:10:28 reiser4 kernel: [<c1040be5>] kthread+0x95/0xb0
Oct 10 11:10:28 reiser4 kernel: [<c1361e00>] ret_from_kernel_thread+0x20/0x30
Oct 10 11:10:28 reiser4 kernel: [<c1040b50>] ? __kthread_parkme+0x60/0x60
Oct 10 11:10:28 reiser4 kernel: reiser4[kworker/u2:2(7908)]:
longterm_unlock_znode (fs/reiser4/lock.c:646)[]:
Oct 10 11:10:28 reiser4 kernel: WARNING: releasing last write-lock,
but page is fishily clean
Oct 10 11:10:28 reiser4 kernel: CPU: 0 PID: 7908 Comm: kworker/u2:2
Not tainted 4.2.1 #2
Oct 10 11:10:28 reiser4 kernel: Hardware name: System Manufacturer
System Name/A7V8X, BIOS ASUS A7V8X ACPI BIOS Revision 1014 04/21/2004
Oct 10 11:10:28 reiser4 kernel: Workqueue: writeback wb_workfn (flush-3:0)
Oct 10 11:10:28 reiser4 kernel: de8466fc de8466fc dc093ce0 c135e99e
dc093d1c c112b7c0 c1404058 dd0e2430
Oct 10 11:10:28 reiser4 kernel: 00001ee4 c1376238 c13fdd65 00000286
c13f52e3 00000000 00000000 d1bd9244
Oct 10 11:10:28 reiser4 kernel: de8466e8 de846600 d4c39460 dc093d28
c1132e6b dc093dd4 dc093dac c11354ed
Oct 10 11:10:28 reiser4 kernel: Call Trace:
Oct 10 11:10:28 reiser4 kernel: [<c135e99e>] dump_stack+0x16/0x18
Oct 10 11:10:28 reiser4 kernel: [<c112b7c0>] longterm_unlock_znode+0x1e0/0x200
Oct 10 11:10:28 reiser4 kernel: [<c1132e6b>] pos_stop+0x1b/0x50
Oct 10 11:10:28 reiser4 kernel: [<c11354ed>] flush_current_atom+0x63d/0x920
Oct 10 11:10:28 reiser4 kernel: [<c1130d45>] ? atom_free+0x65/0x70
Oct 10 11:10:28 reiser4 kernel: [<c1131b66>] flush_some_atom+0xa6/0x260
Oct 10 11:10:28 reiser4 kernel: [<c1087a4b>] ? mapping_tagged+0xb/0x10
Oct 10 11:10:28 reiser4 kernel: [<c113de99>] reiser4_writeout+0x89/0x180
Oct 10 11:10:28 reiser4 kernel: [<c10d070e>] ?
generic_writeback_sb_inodes+0x18e/0x270
Oct 10 11:10:28 reiser4 kernel: [<c113ad74>] reiser4_writeback_inodes+0x64/0xf0
Oct 10 11:10:28 reiser4 kernel: [<c11a75eb>] ? fprop_fraction_percpu+0x2b/0x80
Oct 10 11:10:28 reiser4 kernel: [<c113ad10>] ? reiser4_show_options+0xa0/0xa0
Oct 10 11:10:28 reiser4 kernel: [<c10d086f>] writeback_sb_inodes+0x7f/0xa0
Oct 10 11:10:28 reiser4 kernel: [<c10d09c5>] wb_writeback+0x95/0x120
Oct 10 11:10:28 reiser4 kernel: [<c10d0b00>] wb_workfn+0xb0/0x2b0
Oct 10 11:10:28 reiser4 kernel: [<c1047630>] ? __dequeue_entity+0x20/0x40
Oct 10 11:10:28 reiser4 kernel: [<c1047901>] ? pick_next_task_fair+0xb1/0x130
Oct 10 11:10:28 reiser4 kernel: [<c103c671>] process_one_work+0xd1/0x290
Oct 10 11:10:28 reiser4 kernel: [<c103c916>] worker_thread+0xe6/0x3c0
Oct 10 11:10:28 reiser4 kernel: [<c103c830>] ? process_one_work+0x290/0x290
Oct 10 11:10:28 reiser4 kernel: [<c1040be5>] kthread+0x95/0xb0
Oct 10 11:10:28 reiser4 kernel: [<c1361e00>] ret_from_kernel_thread+0x20/0x30
Oct 10 11:10:28 reiser4 kernel: [<c1040b50>] ? __kthread_parkme+0x60/0x60


> Anyway, we can use your patch 3 as a temporal fixup.
>
> Thanks,
> Edward.
