From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Re: online fsck
Date: Sun, 25 Apr 2004 16:10:02 +0200
Message-ID: <408BC6BA.9060104@poelzi.org>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org> <1082640853.12989.54.camel@watt.suse.com> <40880610.9050207@namesys.com> <20040422181538.GR25281@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040422181538.GR25281@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Dukes <pakrat@www.uk.linux.org>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Dukes wrote:

| Snapshotting 40G has a pretty small additional cost.  Snapshotting 1TB
| is somewhat more expensive.

A snapshot has only the size of the block changed to the main volume.
Snapshotting a 1 TB volume and rebuild the meta data will not need 1 TB,
i think 40 GB would be enough, maybe less.

regards
~ Daniel

- --
nihil me cirumdat

.. . .. ... . . .. . ... . .. . ... . . .
pgp key @ http://files.poelzi.org/pgp.txt
ED80 E53D 5269 4BB1 1E73 3A53 CBF9 A421 0A7B 003D
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFAi8a5y/mkIQp7AD0RAmhUAKC8xYaOnBaXQRhpAUiOFuAu1f0K3ACg1aPG
cagnLeHh411DHSIKLwyuE+Y=
=ZiYy
-----END PGP SIGNATURE-----
