From: "Bostjan Skufca (at) domenca.com" <bostjan.skufca@domenca.com>
Subject: Re: quota @ linux from scratch | 2.4.24 | reiserfs 3.6 | quota-3.11
Date: Mon, 5 Apr 2004 10:52:45 +0200
Message-ID: <200404051052.45733.bostjan.skufca@domenca.com>
References: <59dee33f33a3d14487ba22f708549d38@huertgen-family.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17709-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <59dee33f33a3d14487ba22f708549d38@huertgen-family.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "hubert@huertgen-family.de" <hubert@huertgen-family.de>
Cc: reiserfs-list@namesys.com

use 2.4.25, 2.4.24 has serious issue which can lead to root account comprom=
ise or DoS

=46rom http://www.kernel.org/pub/linux/kernel/v2.4/ChangeLog-2.4.25:
=2D-----------
<marcelo.tosatti:cyclades.com>:
o Andrea Arcangeli: malicious users of mremap() syscall can gain priviledges
=2D-----------


I use the patches this way:

cd /usr/src/linux
gunzip -c ../linux-patches-2.4.25/reiserfs/01-reiserfs-free-blocks.diff.gz =
| patch -p1
gunzip -c ../linux-patches-2.4.25/reiserfs/02-akpm-b_journal_head.diff.gz |=
 patch -p1
gunzip -c ../linux-patches-2.4.25/reiserfs/03-reiserfs-sync_fs-4.diff.gz | =
patch -p1
gunzip -c ../linux-patches-2.4.25/reiserfs/04-data-logging-40.diff.gz | pat=
ch -p1
gunzip -c ../linux-patches-2.4.25/reiserfs/05-write_times.diff.gz | patch -=
p1
gunzip -c ../linux-patches-2.4.25/reiserfs/06-reiserfs-quota-28.diff.gz | p=
atch -p1
gunzip -c ../linux-patches-2.4.25/reiserfs/07-kinode-10.diff.gz | patch -p1

There may be some fuzz or some offsets but don't worry. Search the february=
 2004 archives of this list for kernels without support for modules.

Best regards,=20
Bostjan


On Saturday 03 of April 2004 01:08, Hubert H=FCrtgen wrote:
> hello world,
>
> quota makes problems with reiserfs.
> works with ext2.
> _________________________________________
> found
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/
> within your homepage
> ____________________________________
> but
> I'm not so used in applying patches.
>
> could anyone please give me the exact (detailed) info,
> which file to use and how to apply?
>
> hubert

=2D-=20
Best regards,

Bostjan Skufca
system administrator

Domenca d.o.o.=20
Phone: +386 4 5835444
=46ax: +386 4 5831999
http://www.domenca.com

