From: "Villalovos, John L" <john.l.villalovos@intel.com>
Subject: RE: Test suite?
Date: Thu, 22 Jan 2004 09:25:59 -0800
Message-ID: <50D19C3AC815734C9E19FE4C4F6128A602A567FD@orsmsx403.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@Namesys.COM

Thanks for the info.  I will try to play around with it and see if it
helps :)

John


> -----Original Message-----
> From: Nikita Danilov [mailto:Nikita@Namesys.COM]=20
> Sent: Thursday, January 22, 2004 5:24 AM
> To: markw@osdl.org
> Cc: Villalovos, John L; reiserfs-list@Namesys.COM
> Subject: Re: Test suite?
>=20
>=20
> markw@osdl.org writes:
>  > On 21 Jan, Villalovos, John L wrote:
>  > > Is there a test suite for ReiserFS?
>  > >=20
>  > > For regression testing and the like?
>=20
> We use various stress tests and benchmarks for this:
>=20
> bonnie   (http://www.textuality.com/bonnie/)
> bonnie++ (http://www.coker.com.au/bonnie++/)
> fsx      (http://www.zip.com.au/~akpm/linux/patches/stuff/fsx-linux.c)
> iozone   (http://www.iozone.org/)
> dbench   (http://freshmeat.net/projects/dbench/)
> mongo    (http://www.namesys.com/benchmarks/mongo_readme.html)
> cerberus (http://sourceforge.net/projects/va-ctcs/)
> fsstress=20
> (http://cvs.sourceforge.net/viewcvs.py/ltp/ltp/testcases/kerne
l/fs/fsstress/)

And some scripts/programs that were created specifically on purpose. I
put few of them (without any support or documentation) into
ftp://ftp.namesys.com/pub/testtools

Plus scripts to start a bunch of concurrent kernel compilations,
bitkeeper pulls, tars, gzips, etc.

 > >=20
 > > I am just wondering if there is something that I can run after
making
 > > modifications that would help give me a warm-fuzzy feeling :)
 > >=20
 > > John
 > >=20

Nikita.
