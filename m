From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: 2.6.4 corruption
Date: Mon, 22 Mar 2004 12:21:42 +0100
Message-ID: <200403221221.42413.Dieter.Nuetzel@hamburg.de>
References: <20040322005555.GA509@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17372-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040322005555.GA509@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Am Montag, 22. M=E4rz 2004 01:55 schrieb Tom Vier:
> after rebooting (no umount, sysreq wouldn't respond) due to a radeon
> problem, some files had their data blocks switched. one file was truncate=
d,
> and what was truncated (it's mounted notail, btw) was attached to another
> file. one file was completely corrupt. this isn't considered normal
> behavior, i assume.
>
> i'm currently bootstrapping an altroot, so i can run reiserfsck.

Use the data-logging patches for 2.6.4 up or "wait" or 2.6.5/2.6.6.

http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D107967943828838&w=3D2
and
http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D107981018429164&w=3D2

BTW I'm with DRI-Devel since the beginning and data-logging WORKS even with=
=20
2.4.

Regards,
	Dieter
