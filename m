From: wolfgang.glas@ev-i.at
Subject: Re: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 17:04:57 +0200
Message-ID: <OF8FC5CBA3.701C7235-ONC1256B97.00529239@ev-i.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Dear Philippe,

   Reduced NFS performance goes hand in hand with short network stalls on=20
our server.

So it would be helpful, if you could nmonitor your network performance=20
with a tool like ksysguard showing you the time-dependancy of the network=20
throughput. I bet, that you run into network stalls for around 1s, when=20
your average performance is diminished.

  Regards,
=20
    Wolfgang

--
Dr. Wolfgang Glas                        EV-i Informationstechnologie=20
GmbH.
Gesch=E4ftsf=FChrer                          Sebastian-Kneipp-Weg 17
Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
phone: ++43-512-284883-2                 fax: ++43-512-281624-31

