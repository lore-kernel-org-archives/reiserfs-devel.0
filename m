From: Hans Reiser <reiser@namesys.com>
Subject: Re: disk failure
Date: Mon, 28 Apr 2003 16:43:44 +0400
Message-ID: <3EAD2200.7000203@namesys.com>
References: <web-2465822@elet.polimi.it> <200304281421.57850.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13858-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304281421.57850.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Vincenzo Martena <martena@elet.polimi.it>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>Hi, 
>
>  
>
>>bread: Cannot read a block # 218118.
>>
>>Aborted
>>-------------------------------------------------------------------------
>>
>>Now the problem is that I cannot acces my hard disk,
>>because the journal is totally absent. Do you know if
>>there is some option I can give to reiserfsck in order to
>>ignore the hardware error and keep rebuilding the tree?
>>    
>>
>
>we are still working on badblock support in reiserfs, but it 
>is not finished yet. So if your partition has some badblocks
>you should dd_rescue this partition to some spare partition 
>and fsck the copy. 
>
>Alternatively, you can try to write to this block with dd, then 
>the drive will probably remap this block and it will disappear.
>
Can you have the tool you write prompt the user, ask if the user would 
like that attempted, and if it works then inform the user that it worked?

>
>If you need more details you can either look through reiserfs-list
>mail archive or pay us for the support on the base of our 
>support.html terms.
>
>  
>
>>Thanks a lot for your help.
>>
>>Vinxe
>>
>>P.S. reiserfsck version is:
>>
>><-------------reiserfsck, 2002------------->
>>reiserfsprogs 3.6.3
>>    
>>
>
>This is an old version of reiserfsprogs, get the latest one from 
>our ftp site please.
>
>  
>


-- 
Hans


