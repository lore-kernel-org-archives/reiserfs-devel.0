From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: copying partition to partition, sector by sector, live
Date: Mon, 22 Apr 2002 17:40:14 -0700 (PDT)
Message-ID: <200204230040.RAA26796@sirius.cs.pdx.edu>
References: <20020422232841.GF8407@vega.ipal.net>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020422232841.GF8407@vega.ipal.net> from "Phil Howard" at Apr 22, 2002 06:28:41 PM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

> From: Phil Howard <phil-reiserfs@ipal.net>
> On Mon, Apr 22, 2002 at 02:58:34PM -0400, Chris Mason wrote:
> | Doing it safely will require something like lvm or evms snapshots.  You
> | could do the sector by sector copy and then run reiserfsck
> | --rebuild-tree.  The latest versions of reiserfsprogs are faster, the
> | speed relative to a search for updated files will depend on your data
> | set.
> | 
> | More importantly you just don't get a consistent copy, regardless of the
> | FS you choose.  I wouldn't consider a sector by sector copy on a mounted
> | FS a valid backup of any type of filesystem, especially not a tree based
> | one.

> But I'm starting to think that with reiserfs, I need to go back to rsync
> as the backup mechanism.  Some memory leak and stalling problems with rsync
> seem to be fixed, now.

More significantly there was a security problem fixed in January.


--
|\__/|\__/|\______          --=> 8-) EHM <=--          ______/|\__/|\__/|
\    |    |       | EHeM@cs.pdx.edu      PGP 8881EF59 |       |    |    /
  \   \   | ______| -O #include <stddisclaimer.h> O-  |______ |   /   /
    \___\_|/82 04 A1 3C C7 B1 37 2A   E3 6E 84 DA 97 4C 40 E6\|_/___/


