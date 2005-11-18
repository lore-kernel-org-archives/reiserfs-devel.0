From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: ZFS - Reiser team reactions?
Date: Fri, 18 Nov 2005 01:55:41 -0500
Message-ID: <e692861c0511172255t3f555051s622f9c0ef578f164@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Looks like ZFS is no longer vaporware.
http://www.opensolaris.org/os/community/zfs/docs/

Any commentary from the Reiserfs team?

A (supposedly) production ready FS that provides the transactions
(using a similar/same tree ripple technique as reiser4), compression,
and snapshotting, that we expected with reiser4 in the not two distant
future... as well as checksumming, and raid integration (which uses
checksumming to aid reconstruction) that we've barely just talked
about here.

People have already started asking about Linux integration, if it were
not for that fact that CDDL is incompatible with the GPL, I'd expect
it to make its way into linux before Reiser4 as well.

A positive point is that this might be a good chance to point out that
Reiser4 has some of ZFS's features already and is the right framework
for building the rest (and much more)... and get some more interest in
getting it merged and completed.
