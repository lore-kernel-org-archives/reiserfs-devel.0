From: Chris Mason <mason@suse.com>
Subject: Re: online fsck
Date: Thu, 22 Apr 2004 09:34:14 -0400
Message-ID: <1082640853.12989.54.camel@watt.suse.com>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040422150042.5b49c6c3.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jure =?iso-8859-2?Q?Pe=E8ar?= <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

On Thu, 2004-04-22 at 09:00, Jure Pe=E8ar wrote:
> Hi all,
>=20
> Is it theoretically posible?
>=20
> Like, does it need a drastic redesing of reiserfs or just sufficient $$
> directed to the team to be implemented?
>=20
>=20
> Because i think that reiserfsck --check in 12h + --rebuild-tree in 18h is
> still waaay too much downtime for a 500gb mail server...

Online check is easy, just use lvm or evms to make a snapshot and then
check the snapshot.  Online rebuild tree would be impossible by
definition (since it throws out everything above the leaf level and
rebuilds).

-chris


