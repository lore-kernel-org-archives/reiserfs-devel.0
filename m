From: "Hariolf =?ISO-8859-1?Q?H=E4fele?=" <hariolf.haefele@gmx.net>
Subject: Loop Device and Reiser4
Date: Sun, 9 Nov 2003 20:58:10 +0100 (MET)
Message-ID: <8526.1068407890@www54.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Hello,

I noticed that mounting an ISO9660 image doesn't work if the image is on a
reiser4 partition. When I do

mount -oloop img.iso /mnt/test/

I get:

ioctl: LOOP_SET_FD: Invalid argument

Apologies if this was already known.
Thanks,

Hariolf

--=20
NEU F=DCR ALLE - GMX MediaCenter - f=FCr Fotos, Musik, Dateien...
Fotoalbum, File Sharing, MMS, Multimedia-Gru=DF, GMX FotoService

Jetzt kostenlos anmelden unter http://www.gmx.net

+++ GMX - die erste Adresse f=FCr Mail, Message, More! +++

