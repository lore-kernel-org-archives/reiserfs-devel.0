From: Miguel <turtle.power@wanadoo.es>
Subject: Re: "df -i" support
Date: Fri, 14 May 2004 17:35:25 +0200
Message-ID: <20040514173525.1289b529.turtle.power@wanadoo.es>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
	<40A345D5.7000705@futuretg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A345D5.7000705@futuretg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Cc: reiserfs-list@namesys.com

On Thu, 13 May 2004 09:54:29 +0000
"Dr. Giovanni A. Orlando" <gorlando@futuretg.com> wrote:

> Miguel wrote:
>=20
> Dear Genius,
>=20
>     Please adopt:
>=20
>           df -hi
from df(1):

....
-h, --human-readable
              print sizes in human readable format (e.g., 1K 234M 2G)
....

how will this help to our monitorization system? it's written in perl
and it's not a human.
read my e-mail.

>=20
> Thanks,
> Giovanni
>=20
> >Hi
> >We have several machines running as MTA's using reiser for the mail
> >queue, we usually check the number of files (well an approximation)
> >using the output of "df -i" command on our monitorization plugins
> >this may be not very acurate but is very fast and didn't affect the
> >MTA's work.
> >
> >With reiser the output of df -i is no longer usable, we changed this
> >to"find | wc -l" variations but it hurts the performance.
> >
> >There's a command to count the number of leafs (that's the name?) of
> >a tree from a reiser partition? or other orientative value?.(we mount
> >with notail)
> >
> >Tnx
> >
> > =20
> >
>=20
>=20
> --=20
>=20
> --=20
>=20
> --
> Check FT Websites ...=20
> http://www.futuretg.com  - ftp://ftp.futuretg.com
> http://www.FTLinuxCourse.com
>                             /Certification
> http://www.rpmparadaise.org
> http://GNULinuxUtilities.com
> http://www.YourPersonalOperatingSystem.com
>=20
> --
>=20


--=20
La resistencia es f=FAtil todos ser=E9is asimilados
