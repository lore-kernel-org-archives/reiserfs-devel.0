From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: WG: - after   reiserfsck --check  => rebuild-tree not finish
Date: Fri, 14 May 2004 20:27:50 +0400
Message-ID: <1084552070.14090.6264.camel@tribesman.namesys.com>
References: <658239FB1D8CA7499FA10CEB7CB2AF64562833@oeulw2ex01.hbi.ad.harman.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <658239FB1D8CA7499FA10CEB7CB2AF64562833@oeulw2ex01.hbi.ad.harman.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Lange, Michael" <Michael.Lange@temic-sds.com>
Cc: reiserfs-list@namesys.com

On Fri, 2004-05-14 at 20:15, Lange, Michael wrote:
> -----Urspr=FCngliche Nachricht-----
> Von: Lange, Michael=20
> Gesendet: Freitag, 14. Mai 2004 18:05
> An: 'Vladimir Saveliev'
> Betreff: AW: - after reiserfsck --check =3D> rebuild-tree not finish
>=20
>=20
> Hello Vladimir,
>=20
> Sorry i lost your last email.
>=20
> Where an witch file? I triede to intall from
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.14.tar.gz
>=20
> In which listing do i have to copy the file=20
>=20
> ?
> /=20
> /etc
> /dev
>=20

make install will put it to /usr/local/sbin

> and si than the install like
>=20
> tar -xzvf reiserxxxx.tar.gz
> cd resierfsprogs.x.xx
> ./configure
> make=20
>=20
you can just:
cd fsck
./reiserfsck --rebuild-tree /dev/sda1


> Thanks a lot for helping. Perhaps i get the data back.
>=20
> Michael
>=20
>=20
> -----Urspr=FCngliche Nachricht-----
> Von: Vladimir Saveliev [mailto:vs@namesys.com]
> Gesendet: Freitag, 14. Mai 2004 14:07
> An: Lange, Michael
> Cc: reiserfs-list@namesys.com
> Betreff: Re: - after reiserfsck --check =3D> rebuild-tree not finish
>=20
>=20
> Hello
>=20
> On Fri, 2004-05-14 at 16:00, Lange, Michael wrote:
> > Hello
> >=20
> > please help.
> >=20
> >=20
> >=20
> > - After reiserfsck --rebuild-tree =20
> >=20
> > -Log
> > ####### Pass 0 #######
> > "r5" got 4618905 hits
> > ####### Pass 1 #######
> > ####### Pass 2 #######
> >=20
>=20
> Were there anything else?
> What reiserfsck version did you use?
> reiserfsck -V
>=20
> > - after   reiserfsck --check
> >  =20
> > 	=3D> rebuild-tree not finish
> >=20
> > help     important Data 460 Gig  (recover of 500 CD=B4s)
> >=20
> > Thanks
> >=20
> >=20
> >=20
> > Mit freundlichen Gruessen / Best regards
> >=20
> > Michael Lange
> > Manager IT Infrastructure
> >=20
> > Harman/Becker Automotive Systems GmbH
> > S=F6flingerstrasse 100
> > 89077 Ulm, Germany
> > Tel:  +49 / (0)731 / 3994 - 204
> > Fax: +49 / (0)731 / 3994 - 61 204
> > Mobil: +49 / (0)173 / 3 89 479 3
> > WEB: http://www.becker.de
> >      http://www.temic-sds.com
> >=20
> >=20
> >=20
> > *******************************************
> > Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte
> Informationen. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail
> irrtuemlich erhalten haben, informieren Sie bitte sofort den Absender und
> loeschen Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte
> Weitergabe dieser Mail ist nicht gestattet.
> > =20
> > This e-mail may contain confidential and/or privileged information. If =
you
> are not the intended recipient (or have received this e-mail in error)
> please notify the sender immediately and delete this e-mail. Any
> unauthorized copying, disclosure or distribution of the contents in this
> e-mail is strictly forbidden.
> > *******************************************
> >=20
> >=20
>=20
>=20
>=20
> *******************************************
> Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte Informa=
tionen. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail irrtuem=
lich erhalten haben, informieren Sie bitte sofort den Absender und loeschen=
 Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe die=
ser Mail ist nicht gestattet.
> =20
> This e-mail may contain confidential and/or privileged information. If yo=
u are not the intended recipient (or have received this e-mail in error) pl=
ease notify the sender immediately and delete this e-mail. Any unauthorized=
 copying, disclosure or distribution of the contents in this e-mail is stri=
ctly forbidden.
> *******************************************
>=20
>=20

