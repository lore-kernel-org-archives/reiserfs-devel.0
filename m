From: Hans Reiser <reiser@namesys.com>
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output
 error
Date: Wed, 04 Aug 2004 10:38:52 -0700
Message-ID: <41111F2C.6090805@namesys.com>
References: <20040804141752.E344D15D07@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804141752.E344D15D07@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: "'Vladimir V. Saveliev'" <vs@namesys.com>, reiserfs-list@namesys.com

Please do whatever you can to reproduce this.  We are going to delay 
release by one day to see if it can be reproduced.  Vs thinks it might 
be a hardware problem, I am not so optimistic, what are your thoughts?

Hans

David Dabbs wrote:

>This is different from the mount issue, which was fixed by the new code
>drop. This was built with 8k stacks.
>
>David
>
>
>  
>
>>-----Original Message-----
>>From: Hans Reiser [mailto:reiser@namesys.com]
>>Sent: Wednesday, August 04, 2004 3:59 AM
>>To: Vladimir V. Saveliev
>>Cc: David Dabbs; reiserfs-list@namesys.com
>>Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92':
>>Input/output error
>>
>>Vladimir V. Saveliev wrote:
>>
>>    
>>
>>>Hello
>>>
>>>Hans Reiser wrote:
>>>
>>>      
>>>
>>>>David Dabbs wrote:
>>>>
>>>>        
>>>>
>>>>>I was running mongo when the following occurred:
>>>>>
>>>>>cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
>>>>>cp: cannot stat `/mnt/testfs/testdir0-0-0/f93': Input/output error
>>>>>cp: cannot stat `/mnt/testfs/testdir0-0-0/f94': Input/output error
>>>>>cp: cannot stat `/mnt/testfs/testdir0-0-0/f95': Input/output error
>>>>>cp: cannot stat `/mnt/testfs/testdir0-0-0/f97': Input/output error
>>>>>
>>>>>
>>>>>I found the following in the log:
>>>>>
>>>>>Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:59 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: key_warning
>>>>>(fs/reiser4/plugin/object.c:97)[nikita-717]:
>>>>>Aug  3 21:59:59 linux kernel: WARNING: Error for inode 661097 (-5)
>>>>>Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]:
>>>>>write_sd_by_inode_common
>>>>>(fs/reiser4/plugin/object.c:480)[nikita-2221]:
>>>>>Aug  3 21:59:59 linux kernel: WARNING: Failed to save sd for 661097: -
>>>>>          
>>>>>
>>5
>>    
>>
>>>>>Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: create_child_common
>>>>>(fs/reiser4/plugin/dir/dir.c:499)[nikita-2219]:
>>>>>Aug  3 21:59:59 linux kernel: WARNING: Failed to create sd for 661097
>>>>>Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>>>>>(fs/reiser4/search.c:1033)[vs-3533]:
>>>>>Aug  3 21:59:59 linux kernel: WARNING: Keys are inconsistent. Fsck?
>>>>>Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: key_warning
>>>>>
>>>>>I had been switching back and forth between computers via a kvm
>>>>>switch. I
>>>>>attempted to reproduce the error by rerunning the benchmark and
>>>>>figddling
>>>>>with the switch, but was not able to see the same behavior.
>>>>>
>>>>>Running with latest auto-snapshot and reiser4fsprogs.
>>>>>
>>>>>David
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>          
>>>>>
>>>>Well, it seems you found a bug just as we were about to ship.   Sigh.
>>>>
>>>>
>>>>        
>>>>
>>>Hans, should we solve this before sending reiser4 to Andrew?
>>>
>>>
>>>
>>>
>>>
>>>      
>>>
>>If it is due to 4k stacks, then find a way to ensure that use of reiser4
>>turns off 4k stacks before sending to Andrew.
>>
>>Hans
>>    
>>
>
>
>
>  
>

