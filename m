From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: capture_anonymous_page
Date: Mon, 01 Nov 2004 12:00:36 +0300
Message-ID: <1099299635.1712.77.camel@tribesman.namesys.com>
References: <41829679.2010808@sci.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41829679.2010808@sci.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lasse =?ISO-8859-1?Q?K=E4rkk=E4inen?= / Tronic <tronic2@sci.fi>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2004-10-29 at 23:14, Lasse K=E4rkk=E4inen / Tronic wrote:
> Posting here, as requested by nikita:
>=20
> reiser4[pdflush(27198)]: capture_anonymous_page=20
> (fs/reiser4/plugin/file/file.c:999)[nikita-3329]:
> WARNING: Cannot capture anon page: -28
> reiser4[pdflush(27198)]: capture_anonymous_pages=20
> (fs/reiser4/plugin/file/file.c:1058)[vs-1454]:
> WARNING: failed for moved page: result=3D-28 (captured=3D0)
>=20
> I'm getting lots of those in my kernel log. The filesystem (which is=20
> root) was fsck'ed a few days ago and there have been no dirty reboots=20
> since then. I've been using it in normal desktop/Gentoo setup, not=20
> benchmarking nor doing anything special.
>=20
> Running 2.6.9-cko2.
>=20

It looks like your root filesystem is out of free disk space. If yes,
freeing some space should make these warnings to go away.

