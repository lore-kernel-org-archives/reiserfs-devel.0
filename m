From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 corruptions
Date: Mon, 16 Aug 2004 19:57:32 +0400
Message-ID: <200408161957.32633.vitaly@namesys.com>
References: <1092670830.21541.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092670830.21541.6.camel@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: redeeman@metanurb.dk, Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Monday 16 August 2004 19:40, Redeeman wrote:
> hi,
> i just lost my power to my box, and when it booted agian, i figured i
> might aswell now convert to the new layout, so i unmounted /mnt/reiser4,
> installed libaal and reiser4progs 1.0.0
> then i ran debugfs.reiser4 -C /dev/hdb1
> and it gave me this output:
>
> root@redeeman redeeman # debugfs.reiser4 -C /dev/hdb1
> debugfs.reiser4 1.0.0
> Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed
> by reiser4progs/COPYING.
>
> Relocating the extent region[130945..130984]: node 127718, item 0, unit
> 82.
> Relocating the extent region[294625..295020]: node 259056, item 26, unit
> 1.
> Relocating the extent region[458305..464682]: node 259058, item 28, unit
> 1.
> Relocating the extent region[687457..688159]: node 259061, item 64, unit
> 1.
> Relocating the extent region[1047553..1048691]: node 259063, item 15,
> unit 1.
> Relocating the extent region[1571329..1571356]: node 1574387, item 12,
> unit 1.
> Relocating the extent region[65473..66857]: node 60153, item 36, unit 2.
> Relocating the extent region[196417..205836]: node 179416, item 74, unit
> 1.
> Relocating the extent region[2356993..2357354]: node 2369466, item 63,
> unit 1.
> Relocating the extent region[22..22]: node 975295, item 22, unit 0.
>
>
> and i figured that was fine, then i went to do:
> fsck.reiser4 /dev/hdb1, and this is where i get alot corruptions.

as I can see all corruptions are about wrong bytes in statdatas, nothing to 
worry about. it was fixed 2004.08.05.

> my kernel is 2.6.8-rc4-mm1, and i use the 13 snapshot.

probably these files were created before you moved to this snapshot.

> i havent mounted the partition yet, i also havent run fsck with --fix
> yet, i figured i would wait to see what you ppl said.
> also, is it possible to find out which files this affects?

for statdatas if the key is [bd6c3a:172706d2d342e30:bd6c40], 
bd6c40 is the inode number. bd6c3a is the parent inode number.

> http://kaspersandberg.com/~redeeman/reiser4_msg
> there is the fsck.reiser4 output

-- 
Thanks,
Vitaly Fertman

