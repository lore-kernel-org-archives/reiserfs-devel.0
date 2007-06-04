From: Edward Shishkin <edward@namesys.com>
Subject: Re: Filesystem corruption
Date: Mon, 04 Jun 2007 13:41:39 +0400
Message-ID: <4663DE53.6000509@namesys.com>
References: <160382.11806.qm@web31708.mail.mud.yahoo.com> <200705301503.15105.ninja@slaphack.com> <20070531001151.GA9933@efil.de> <4661F8ED.4070001@namesys.com> <20070604025528.GA19513@efil.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20070604025528.GA19513@efil.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Bormuth <ibormuth@efil.de>
Cc: reiserfs-list@namesys.com

Ingo Bormuth wrote:

>On 2007-06-03 03:10, Edward Shishkin wrote:
>  
>
>>Ingo Bormuth wrote:
>>    
>>
>>>Hm, same here. I lost /bin/sleep several times.
>>>      
>>>
>
>  
>
>>Would you please describe the problem in more details?
>>What kernel version? What does "I lost /bin/sleep" mean?
>>Does it mean that:
>>1. /bin/sleep was truncated to 0 bytes, i.e. "ls -l /bin/sleep" shows  
>>something like
>>-rwxr-xr-x  1 root root 0 2005-04-20 18:32 /bin/sleep
>>2. /bin/sleep disappeared ("ls -l /bin" doesn't show this file)
>>3. /bin/sleep exists, but filled by zeros
>>etc...
>>    
>>
>
>The file was removed by 'fsck.reiser4 --fix' which emmitted a
>message about deleting a corrupted file. (Case 2 in your list).
>
>This always happened after a system freeze or power loss.
>The machine freezes quite frequently - I think it has a DMA problem.
>Nevertheless I don't see how a file that was not written to can
>get corrupted.
>
>  
>

When performing mapping read (needed for execution, etc) reiser4 
converts small
files from tails to extents and back (your /bin/sleep is less then 4 * 
blocksize, right?)

>Current kernel is 2.6.20.5 (the reiser4 patch I submitted to this 
>list on may 2nd).
>  
>

Please, rebuild your kernel with the official patch
http://ftp.namesys.com/pub/reiser4-for-2.6/2.6.20/
It contains a bugfix related to tail conversion (races when acquiring 
exclusive access).

Please, report, if such data loss still takes place after upgrade.

Thanks,
Edward.

>Root is mounted rw,noatime,nodiratime,onerror=remount-ro,tmgr.atom_max_age=60
>
>Hope that helps.
>
>
>
>  
>

