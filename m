From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: After reiserfsck --rebulid-treelogfike
	=?ISO-8859-1?Q?doesn=B4t?= mount;  bad root block 4294.... -rebuild-tree
	did not complete
Date: Thu, 13 May 2004 15:54:28 +0400
Message-ID: <1084449267.14090.6217.camel@tribesman.namesys.com>
References: <658239FB1D8CA7499FA10CEB7CB2AF64562822@oeulw2ex01.hbi.ad.harman.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <658239FB1D8CA7499FA10CEB7CB2AF64562822@oeulw2ex01.hbi.ad.harman.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Lange, Michael" <Michael.Lange@temic-sds.com>
Cc: reiserfs-list@namesys.com

Hello

Please get reiserfsck from
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.14.tar.gz
and run it:
reiserfsck --rebuild-tree /dev/that-device
and send its output

On Thu, 2004-05-13 at 14:45, Lange, Michael wrote:
> help
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

