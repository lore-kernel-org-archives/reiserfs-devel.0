From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: data logging 2.6 - possible bug
Date: Tue, 10 Feb 2004 22:33:27 +0100
Message-ID: <200402102233.27388.Dieter.Nuetzel@hamburg.de>
References: <402947D7.7000003@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402947D7.7000003@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>

Am Dienstag, 10. Februar 2004 22:06 schrieb Christian Mayrhuber:
> Hi,
>
> after a week of uptime on my daily use workstation
> with kernel 2.6.2-rc2 + 2.6.1 exp data logging patches
> I did a reboot and reiserfsck of the raid1 device /dev/md1.
>
> Reiserfsck found 5 corruptions all of the style:
> /.tmp-kallsyms2.ovpf-10680: The file [420253 452289] has the
> wrong block count in the StatData (256), should be (320).
>
> Only .tmp-kallsyms[1|2].ovpf files in / and /usr/src/2.6.2-rc2
> were affected, no "production" files.
> These files are not listed by ls -f, neither before --fix-fixable
> nor after it. --fix-fixable was able to correct these corruptions.

Have tried to check your disks?

No problems, here.
=2D-=20
Dieter N=FCtzel
@home: <Dieter.Nuetzel () hamburg ! de>
