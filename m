From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: Reiser4 / Reiserfs bonnie++ performance comparison
Date: Fri, 9 Jul 2004 17:24:43 +0200
Message-ID: <200407091724.43326.marcel@hilzinger.hu>
References: <20040709165924.27fabe63@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040709165924.27fabe63@philou.gramoulle.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

2004. j=FAlius 9. 16.59 d=E1tummal Philippe Gramoull=E9 ezt =EDrta:
>  Hello,
>
> Below are results from bonnie++ done on reiser4 and reiserfs.
> Each result is an average of 5 runs.
>
> For Reiser4 i used default mkfs options and -o formatting=3Dextents
> For Reisefs i used default mount options and -o notails
>
> Assuming that default behavior of bonnie++ is to use twice the RAM of the
> server, no reboot was done between consecutive runs
>
> Bonnie++ was run like this : bonnie++ -x 5 -d bonnie
>
> Hardware: Dell PowerEdge 2550 1GHz SMP, 1Go RAM, SCSI 15K RPM U160 Seagate
> Cheetah X15 Disk Software: Debian Sid + 2004.07.02 Reiser4 auto snapshot (
> 2.6.7-mm4 ) .config file available here if interested:
> http://philou.org/linux/reiser4/config-2.6.7-mm4
>
> Biggest regression seems to be in deletes.

You mustn't belive in Benchmarks :-). Try it empirically, and you will see,=
=20
that for big files, Reiser4 is much faster, then ReiserFS was.  Some example

Deleting a 6,8GB DVD iso image (average of 10 tests):
ext3			14,15 sec
reiser3.6	12,67 sec
reiser4		1,23 sec

Deleting 3 GB of MP3 files (4MB average file size, 10 tests):
ext3			11,91 sec
reiser3.6	4,56 sec
reiser4		1,86 sec

Marcel
=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
