From: Chris Mason <mason@suse.com>
Subject: Re: data logging 2.6 - possible bug
Date: Wed, 11 Feb 2004 08:38:46 -0500
Message-ID: <1076506725.5612.17.camel@watt.suse.com>
References: <402947D7.7000003@gmx.net>
	 <200402102233.27388.Dieter.Nuetzel@hamburg.de>  <4029FFA5.9040602@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16753-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4029FFA5.9040602@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Wed, 2004-02-11 at 05:10, Christian Mayrhuber wrote:
> Dieter N=FCtzel wrote:
>=20
> > Have tried to check your disks?
> I reiserfscked the disks before the use of 2.6 + data logging
> and they were clean. (a week ago)

It does look like a 2.6 data logging bug, I must not be logging the stat
data after filling holes or something.  I'll take a look, thanks.

-chris


