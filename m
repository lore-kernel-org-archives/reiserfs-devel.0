From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupt reiser3 fs
Date: Mon, 13 Jun 2005 11:08:42 -0700
Message-ID: <42ADCBAA.603@namesys.com>
References: <42AB68F2.8030904@gear.dyndns.org> <200506131346.23587.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506131346.23587.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com, Paul Gear <paul@gear.dyndns.org>

Vitaly Fertman wrote:

>On Sunday 12 June 2005 02:42, Paul Gear wrote:
>  
>
>>Hi folks,
>>
>>After filling my reiserfs with backups, i ended up with a corrupt
>>filesystem.  I'm running Debian 3.1 (sarge), kernel 2.6.8-2-k7, and
>>reiserfsprogs 3.6.19-1.
>>
>>I don't care about this filesystem and will just recreate it, but i
>>thought i'd offer folks the opportunity to debug before i trash it.
>>
>>Here's my fsck output with all the noise cut out:
>>
>>---------8<----------------------------------------
>>
>>enoch:/tmp # fsck.reiserfs --rebuild-tree /dev/hdc1
>>...
>>111392 directory entries were hashed with "r5" hash.
>>        "r5" hash is selected
>>Flushing..finished
>>        Read blocks (but not data blocks) 19333032
>>                Leaves among those 32365
>>                        - corrected leaves 35
>>                        - leaves all contents of which could not be
>>saved and deleted 5
>>                pointers in indirect items to wrong area 25647 (zeroed)
>>                Objectids found 104921
>>
>>Pass 1 (will try to insert 32360 leaves):
>>####### Pass 1 #######
>>Looking for allocable blocks .. finished
>>0%....20%....40%....60%...                                  left 8239,
>>234 /sec
>>The problem has occurred looks like a hardware problem (perhaps
>>memory). Send us the bug report only if the second run dies at
>>the same place with the same block number.
>>
>>build_the_tree: Nothing but leaves are expected. Block 10905053 - unknown
>>    
>>
Please improve this error message if you can.

>
>does it stop every time on the block 10905053 ?
> 
>  
>
>>There is no problem with memory (my other two hard disks and all of my
>>desktop programs are working fine), or, to my knowledge, the hard disk
>>or cable (since i can do a full dd of the hard disk to /dev/null).
>>
>>Anyone interested in taking a look at it, or should i just write it off
>>as stray gamma rays from Saturn and trash it?  :-)
>>
>>    
>>
>
>  
>

