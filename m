From: Hans Reiser <reiser@namesys.com>
Subject: Re: Undeleting a whole reiserfs partition
Date: Sat, 10 Aug 2002 14:29:58 +0400
Message-ID: <3D54EB26.4070100@namesys.com>
References: <200208101127.54321.zephod@chello.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: zephod@chello.be
Cc: Ramon Reiser <ramon@namesys.com>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

zephod (by way of zephod ) wrote:

>>Yesterday, by error, a 'rm -fr' slipped through to my /music partition,
>>a 20GB reiserfs which was at arounf 85% full. SInce then no other
>>activity took place on it. Is there any easy way to recover my files?
>>
>>In the docs, it says you cannot undelete files in reiserfs partitions,
>>since what you delete is most probable overwritten by the next comitted
>>data. 
>>
Where does it say that?  It needs correcting.....

>>In my case, there has been no additional modification of the
>>partition, though.
>>    
>>
>
>Today I did exactly the same thing (on a 3.9 GB partition though). I could
>have killed myself for doing it!
>
>I first backed up the partition just to be safe:
>
>   dd if=/dev/hdsomething of=backupfie
>   losetup /dev/loop5 backupfile
>
>then I tried:
>
>   reiserfsck --rebuild-tree --scan-whole-partition /dev/loop5
>   mount /dev/loop5 <mountpoint>
>
>and what do you know! All my deleted stuff reappeared. As we speak I am
>restoring now the original partition.
>
>I guess this only worked because immediatly unmounted the partition after my
>unfortunate error to prevent writing new nodes and data.
>
>Also: Making backups of your data is never wasted time nor a waste of CD's
> and it is better for your nervous system too (I think this cost me another
> year of my life ;) )
>
>Hope this works out for you,
>
>Z.
>
>
>
>
>  
>


-- 
Hans



