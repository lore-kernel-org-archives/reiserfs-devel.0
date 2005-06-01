From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfsck 1300Gig failed with following error
Date: Wed, 1 Jun 2005 14:06:56 +0400
Message-ID: <200506011406.57415.vitaly@namesys.com>
References: <1117392967.29669.ezmlm@namesys.com> <429C7E46.9090507@teleformix.com> <429D5A16.5030701@mh.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429D5A16.5030701@mh.be>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Matthias Barremaecker <info@mh.be>, Dan Oglesby <doglesby@teleformix.com>, Valdis.Kletnieks@vt.edu

On Wednesday 01 June 2005 10:47, Matthias Barremaecker wrote:
> Hi,
> 
> using reiserfsprogs-3.6.19
> 
> Here is the error and messages : ...
> 
> 
> 2 directory entries were hashed with not set hash.
> 731305 directory entries were hashed with "r5" hash.
>          "r5" hash is selected
> Flushing..finished
>          Read blocks (but not data blocks) 313507947
>                  Leaves among those 439626
>                          - corrected leaves 46
>                          - leaves all contents of which could not be 
> saved and deleted 56
>                  pointers in indirect items to wrong area 3997 (zeroed)
>                  Objectids found 731997
> 
> Pass 1 (will try to insert 439570 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%....40%pass1.c 212 balance_condition_2_fails
> balance_condition_2_fails: block 1288402, pointer 168: The left 
> delimiting key [1412453424 1412453424 0x10001000 ??? (15)] of the block 
> (170046457) is wrong,the item cannot be found

the key (which is in the tree already and supposed to be correct) is 
completely corrupted, no one key component is correct. data could be 
corrupted in the memory or on read/write -- bad cable, controller, 
dying harddrive, etc. 

> 
> Anyone any suggestions ?

running fsck with the list of bad blocks is useful when you have the 
known fixed number of bad blocks, you know that the number will not 
change soon, in other words other blocks are relable. 

first of all you even have not complete badblocks run, so you cannot 
be sure you know the full bad block list. 

and the second, if your hardware is dying you need to fix it before 
running fsck on it.

-- 
Thanks,
Vitaly Fertman
