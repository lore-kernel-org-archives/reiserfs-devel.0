From: Erwin Riegler <riegler@hep.itp.tuwien.ac.at>
Subject: Re: bug in reiser4
Date: Tue, 29 Mar 2005 16:26:58 +0200 (CEST)
Message-ID: <Pine.LNX.4.21.0503291621200.14639-100000@hep.itp.tuwien.ac.at>
References: <1112102960.4650.422.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-list-return-23723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112102960.4650.422.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com


> Hello
>=20
> On Tue, 2005-03-29 at 15:55, Erwin Riegler wrote:
> > hi,
> > i have been using reiser4 for five months without any problems.
> > but suddenly i get strange error messages on the screen when=20
> > i try to halt the machine:
> >=20
> > # halt
> >=20
> >=20
> > ...
> >=20
> > reiser4[pdflush(131)]: jnode_lock_parent_coord
> > (fs/reiser4/flush.c:3095)[nikita-3178]:
> >=20
>=20
> I guess your filesystem got a corruption. Would you please fsck.reiser4
> it end let us know whether it found anything?

yes, you are right. the root partition had a corruption.=20

after=20

=09fsck.reiser4 --build-sb

everything works now again.

thank you very much,
erwin

>=20
> > ...
> >=20
> > this message is repeating all the time and the system is hanging in a
> > never ending loop.
> >=20
> > system:
> >=20
> > debian sid
> > kernel: 2.6.10-cko3
> >=20
> > best,
> > erwin=20
> >=20
> >=20
> > ------------------------------------------------------------
> > [work address]                             [private address]
> > Erwin Riegler                                  Erwin Riegler
> > Max Planck Institute for                A=DFmayergasse 23/5/41
> > Mathematics in the Sciences                    A-1120 Vienna
> > Inselstrasse 22
> > D-04103 Leipzig
> > office: +49-341-995950-850             home: +43-660-2146904
> > email:  riegler@hep.itp.tuwien.ac.at                =20
> > web:    http://www.mis.mpg.de
> > ------------------------------------------------------------
> >=20
> >=20
>=20

