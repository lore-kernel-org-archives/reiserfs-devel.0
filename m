From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: nfs with reiserfs and ufs on freebsd
Date: Thu, 19 Feb 2004 03:22:33 +0100
Message-ID: <m3fzd7oljq.fsf@merlin.emma.line.org>
References: <20040218193033.74513.qmail@web80012.mail.yahoo.com>
	<4033C4F9.2070509@gmx.net>
	<20040219015625.2b7ea991@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040219015625.2b7ea991@philou.gramoulle.local> (Philippe
 =?iso-8859-15?q?Gramoull=E9's?= message of "Thu, 19 Feb 2004 01:56:25 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: cmc2slack-lvm@yahoo.com, Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

Philippe Gramoull=E9 <philippe.gramoulle@mmania.com> writes:

> Hello,
>
> If you don't use BSD flock() nor O_EXCL in a dotlocking scheme, there sho=
uldn't be any
> problem with NFS linux server and BSD client.

FreeBSD 4.8 as NFS client doesn't do any locking at all.

O_EXCL doesn't work across NFS anyways, workaround: use mkstemp(2) and
link(2).

--=20
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
