From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Sat, 17 Aug 2002 02:54:48 +0200
Message-ID: <200208170254.48383.degerrit@web.de>
References: <200208152007.42370.degerrit@web.de> <200208152329.40707.degerrit@web.de> <200208161205.00550.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208161205.00550.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hi again,

I skimmed over the bad-block-handling page but it's not very clear what you=
=20
should do if a filesystem already exists, as is obviously the case with me.=
=20
Are these badblock patches in the newer kernels, by the way?

Anyway, my first instinct told me to try Maxtor's 'Powermax' tool, and lo a=
nd=20
behold the 'Advanced Test' here found errors, and 'fixed' them, whatever th=
at=20
means. (Can you believe these guys make you download a 3MB Windows executab=
le=20
in order to write a 1.44Mb floppy image which is less than half full?? I ha=
d=20
to bloody install Windows for this... grr....)

Anyway, this time 'reiserfsck --rebuild-tree' finished successfully, and I =
was=20
able to see my filesystem for the first time in 2 days and many hours of=20
sweating.=20
Here's the pretty impressive summary of errors:

Pass 0:
Loading on-disk bitmap .. ok, 12812325 blocks marked used
Skipping 8749 blocks (super block, journal, bitmaps) 12803576 blocks will b=
e=20
read
=2E..
        "r5" hash is selected
=46lushing..done
        Read blocks (but not data blocks) 12803576
                Leaves among those 86209
                        - corrected leaves 1
                Objectids found 382476

Pass 1 (will try to insert 86209 leaves):
Looking for allocable blocks .. ok
=2E..
=46lushing..done
        Leaves inserted item by item 170
Pass 3 (semantic):
####### Pass 0 #######
pass0: vpf-10420: block 983630, item (61), make 4459536 4462153 0x1 IND (1)=
=20
fixed to DIRECT
"r5" got 382518 hits
####### Pass 1 #######
is_leaf_bad: block 983630L 60-th item (4459536 4462153 0x1 IND (1), len 28,=
=20
location 1792 entry count 0, fsck need 0, format new) and the next
 one (4459536 4462153 0x7001 IND (1), len 280, location 1512 entry count=20
65535, fsck need 0, format new) are in wrong order
pass1: (is_leaf_bad) bad leaf (983630)
####### Pass 2 #######
=2E..
=46lushing..done
        Objects without names 185
        Empty lost dirs removed 602
        Dirs linked to /lost+found: 12
                Dirs without stat data found 60
        Files linked to /lost+found 161
        Objects having used objectids: 10
                files fixed 66
                dirs fixed 3
Pass 4
Deleted unreachable items 5
=46lushing..done
Syncing..done
###########
reiserfsck finished at Sat Aug 17 02:20:46 2002

I think I will spend the next week working out a better backup solution...

Will Reiserfs4 have better bad block handling than this? When I see all the=
=20
trouble involved in rescuing this filesystem, as much as I'm impressed with=
=20
it I would think twice about using Reiserfs on any non-redundant (and=20
certainly IDE) disks from now on. I hope I don't make any enemies by saying=
=20
so.

Cheers, and thanks for all your help, especially Vitaly!

=2D Gerrit

