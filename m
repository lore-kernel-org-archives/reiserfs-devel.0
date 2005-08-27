From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Sat, 27 Aug 2005 15:29:57 -0400
Message-ID: <4310BF35.3060603@suse.com>
References: <1125074717.5549.44.camel@localhost.localdomain>	 <430F4B91.7030909@namesys.com>	 <1125076138.5549.65.camel@localhost.localdomain>	 <1125076558.5549.72.camel@localhost.localdomain>	 <430F5226.50701@namesys.com> <1125080213.5549.100.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1125080213.5549.100.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ming Zhang wrote:
> On Fri, 2005-08-26 at 21:32 +0400, Vladimir V. Saveliev wrote:
> 
> 
> one more question about this bitmap blocks
> 
> are this bitmap data is pinned into system thus will not be swapped out?

Yes, any buffers/pages with active reference counts are kept in memory.
Since the current reiserfs bitmap implementation keeps a reference until
filesystem umount, the bitmaps are pinned.

My dynamic bitmap patch fixes both of the problems you've posed so far.
Mount time is reduced to O(1) time, since only the superblock and root
node are read at mount time. On my system, it's something along the
lines of 0.2s. Memory consumption is reduced also, because the bitmap
block is released after the allocation/free that required it is complete.

It's a relatively straightforward patch - the error handling I refer to
is how to handle block read failures, which would only occur if your
disk is failing.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDEL81LPWxlyuTD7IRAnHWAJ9TmL/5ziKt4ObSUR9c/MJps4HydQCfXj0s
Kd4u+V+PYZQydA/YqelyJvo=
=pHCV
-----END PGP SIGNATURE-----
