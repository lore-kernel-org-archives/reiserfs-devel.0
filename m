From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output
 error
Date: Wed, 04 Aug 2004 12:51:26 +0400
Message-ID: <4110A38E.6070905@namesys.com>
References: <20040804065840.17C7915C7C@mail03.powweb.com> <4110A0FA.3030007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4110A0FA.3030007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

Hello

Hans Reiser wrote:
> David Dabbs wrote:
> 
>> I was running mongo when the following occurred:
>>
>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f92': Input/output error
>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f93': Input/output error
>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f94': Input/output error
>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f95': Input/output error
>> cp: cannot stat `/mnt/testfs/testdir0-0-0/f97': Input/output error
>>
>>
>> I found the following in the log:
>>
>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:58 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:58 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:59 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: key_warning
>> (fs/reiser4/plugin/object.c:97)[nikita-717]:
>> Aug  3 21:59:59 linux kernel: WARNING: Error for inode 661097 (-5)
>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: 
>> write_sd_by_inode_common
>> (fs/reiser4/plugin/object.c:480)[nikita-2221]:
>> Aug  3 21:59:59 linux kernel: WARNING: Failed to save sd for 661097: -5
>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: create_child_common
>> (fs/reiser4/plugin/dir/dir.c:499)[nikita-2219]:
>> Aug  3 21:59:59 linux kernel: WARNING: Failed to create sd for 661097
>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: cbk_level_lookup
>> (fs/reiser4/search.c:1033)[vs-3533]:
>> Aug  3 21:59:59 linux kernel: WARNING: Keys are inconsistent. Fsck?
>> Aug  3 21:59:59 linux kernel: reiser4[cp(10066)]: key_warning
>>
>> I had been switching back and forth between computers via a kvm switch. I
>> attempted to reproduce the error by rerunning the benchmark and figddling
>> with the switch, but was not able to see the same behavior.
>>
>> Running with latest auto-snapshot and reiser4fsprogs.
>>
>> David
>>
>>
>>
>>
>>  
>>
> Well, it seems you found a bug just as we were about to ship.   Sigh.
> 
> 

Hans, should we solve this before sending reiser4 to Andrew?



