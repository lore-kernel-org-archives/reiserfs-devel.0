From: Todd Lyons <todd@mrball.net>
Subject: rebuild tree on 500 GB partition (resend)
Date: Tue, 29 Oct 2002 10:21:38 -0800
Message-ID: <20021029182138.GB9168@mrball.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <reiserfs-list-return-11842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Resent-To: reiserfs-list@namesys.com
Resent-Message-Id: <20021030180617.253102C05D@trip.mrball.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I am sending this again because the first one seems to have been
dropped.

Due to an apparent (partial) hardware failure on a 500 Gig RAID storage
unit, we're starting a rebuild-tree on a single 500 Gig partition.  This
is the last hope before a restore from tape :(.

The sequence of events getting to this point is a little fubar, but let
me recap:

1) Site has one 500 Gig unit in service with 8 drives in a RAID 5 array,
no hot spares, hereafter referred to as Unit A.  Site has another 500
Gig unit with 8 drives in a RAID 5 array, no hot spares, hereafter
referred to as Unit B.  Both have a SCSI UltraWide 160 interface that
plugs into the host computer.
2) Drive 3 died on Unit A.  Running in degraded array mode, ie no fault
tolerance.
3) Hotswap of a spare blank drive failed due to a firmware bug (known
issue due to age of unit).  Still running ok in degraded array mode.
4) End of the day, power everything down, replace bad drive with new
drive, power up, but still doesn't see new drive, but still running ok
in degraded array mode.
5) As a test, pull all drives from Unit A and insert in Unit B.  New
drive 3 still rejected.
6) Put all drives back in Unit A.  Both units now in original
configuration.
7) Plan is to connect both units to the SCSI bus and copy from Unit A to
Unit B.
8) Re-init Unit B array.  Took 3 hours.
9) Unit A is set to ID 3 on the SCSI bus.  Unit B was at 3, changed it
to ID 4.  Disabled termination on Unit A and connected Unit B using a
cable.  Powered up.  Got parity errors with both connected.  Unable to
mount second unit.
10) Power down.  Disconnect Unit A.  Only connected to Unit B.  Make
single 500 Gig partition.  Format with reiser.
11) Unit A won't power up.  Reports configuration error.  Something is
screwed in its internal configuration.
12) Pull all drives from Unit A and insert in Unit B.  Powers up, says
all drives are ok.  Mount the partition, but getting permission denied
when try to list directory contents or cd into directories.  At this
point, it becomes apparent that fs corruption is present.
13) reiserfsprogs-3.0xj (2001) or something like that was installed.
Would segfault with reiserfsck.
14) Download reiserfsprogs-3.6.4, compile, install.  reiserfsck said to
use rebuild-tree.
15) Started rebuild-tree, logging to a log file.  Will send log file to
the list if requested.

It seems to me that somewhere during step 9, Unit A started corrupting
data on the disks, causing the need for rebuild-tree.

I'm not mentioning any brand names because I don't feel it's fair at
this point.  Both units have performed flawlessly up to this point.

UPDATE:
The rebuild tree completed.  Our results were nearly identical to the
other gentleman's results, about 8.5 hours.  It seems to have recovered
everything that our users can see.  In addition, there is 3.454 Gigs
worth of files in lost+found which we are culling through right now.
The log file is a couple of megs long, so it's not useful to post it to
the list, but I can make it available for download somewhere if need be.
Let me know.

The difference in quality between the old 3.0x series and the current
3.6.4 is AMAZING.  The new stuff is very well written and performs
tremendously.
--=20
Blue skies...	Todd                   http://www.mrball.net
        Public key:  http://www.mrball.net/todd.asc
        Signing an email is like wearing underwear. =20
  You don't have to, but it's a really good idea to do it.
   Linux kernel 2.5.44   2 users,  load average: 0.00, 0.00, 0.00

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9vtGyIBT1264ScBURAq7KAKDi3NmxKAU/W0xl9hfOL/Wku0huZACg2Zfl
4zyDt+c4q/YGWiAH53rLCMQ=
=vG9R
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
