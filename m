From: "E. Gryaznova" <grev@namesys.com>
Subject: Re : Loop Device and Reiser4
Date: Mon, 10 Nov 2003 19:07:19 +0300
Sender: grev
Message-ID: <3FAFB7B6.8393F0E1@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hello,

Thank you. This is known. Currently the loop devices are not supported
by reiser4.

Thanks,
Lena.


> Hello,

> I noticed that mounting an ISO9660 image doesn't work if the image is
on a
> reiser4 partition. When I do

> mount -oloop img.iso /mnt/test/

> I get:

> ioctl: LOOP_SET_FD: Invalid argument

> Apologies if this was already known.
> Thanks,

> Hariolf

> --
> NEU F=DCR ALLE - GMX MediaCenter - f=FCr Fotos, Musik, Dateien...
> Fotoalbum, File Sharing, MMS, Multimedia-Gru=DF, GMX FotoService

> Jetzt kostenlos anmelden unter http://www.gmx.net

> +++ GMX - die erste Adresse f=FCr Mail, Message, More! +++


