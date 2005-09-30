From: Dan Oglesby <doglesby@teleformix.com>
Subject: Re: reiser4 for 2.6.13 is available on our website
Date: Fri, 30 Sep 2005 00:02:50 -0500
Message-ID: <433CC6FA.1050001@teleformix.com>
References: <433C23A2.9020403@namesys.com> <op.sxvmrokbd4os1z@localhost>	 <1128031794.10856.155.camel@gentoo> <433C6B7E.40201@namesys.com> <e692861c050929162314ffcc7c@mail.gmail.com> <433CAA2F.2030708@teleformix.com> <433CAAEF.2050700@teleformix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433CAAEF.2050700@teleformix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dan Oglesby wrote:

> Dan Oglesby wrote:
>
>> Gregory Maxwell wrote:
>>
>>> On 9/29/05, Hans Reiser <reiser@namesys.com> wrote:
>>>  
>>>
>>>> It works on non-amd64, will fix amd64 tomorrow I hope.
>>>>   
>>>
>>>
>>>
>>> No, it fails on FC4/x86 here to complie as well, with the same 
>>> failure mode.
>>>
>>>  
>>>
>> Errors from my vanilla 2.6.13.1 kernel + ReiserFS4 patch compile 
>> tonight:
>>
>> fs/reiser4/super_ops.c: In function `reiser4_dirty_inode':
>> fs/reiser4/super_ops.c:176: warning: long long unsigned int format, 
>> oid_t arg (arg 2)
>>
>> fs/reiser4/plugin/file_ops_readdir.c: In function `readdir_common':
>> fs/reiser4/plugin/file_ops_readdir.c:635: warning: long long unsigned 
>> int format, oid_t arg (arg 2)
>>
>> fs/reiser4/plugin/file/file.c: In function `delete_object_unix_file':
>> fs/reiser4/plugin/file/file.c:2991: warning: long long unsigned int 
>> format, oid_t arg (arg 2)
>>
>> fs/reiser4/plugin/dir_plugin_common.c: In function `rem_entry':
>> fs/reiser4/plugin/dir_plugin_common.c:207: warning: long long 
>> unsigned int format, oid_t arg (arg 2)
>>
>> fs/reiser4/plugin/space/bitmap.c: In function `bnode_check_adler32':
>> fs/reiser4/plugin/space/bitmap.c:506: warning: long long unsigned int 
>> format, bmap_nr_t arg (arg 2)
>>
>> Compile finished with no other ReiserFS related errors.
>>
>> This was during a stage 1 install on Gentoo 2005.1 on a Sun Ultra II 
>> workstation (dual processor, 64-bit).
>>
>> # gcc --version
>> gcc (GCC) 3.3.5-20050130 (Gentoo 3.3.5.20050130-r1, 
>> ssp-3.3.5.20050130-1, pie-8.7.7.1)
>>
>> Are the failed compiles all on machines running GCC 4.0?
>>
>> --Dan
>
>
>
> Nevermind, I just saw Jake's email (failed on gcc 3.4.4).
>
> --Dan
>
 From my Slackware 10.2 x86 system tonight:

In file included from fs/reiser4/lock.h:15,
                 from fs/reiser4/context.h:14,
                 from fs/reiser4/debug.c:25:
fs/reiser4/txnmgr.h: In function `spin_atom_init':
fs/reiser4/txnmgr.h:512: error: duplicate case value
fs/reiser4/txnmgr.h:512: error: previously used here
fs/reiser4/txnmgr.h: In function `spin_txnh_init':
fs/reiser4/txnmgr.h:513: error: duplicate case value
fs/reiser4/txnmgr.h:513: error: previously used here
fs/reiser4/txnmgr.h: In function `spin_txnmgr_init':
fs/reiser4/txnmgr.h:514: error: duplicate case value
fs/reiser4/txnmgr.h:514: error: previously used here
In file included from fs/reiser4/context.h:14,
                 from fs/reiser4/debug.c:25:
fs/reiser4/lock.h: In function `spin_stack_init':
fs/reiser4/lock.h:198: error: duplicate case value
fs/reiser4/lock.h:198: error: previously used here
In file included from fs/reiser4/znode.h:16,
                 from fs/reiser4/tree.h:15,
                 from fs/reiser4/super.h:9,
                 from fs/reiser4/debug.c:26:
fs/reiser4/jnode.h: In function `spin_jnode_init':
fs/reiser4/jnode.h:344: error: duplicate case value
fs/reiser4/jnode.h:344: error: previously used here
fs/reiser4/jnode.h: In function `spin_jload_init':
fs/reiser4/jnode.h:348: error: duplicate case value
fs/reiser4/jnode.h:348: error: previously used here
In file included from fs/reiser4/super.h:9,
                 from fs/reiser4/debug.c:26:
fs/reiser4/tree.h: In function `spin_epoch_init':
fs/reiser4/tree.h:169: error: duplicate case value
fs/reiser4/tree.h:169: error: previously used here
In file included from fs/reiser4/debug.c:26:
fs/reiser4/super.h: In function `spin_super_init':
fs/reiser4/super.h:379: error: duplicate case value
fs/reiser4/super.h:379: error: previously used here
make[2]: *** [fs/reiser4/debug.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

# gcc --version
gcc (GCC) 3.3.6

Same copy of the 2.6.13.1 kernel source and patch as the compile I did 
on the Gentoo machine tonight.

--Dan
