From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: core dump on reiserfsck --rebuildtree
Date: Mon, 22 Sep 2003 14:38:41 +0400
Message-ID: <200309221438.41949.vitaly@namesys.com>
References: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org> <200309200017.08396.vitaly@namesys.com> <200309221102.08476.alistair@inrevo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309221102.08476.alistair@inrevo.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alistair McDonald <alistair@inrevo.com>, reiserfs-list@namesys.com

> Thanks for your reply, Vitaly.
>
> I did as you asked, and have run several iterations of a memory tester, and
> also upgraded to the latest version of the tools.
>
> Here is the output in entirety:
> .pass0: block 1569971, item 2: The file [134430 134431] has the wrong mode
> (?---------), corrected to (----------)
> pass0: vpf-10430: block 3145649, item 4: Wrong order of items - change the
> dir_id of the key [145538 145539 0x1 DRCT (2)
> ] to 145516
> pass0: vpf-10560: block 3145649, item 4: Wrong order of items - change the
> object_id of the key [145516 145539 0x1 DRCT
> (2)] to 145518
> .20%.block 9010383: The number of items (16) is incorrect, should be (2) -
> corrected
> block 9010383: The free space (1) is incorrect, should be (4024) -
> corrected pass0: vpf-10130: block 9010383: item 0: Wrong key [61440 0
> 0xf001 SD (0)], corrected to [4063162594 14 0xf001 SD (0)]
> pass0: block 9010383, item 0: StatData item of wrong length found
> 4063162594 14 0x0 SD (0), len 0, location 4096 entry c
> ount 61440, fsck need 2, format BAD - deleted
> pass0: vpf-10110: block 9010383, item (0): Unknown item type found
> [4063162594 14 0x100 ??? (15)] - deleted
>
> bread: Cannot read the block (32085176): (Input/output error).
>
> Aborted (core dumped)
>
> Now, I've used the smartmon tools (http://smartmontools.sourceforge.net/)
> to do repeated test and the drives both seem fine. They are both around 1
> year old and have had only light use. Could this be an lvm problem? Any
> ideas where I should look next?

so it all looks like you have some problems with your hardware -- first of all 
on the second reiserfsck run you get a lot of errors -- it is not possible as 
pass0 already scanned through all blocks of your fs on the first run and fixed 
all problems. Before at pass1 you got strange error about not fixed corruption 
at pass0 -- you described in the first email. and now -- unreadable block. 
probably data on the way from harddrive to the memory get corrupted 
somehow -- you should test it all.

we provide the assistance with broken hardware in terms of our 
www.namesys.com/support.html page. 

> Can you offer any help on which tool to use to try to write to an
> individual block, as suggested by the output above?

dd.

-- 
Thanks,
Vitaly Fertman
