From: jlewis@lewis.org
Subject: Re: reiserfs rebuild-tree time?
Date: Fri, 12 Mar 2004 09:39:07 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0403120923290.1969@web1.mmaero.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
 <1078997330.9476.246.camel@tribesman.namesys.com>
 <Pine.LNX.4.58.0403112100510.1969@web1.mmaero.com> <200403121259.39117.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403121259.39117.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Fri, 12 Mar 2004, Vitaly Fertman wrote:

> How big was it? There are many directories at the beginning of the fs
> and directories need more time for packing, the speed usually increases
> when ~20% of partition is processed.

It's about a 70gb fs with about 45gb in use.  The bzip'd metadata file was
about 60mb, and there were still about 10M blocks left in the countdown.
I see now that the file gets pretty big to start with, but growth slows
down.  I'm collecting this again.

Before stopping the rebuild again just now, I straced it and could see
that it was apparently working on the same maildir again.

> How is CPU activity now?

When reiserfsck gets to "Pass 3 (semantic):" CPU load is very low (>90%
idle) and disk I/O is fairly low, but it seems to get to a particular
maildir and stop making progress.

debugreiserfs 3.6.13 (2003 www.namesys.com)

Loading on-disk bitmap .. 11377568 bits set - done
super block..ok
bitmaps..(545).. ok
journal (from 18 to 8210)..ok
Super block, bitmaps, journal - 8739 blocks - done, 11368829 blocks left
0%....20%....40%                                        left 6679893, 4402 /sec

The bzip'd output file is >100mb already.  What's the best way to get you
a copy once it finishes?

----------------------------------------------------------------------
 Jon Lewis *jlewis@lewis.org*|  I route
 Senior Network Engineer     |  therefore you are
 Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
