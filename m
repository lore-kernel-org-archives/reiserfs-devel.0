From: "Lange, Michael" <Michael.Lange@temic-sds.com>
Subject: WG: - after   reiserfsck --check  => rebuild-tree not finish
Date: Fri, 14 May 2004 18:15:16 +0200
Message-ID: <658239FB1D8CA7499FA10CEB7CB2AF64562833@oeulw2ex01.hbi.ad.harman.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com



-----Urspr=FCngliche Nachricht-----
Von: Lange, Michael=20
Gesendet: Freitag, 14. Mai 2004 18:05
An: 'Vladimir Saveliev'
Betreff: AW: - after reiserfsck --check =3D> rebuild-tree not finish


Hello Vladimir,

Sorry i lost your last email.

Where an witch file? I triede to intall from
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.14.tar.gz

In which listing do i have to copy the file=20

?
/=20
/etc
/dev

and si than the install like

tar -xzvf reiserxxxx.tar.gz
cd resierfsprogs.x.xx
./configure
make=20

Thanks a lot for helping. Perhaps i get the data back.

Michael


-----Urspr=FCngliche Nachricht-----
Von: Vladimir Saveliev [mailto:vs@namesys.com]
Gesendet: Freitag, 14. Mai 2004 14:07
An: Lange, Michael
Cc: reiserfs-list@namesys.com
Betreff: Re: - after reiserfsck --check =3D> rebuild-tree not finish


Hello

On Fri, 2004-05-14 at 16:00, Lange, Michael wrote:
> Hello
>=20
> please help.
>=20
>=20
>=20
> - After reiserfsck --rebuild-tree =20
>=20
> -Log
> ####### Pass 0 #######
> "r5" got 4618905 hits
> ####### Pass 1 #######
> ####### Pass 2 #######
>=20

Were there anything else?
What reiserfsck version did you use?
reiserfsck -V

> - after   reiserfsck --check
>  =20
> 	=3D> rebuild-tree not finish
>=20
> help     important Data 460 Gig  (recover of 500 CD=B4s)
>=20
> Thanks
>=20
>=20
>=20
> Mit freundlichen Gruessen / Best regards
>=20
> Michael Lange
> Manager IT Infrastructure
>=20
> Harman/Becker Automotive Systems GmbH
> S=F6flingerstrasse 100
> 89077 Ulm, Germany
> Tel:  +49 / (0)731 / 3994 - 204
> Fax: +49 / (0)731 / 3994 - 61 204
> Mobil: +49 / (0)173 / 3 89 479 3
> WEB: http://www.becker.de
>      http://www.temic-sds.com
>=20
>=20
>=20
> *******************************************
> Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte
Informationen. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail
irrtuemlich erhalten haben, informieren Sie bitte sofort den Absender und
loeschen Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte
Weitergabe dieser Mail ist nicht gestattet.
> =20
> This e-mail may contain confidential and/or privileged information. If you
are not the intended recipient (or have received this e-mail in error)
please notify the sender immediately and delete this e-mail. Any
unauthorized copying, disclosure or distribution of the contents in this
e-mail is strictly forbidden.
> *******************************************
>=20
>=20



*******************************************
Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte Informati=
onen. Wenn Sie nicht der richtige Adressat sind oder diese E-Mail irrtuemli=
ch erhalten haben, informieren Sie bitte sofort den Absender und loeschen S=
ie diese Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe diese=
r Mail ist nicht gestattet.
=20
This e-mail may contain confidential and/or privileged information. If you =
are not the intended recipient (or have received this e-mail in error) plea=
se notify the sender immediately and delete this e-mail. Any unauthorized c=
opying, disclosure or distribution of the contents in this e-mail is strict=
ly forbidden.
*******************************************

