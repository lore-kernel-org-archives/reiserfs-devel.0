From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: hard hang with reiser4-for-2.6.11-5 and VMware Workstation 5.0
Date: Mon, 20 Jun 2005 20:18:35 +0400
Message-ID: <1119284314.4394.200.camel@tribesman.namesys.com>
References: <20050617170514.23193.qmail@web53908.mail.yahoo.com>
	 <42B308C0.4050807@namesys.com> <20050618102940.GP11013@nysv.org>
	 <200506181756.49623.vitaly@namesys.com> <20050618143630.GR11013@nysv.org>
	 <1119267412.4394.84.camel@tribesman.namesys.com>
	 <20050620122432.GS11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050620122432.GS11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>, scott <scottfk@yahoo.com>

Hello

On Mon, 2005-06-20 at 16:24, Markus T=F6rnqvist wrote:
> On Mon, Jun 20, 2005 at 03:36:53PM +0400, Vladimir Saveliev wrote:
>=20
> >> fsck patch?
>=20
> >yes, here is it against reiser4progs-1.0.4.
>=20
> Spatsibo!
>=20
> I'm trying to merge Reiser4 onto 2.6.12, it seems the best one
> to install is the replacement for -rc5-mm2 from your ftp and not
> akpm's broken-out one?
>=20
replacement for 2.6.12-rc5-mm2 is the same as reiser4 in 2.6.12-mm1.

> Are there any caveats I should be aware of, except that what's mentioned
> in the README about config dependancies?
>=20

in 2.6.12 you do not need the following reiser4 2.6.11 specificpatches
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/broken-out.1/reiser4-mappi=
ng_cap_account_dirty-fix.patch
and
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/broken-out.1/reiser4-mappi=
ng-tree-lock-fix.patch



So, in short, I think you should apply reiser4*patch of 2.6.12-mm1 to
2.6.12 and that is all.=20

> Thanks!

