From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Reiser4 bitmap & replication handling
Date: Tue, 20 May 2003 20:33:52 +0200
Message-ID: <002d01c31efe$5da8b5d0$b300a8c0@xpstation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002A_01C31F0F.208DF2D0"
Return-path: <reiserfs-list-return-14180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_002A_01C31F0F.208DF2D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I just read this article about XFS :
http://www-106.ibm.com/developerworks/library/l-fs9.html

It says XFS uses B+Trees as Reiser4 does, and it uses this structure to =
store not only the keys, but also the bitmap data and replicates it =
storage trees to improve scalability and overall wide-disk performance. =
It also tries to allocate the largest contigous blocks to a file (but =
Reiser4 does this also), and comes close to raw performance when reading =
large files. The article concludes XFS is faster than Reiser (3.6 I =
think, as the article has been published in 2002 by Gentoo CEO Daniel =
Robbins) with performance tweaks at mount time. But how does Reiser4 ?

How many times does Reiser replicate and/or truncate its tree, and what =
structure has been chosen for bitmap data ?
Does Reiser4 divide the disk space in chunks, as XFS and ext2 do ?
Are you implementing some special features for very large disks, RAID =
systems and multi-processing hardware ?
Is the developement far enough to get an idea of the final performance ? =
I didn't remember, when do you plan to release Reiser4 ?

I'm very interested in those brand new filesystem techniques, for now I =
think we can consider that XFS and Reiser3 are very close in overall =
performance. You're saying in the doc you'd like to keep on offering the =
best performance in the market : are you really that far ?

Fred
------=_NextPart_000_002A_01C31F0F.208DF2D0--

