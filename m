From: Dax Kelson <dax@gurulabs.com>
Subject: 33 bad sectors kills 20GB
Date: Sat, 4 May 2002 08:58:22 -0600 (MDT)
Message-ID: <Pine.LNX.4.44.0205032353051.25287-100000@mooru.gurulabs.com>
References: <Pine.LNX.4.44.0205032307120.25287-100000@mooru.gurulabs.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0205032307120.25287-100000@mooru.gurulabs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>


This is a 20GB filesystem, used dd_rescue to make an image of the drive:

Summary for /dev/hda3 -> hda3.img:
dd_rescue: (info): 
ipos:  19711944.0k
opos:  19711944.0k
xferd:  19711944.0k
errs:     33
errxfer:        16.5k
succxfer:  19711927.5k
avg.rate:    11743kB/s

I then ran reiserfsck on the image file:

look_for_lost: 6 files seem to left not linked to lost+found
        Objects without names 1377
        Empty lost dirs removed 10
        Dirs linked to /lost+found: 149
                Dirs without stat data found 5
        Files linked to /lost+found 1228
Pass 4 - done         left 298, 0 /sec
        Deleted unreachable items 117
Syncing..done
Done

(That took 3+ hours on a PIII 900, 512MB ram box)

I mounted the image, and pretty much everything is gone.  

Is it normal for 33 bad sectors (16.5k) of data (out of 19711944k) to 
completely kill the fs?

Would I have better luck if I used the -A option on dd_rescue?

"        -A         Always write blocks, zeroed if err (def=no);"

Any suggestions greatly appreciated.

Dax Kelson
Guru Labs


