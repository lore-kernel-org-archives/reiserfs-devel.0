From: Chris Mason <mason@suse.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: 17 May 2002 11:47:33 -0400
Message-ID: <1021650453.14986.914.camel@tiny>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205171736.50971.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Oleg Drokin <green@namesys.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 2002-05-17 at 11:36, Dieter N=FCtzel wrote:

> Sorry Oleg, that I jump in, here...
>=20
> I get from time to time corrupted files (after reboot and replay) which a=
re=20
> _NOT_ written during/before crash!!!
> It happes during huge C++ compilation of one of my 3D VIS apps.
>=20
> After reboot I have waste in the original *.cxx files. This is very stran=
ge=20
> and time consuming 'cause I have to remove every broken file by hand and=20
> recreate it with CVS when the compiler hit it during the next run.

Is this on IDE?  With tails turned on?  Are all the affected files less
than 16k?

>=20
> A similar thing happen during kernel compilations.
> When the system crash (due to kernel devel stuff) some *.o or mostly=20
> .*.o.flags files are broken after replay/reboot. Yes, this time they are=20
> written before/during crash and rebuild during replay,=20

This will be taken care of by the data=3Dordered patches.  I'm combining
them with the data logging stuff.

-chris


