From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: On a free repacker
Date: Mon, 24 May 2004 22:41:20 +0200
Message-ID: <40B25DF0.2090400@gmx.net>
References: <20040519192831.GL24604@nysv.org> <200405201028.13184.reiser@namesys.com> <20040520184054.GR24604@nysv.org> <40AEBBA0.6060606@namesys.com> <20040521184451.GS24604@nysv.org> <200405211902.i4LJ25RI016978@turing-police.cc.vt.edu> <20040524203016.GA4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040524203016.GA4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Valdis.Kletnieks@vt.edu, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:
> On Fri, May 21, 2004 at 03:02:05PM -0400, Valdis.Kletnieks@vt.edu wrote:
>=20
>=20
>>Larry McVoy's BitKeeper licensing might be an interesting model to follow.
>>Not sure if you can make it work for a repacker thought....
>=20
>=20
> I must look into this. (Note, you can also enlighten me on this, since
> I don't think I'll look into it yet).
>=20
> All I know about BitKeeper is that it's not as simple to use as subversion
> and subversion is free in all senses of the word. So I don't use BK.
> And I wouldn't if Namesys wouldn't force me.

Oh, that is interesting. I think we agree that CVS is not simple to use.
But I'm interested in how subversion can be simpler than bitkeeper.

# bk clone bk://some.url/of/the/project
and you have a directory "project"
# cd project
# ./configure; make; make install
for updates:
# cd project
# bk pull
some projects may have a default of source not checked out, do it now
# bk -r get

Can it get simpler than this? I'm truly interested in anything that makes
my life simpler.

Regards,
Carl-Daniel
