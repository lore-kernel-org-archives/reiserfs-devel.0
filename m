From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Mon, 23 Feb 2004 14:11:34 -0500
Message-ID: <1077563494.23061.163.camel@watt.suse.com>
References: <1077165373.22253.45.camel@watt.suse.com>
	 <200402231042.08173.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402231042.08173.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com

On Mon, 2004-02-23 at 04:42, Dieter N=FCtzel wrote:

> You've forgotten in linux/fs/buffer.c
> EXPORT_SYMBOL(try_to_release_page);
> again ;-)
>=20
Fixed in a new upload.
>=20
> And the FIX in stree.c:

Also fixed.  Patches 00* will get submitted to Andrew as soon as namesys
reviews them.

There are going into the suse kernel now too, it's time for some broader
testing.

-chris


