From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: Silly question, defrag
Date: Wed, 3 Apr 2002 21:19:22 -0800 (PST)
Message-ID: <200204040519.VAA14445@sirius.cs.pdx.edu>
References: <3CAC3C22.30357.D03D9F@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CAC3C22.30357.D03D9F@localhost> from "rod@tpgi.com.au" at Apr 04, 2002 11:42:26 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rod@tpgi.com.au
Cc: reiserfs-list@namesys.com

> From: rod@tpgi.com.au
> 
> <snip>
> 
> > I have to wonder about your motives here, Hans. You are the one who stands
> > to gain by capitalizing on newbie Unix/Linux users misunderstanding of
> > filesystems based on their experience with DOS and Windows and here you
> > are promoting defrag as a feature which puts your FS above others. They
> > have learned to compulsively defrag their disks once a week and you are
> > looking to feed their addiction. I think reiserfs is really great and a
> > defrag/repacker will be nice but the above strikes me as a bit strange.
> > How long has ext2 been around as the stock Linux filesystem?  More than
> > long enough for people to have realized whether a defragger would be
> > useful. Yet I can't think of a single distribution (of Linux or Unix in
> > general) that comes with a defragger. Stephen Tweedie wrote one for it but
> > nobody bothers to use it or even to include it with their distro.

> This leaves the the only option to defrag once the file has been 
> completed OR at some user defined interval. Some fs may try to 
> reduce the incidence of this but cant prevent it happening. 

True. Some of the measures that are taken can be quite effective.
Reserving 10% overhead which only root is allowed to write in is
extremely effective with SunOS's flavor of UFS.

> Currently the only way to defrag an ext2 fs (or reiserfs) is a copy 
> off, mke2fs and copy back cycle - hardly ideal.  BTW if you are 
> interested in scripts that capable of totally framenting an ext2 
> partition (as reported by chke2fs and demonstrated by timing a  
> grep) and also a discussion of the problem - check the archives.

Not true, there is a e2defrag out there. Now, e2defrag will defragment a
filesystem, however the problem is that it greatly promotes future
fragmentation (got to maybe 2% fragmentation after months of use, but
within a week of running e2defrag it hit 8% fragmentation). I must
theorize that it packs files tightly rather than using the headroom
leading to the effect seen.


--
|\__/|\__/|\______          --=> 8-) EHM <=--          ______/|\__/|\__/|
\    |    |       | EHeM@cs.pdx.edu      PGP 8881EF59 |       |    |    /
  \   \   | ______| -O #include <stddisclaimer.h> O-  |______ |   /   /
    \___\_|/82 04 A1 3C C7 B1 37 2A   E3 6E 84 DA 97 4C 40 E6\|_/___/


