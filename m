From: wolfgang.glas@ev-i.at
Subject: Re: speedup patch for 2.4.18
Date: Wed, 10 Apr 2002 12:08:00 +0200
Message-ID: <OFA80C1538.200FD8A8-ONC1256B97.00374308@ev-i.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Dear Oleg,

   I've appplied the patches. Could you just explain in some words, what=20
are the biggest changes vs. the original code ? For which things should we =

look out (big files ? concurrent access via many processes ? NFS=20
interaction ? )

Up to know I have the patches runnign on my desktop machine with an=20
eepro100 adapter.

I'll give the patches a chance on our questionable server with the Netgear =

1GBit network adapter, if the patches turn out to be harmless on my=20
desktop and the feedback on this list is positive ;-)

  Regards,

     Wolfgang

--
Dr. Wolfgang Glas                        EV-i Informationstechnologie=20
GmbH.
Gesch=E4ftsf=FChrer                          Sebastian-Kneipp-Weg 17
Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
phone: ++43-512-284883-2                 fax: ++43-512-281624-31

