From: David Bernick <bernz@bernztech.org>
Subject: Re: incomplete fsck
Date: Thu, 15 Jan 2004 15:59:19 -0500
Message-ID: <4006FF27.4090701@bernztech.org>
References: <4005985C.5080509@bernztech.org> <200401142329.46801.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401142329.46801.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:
> Hello David, 
> 
> On Wednesday 14 January 2004 22:28, David Bernick wrote:
> 
>>I'm using kernel 2.4.23 and reiserfsck 3.6.11.
>>
>>I'm doing a --rebuild-tree. After pass0 i get this error. Why could this
>>be?
>>
>>2 directory entries were hashed with not set hash.
>>6449077 directory entries were hashed with "r5" hash.
>>         "r5" hash is selected
>>Flushing..finished
>>         Read blocks (but not data blocks) 122328324
>>                 Leaves among those 344205
>>                         - corrected leaves 249
>>                         - leaves all contents of which could not be saved
>>and deleted 5
>>                 pointers in indirect items to wrong area 1536 (zeroed)
>>                 Objectids found 6449102
>>
>>Pass 1 (will try to insert 344200 leaves):
>>####### Pass 1 #######
>>Looking for allocable blocks .. finished
>>0%pass1.c 408 pass1_correct_leaf                         left 342029, 1085
>>/sec pass1_correct_leaf: block 1733582, item 36, pointer 0: The wrong
>>pointer (1395601712) in the file [7068 52052]. Must be fixed on pass0.
>>Aborted

Ifigured out what went wrong. The machine was a RAID5 and one of the disks had 
bad blocks. I figured out which disk it was by just scanning each device 
individually. I swapped the disk out and all was good.

Now i'm running the rebuild-tree and it's already on pass3, which is far further 
than before. thanks for all your help!

d


-- 
David Bernick
bernz@bernztech.org

cretin /kret'in/ or /kree'tn/ n.

  Congenital loser;
    an obnoxious person; someone who can't do anything right.  It has
    been observed that many American hackers tend to favor the British
    pronunciation /kret'in/ over standard American /kree'tn/; it is
    thought this may be due to the insidious phonetic influence of
    Monty Python's Flying Circus.


