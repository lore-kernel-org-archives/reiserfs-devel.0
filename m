From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: 33 bad sectors kills 20GB
Date: Mon, 6 May 2002 08:54:22 -0400
Message-ID: <200205060854.22310.kuba@mareimbrium.org>
References: <Pine.LNX.4.44.0205032353051.25287-100000@mooru.gurulabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0205032353051.25287-100000@mooru.gurulabs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dax Kelson <dax@gurulabs.com>
Cc: reiserfs-list@namesys.com

On sobota 04 maj 2002 10:58 am, Dax Kelson wrote:
> This is a 20GB filesystem, used dd_rescue to make an image of the drive:
>
> Summary for /dev/hda3 -> hda3.img:
> dd_rescue: (info):
> ipos:  19711944.0k
> opos:  19711944.0k
> xferd:  19711944.0k
> errs:     33
> errxfer:        16.5k
> succxfer:  19711927.5k
> avg.rate:    11743kB/s
>
> I then ran reiserfsck on the image file:
>
> look_for_lost: 6 files seem to left not linked to lost+found
>         Objects without names 1377
>         Empty lost dirs removed 10
>         Dirs linked to /lost+found: 149
>                 Dirs without stat data found 5
>         Files linked to /lost+found 1228
> Pass 4 - done         left 298, 0 /sec
>         Deleted unreachable items 117
> Syncing..done
> Done
>
> (That took 3+ hours on a PIII 900, 512MB ram box)
>
> I mounted the image, and pretty much everything is gone.
>
> Is it normal for 33 bad sectors (16.5k) of data (out of 19711944k) to
> completely kill the fs?
>
> Would I have better luck if I used the -A option on dd_rescue?
>
> "        -A         Always write blocks, zeroed if err (def=no);"

What you did without using -A is following:

fs with errors:

xxxxxpxxxxxxxxxxxxbbxxxxxxxxxxxxxxx

after dd:

xxxxxpxxxxxxxxxxxxxxxxxxxxxxxxxxx--

Now assume that p is a pointer in the fs data structures that pointed to the 
last block (the last x). Now it points nowhere.

You have reorganized your filesystem without updating all the pointers there 
are in the metadata. Nothing is going to rescue that wreck,  lest some 
by-hand hexediting.

You *absolutely* need to use -A. Or at least that's how I understand things.

You may also need to do reiserfsck with rebuild-tree, although try without it 
first. I hope you have the latest version of reiserfstools -- if not, you 
*have* to get the latest one.

Cheers, Kuba
