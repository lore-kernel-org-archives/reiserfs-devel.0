From: Russell Coker <russell@coker.com.au>
Subject: Re: non volatile ram devices
Date: Sat, 7 Dec 2002 11:03:00 +0100
Message-ID: <200212071103.00132.russell@coker.com.au>
References: <200212042059.35300.russell@coker.com.au> <200212061052.59139.russell@coker.com.au> <m3wummpuzp.fsf@merlin.emma.line.org>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3wummpuzp.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com

On Sat, 7 Dec 2002 00:50, Matthias Andree wrote:
> Russell Coker <russell@coker.com.au> writes:
> > I'm using a fairly vanilla kernel.  It's performance is 2 messages per
> > second taken from qmail spool and delivered while there is a background
> > load of pop access and new incoming mail.  IE if there is a backlog of
> > mail to deliver the backlog gets smaller by 120 messages per minute.
>
> In my benchmarks on a plain FreeBSD ffs and a Micropolis 4345WS UWSCSI
> disk drive (7200/min) that was otherwise idle, qmail maxes out for
> remote 1-to-1 deliveries at a good 3 deliveries/s. It might improve a
> little with Andr=E9 Oppenheimer's patches, I didn't bother to check,
> Postfix does 15/s on softupdates FreeBSD ffs, qmail does not support
> softupdates. I didn't check Linux file systems on a current disk drive
> such as Fujitsu MAH (7200/min U160 SCSI).

How does qmail not support softupdates?

> So I believe on ATA or loaded SCSI 2 messages per second is as good as
> qmail gets with its 13+ synchronous writes per delivery. It's a
> pig. Retrying with -o dirsync instead of -o sync might be worthwhile
> though. Kernel patches needed.

Well this 13 synchronous writes is what I am trying to solve.  With=20
data=3Djournal and the journal on a RAM device I expect that performance wi=
ll=20
improve massively.

This is not a Qmail bottleneck AFAIK, Qmail is using all the disk capacity.=
 =20
If I add any extra disk IO load (such as starting a process to deliver=20
bulletins by hard-linking directly into user Maildir's) then the system loa=
d=20
average dramatically increases (load average goes from ~2 to ~10 if I add a=
n=20
extra process doing heavy disk writes).

--=20
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

