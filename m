From: Clemens Schwaighofer <cs@tequila.co.jp>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Fri, 05 Mar 2004 10:59:33 +0900
Message-ID: <4047DF05.8080209@tequila.co.jp>
References: <4044119D.6050502@andrew.cmu.edu>	 <200403030700.57164.robin.rosenberg.lists@dewire.com>	 <1078307033.904.1.camel@teapot.felipe-alfaro.com>	 <200403031059.26483.robin.rosenberg.lists@dewire.com> <1078309141.863.3.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17085-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078309141.863.3.camel@teapot.felipe-alfaro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Cc: Robin Rosenberg <robin.rosenberg.lists@dewire.com>, David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Felipe Alfaro Solana wrote:
| The problem is that I couldn't save anything: the XFS volume refused to
| mount and the XFS recovery tools refused to fix anything. It was just a
| single disk bad block. For example in ext2/3 critical parts are
| replicated several times over the volume, so there's minimal chance of
| being unable to mount the volume and recover important files.

just my two cents here:

if you have an XFS volume, then you mostly do more than just storing
your baby photos, so you should have a raid below (software or hardware)
and then you don't worry about bad blocks, because a) you have a raid
(probably with a hot spare drive) and b) a daly (or more often) backup.

as for me I stopped using raiser, jfs or xfs at home. why? too many
negative experience. bad blocks (xfs total b0rked), raiserfs (similar
things) and I even didn't try jfs. with ext3 it works very well. yes I
do have a crappy board with a sucky via chipset and some super super old
hds, but with ext3 I had NO single problem since 6 months (heavily
knocking on wood here).

all those high end journaling file systems are no good for home systems
in my opinion

but again, those are just my little two cents here

- --
Clemens Schwaighofer - IT Engineer & System Administration
==========================================================
Tequila Japan, 6-17-2 Ginza Chuo-ku, Tokyo 104-8167, JAPAN
Tel: +81-(0)3-3545-7703            Fax: +81-(0)3-3545-7343
http://www.tequila.jp
==========================================================
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAR98FjBz/yQjBxz8RAjbtAJ9gyiy3QNak2NgsFyWGm355wshhMgCgz/5E
r9ARfA4kajBAUZCLOFBi0gw=
=InvR
-----END PGP SIGNATURE-----
