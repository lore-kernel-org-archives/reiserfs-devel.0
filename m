From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: non volatile ram devices
Date: Sat, 07 Dec 2002 00:50:50 +0100
Message-ID: <m3wummpuzp.fsf@merlin.emma.line.org>
References: <200212042059.35300.russell@coker.com.au>
	<200212051000.32340.russell@coker.com.au>
	<1039094639.8199.119.camel@tiny>
	<200212061052.59139.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212061052.59139.russell@coker.com.au> (Russell Coker's
 message of "Fri, 6 Dec 2002 10:52:59 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Russell Coker <russell@coker.com.au> writes:

> I'm using a fairly vanilla kernel.  It's performance is 2 messages per se=
cond=20
> taken from qmail spool and delivered while there is a background load of =
pop=20
> access and new incoming mail.  IE if there is a backlog of mail to delive=
r=20
> the backlog gets smaller by 120 messages per minute.

In my benchmarks on a plain FreeBSD ffs and a Micropolis 4345WS UWSCSI
disk drive (7200/min) that was otherwise idle, qmail maxes out for
remote 1-to-1 deliveries at a good 3 deliveries/s. It might improve a
little with Andr=E9 Oppenheimer's patches, I didn't bother to check,
Postfix does 15/s on softupdates FreeBSD ffs, qmail does not support
softupdates. I didn't check Linux file systems on a current disk drive
such as Fujitsu MAH (7200/min U160 SCSI).

So I believe on ATA or loaded SCSI 2 messages per second is as good as
qmail gets with its 13+ synchronous writes per delivery. It's a
pig. Retrying with -o dirsync instead of -o sync might be worthwhile
though. Kernel patches needed.

--=20
Matthias Andree
