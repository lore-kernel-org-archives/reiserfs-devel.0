From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: 5 Aug auto-snapshot w/rc2-mm1?
Date: Fri, 6 Aug 2004 10:26:57 +0400
Message-ID: <20040806062657.GA9811@backtop.namesys.com>
References: <20040805231710.3280E15D5F@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20034-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040805231710.3280E15D5F@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

On Thu, Aug 05, 2004 at 06:10:22PM -0500, David Dabbs wrote:
>=20
> Yesterday?s snapshot READ.ME indicates that it works with 2.6.8-rc2-mm2
> version of Linux kernel e.g. linux-2.6.8-rc2.tar.bz2 and
> 2.6.8-rc2-mm2/2.6.8-rc2-mm2.bz2 but today's auto-snapshot is labeled as=20
>=20
> 	linux-2.6.8-rc2-mm1.diff.gz
>=20
> Is this a typo?

The auto snapshot script needs small update each time we switch kernel vers=
ion.
Obviously it was not done.  The problem is with the auto-snapshot only, the
lastest from "stable" snapshots is OK.

Thanks.

> =9A
> David

--=20
Alex.
