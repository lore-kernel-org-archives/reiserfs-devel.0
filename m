From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Comparison of notail and notail,iicache(14) 2.4.19-pre7
Date: Thu, 25 Apr 2002 04:16:49 +0200
Message-ID: <3CC76711.5070709@mb.tu-ilmenau.de>
References: <3CC730DC.1000602@mb.tu-ilmenau.de> <3CC736DC.3060300@mb.tu-ilmenau.de> <3CC75748.7030502@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

On 04/25/2002 03:09 AM, Manuel Krause wrote:

>  >
>  > Sorry, I just see I've always forgotten to mention I use RMLs preemp=
t +
>  > lock-break patches, too. More info upon a stable configuration on th=
is
>  > setup for dd backups and VMware sessions - just mail. (Just in case
>  > someone faced same problems I did.)
>  >
>=20
> And I've hadone seldom file experience with iicache.
>=20
> My NS6' localstore.rdf did not work after copying-to and copying-back.
> Mmh. Could really be, I had this before with previous versions of
> iicache applied. Nothing in the logs. No reiserfsck errors. Now I've
> made a new one nearly automatically. Don't know how to catch this one.
>=20
> Seldom.
>=20


O.k., at the moment there have been many more files been truncated (my=20
NS bookmarks, rab=E4hh, seti@home status files, e.g.), and I don't want t=
o=20
dig further for now as it went fine without iicache it goes now to send=20
this mail (mounted without ,iicache) and I need to go to bed.

Maybe my set of patches was a bit overloaded... or iicache has a bug=20
with rdf & Co. files.

Thanks,

Manuel



