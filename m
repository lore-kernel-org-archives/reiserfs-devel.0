From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: Fwd: Re: [reiserfs-list] Reserved Blocks
Date: Mon, 16 Sep 2002 15:26:40 -0700 (PDT)
Message-ID: <200209162226.g8GMQeZU026796@sirius.cs.pdx.edu>
References: <200209161729.19198.bofh@coker.com.au>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200209161729.19198.bofh@coker.com.au> from "Russell Coker" at Sep 16, 2002 05:29:19 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> From: Russell Coker <russell@coker.com.au>
> On Mon, 16 Sep 2002 16:50, Valdis.Kletnieks@vt.edu wrote:
> > Among other things, if there's a world-writable directory on the same
> > filesystem, you get exposed to a whole raft of hard-link attacks that
> > simply Wont Work if (for example) /tmp is a separate filesystem.  You'd
> 
> Solar Designer's OpenWall kernel patch addresses this issue by prohibiting
> hard links to files with a different UID being created in a directory that
> has the sticky bit set.  http://www.openwall.com/linux/
> 
> OpenWall is ported to the recent 2.4.x kernels and some 2.5.x kernels in the
> form of the Linux Security Modules (LSM) kernel patch.
> http://lsm.immunix.org/

There is also the fuller and more current GRSecurity patch
http://www.grsecurity.net/ (originally I'd been using OW, but it wasn't
available for 2.4 when I was switching).

GRSec includes making the return of fork() be somewhat random value
rather than simply incrementing, and making source ports be allocated
somewhat randomly too (both of these features were stolen from OpenBSD).
They're kind of a jumbo combination of a couple Good Thing(tm) patches.


-- 
|\__/|\__/|\______          --=> 8-) EHM <=--          ______/|\__/|\__/|
\    |    |       | EHeM@cs.pdx.edu      PGP 8881EF59 |       |    |    /
  \   \   | ______| -O #include <stddisclaimer.h> O-  |______ |   /   /
    \___\_|/82 04 A1 3C C7 B1 37 2A   E3 6E 84 DA 97 4C 40 E6\|_/___/


