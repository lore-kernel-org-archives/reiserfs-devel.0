From: Yury Umanets <umka@namesys.com>
Subject: Re: Converter program from V3 to V4 ?
Date: Wed, 23 Apr 2003 22:24:51 +0400
Message-ID: <3EA6DA73.4020507@namesys.com>
References: <50020.61.238.161.206.1051113325.squirrel@sml.dyndns.org> <3EA6AB24.6070705@namesys.com> <3EA6D98F.8080907@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EA6D98F.8080907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Umanets <umka@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Thomas Graham <lkthomas@sml.dyndns.org>, reiserfs-list@namesys.com

Yury Umanets wrote:

> Hans Reiser wrote:
>
>> Thomas Graham wrote:
>>
>>> reiserfs 4 will be release soon, I got almost 90GB data on a HD that is
>>> using reiserfs3, how could I install v4 on this HD ? would it have a
>>> converter program to concert from V3 to V4 ? Thanks.
>>>
>>>
>>>  
>>>
>> The converter program is called tar.  Maybe someday we will write a 
>> script to resize partitions incrementally as we copy data from one 
>> partition to another....
>>
>> Remember that filesystems take many years to stabilize to where V3 is 
>> now, and V4 will be flaky when it first ships.  Every bug we know how 
>> to find will be fixed, but real users find bugs test suites don't.
>>
> There is the intersting approach called convertfs.
> http://tzukanov.narod.ru/convertfs/
>
>
=============================================================
convertfs v1.3
 
Convert filesystem on device from this type to this type.
 
Usage: convertfs device from_fs_type to_fs_type
 
Filesystem types: minix xfs jfs reiserfs ext2 ext3
 
Example: convertfs /dev/hda2 ext2 reiserfs
=============================================================
 


-- 
Yury Umanets
"We're flying high, we're watching the world passes by..."



