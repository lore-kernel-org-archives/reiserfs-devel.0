From: Todd Lyons <todd@mrball.net>
Subject: Re: non volatile ram devices
Date: Fri, 6 Dec 2002 20:09:09 -0800
Message-ID: <20021207040909.GJ9512@mrball.net>
References: <200212042059.35300.russell@coker.com.au> <200212051000.32340.russell@coker.com.au> <1039094639.8199.119.camel@tiny> <200212061052.59139.russell@coker.com.au> <m3wummpuzp.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <m3wummpuzp.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthias Andree wanted us to know:

>> I'm using a fairly vanilla kernel.  It's performance is 2 messages per second 
>> taken from qmail spool and delivered while there is a background load of pop 
>> access and new incoming mail.  IE if there is a backlog of mail to deliver 
>> the backlog gets smaller by 120 messages per minute.
>In my benchmarks on a plain FreeBSD ffs and a Micropolis 4345WS UWSCSI
>disk drive (7200/min) that was otherwise idle, qmail maxes out for
>remote 1-to-1 deliveries at a good 3 deliveries/s. It might improve a

You need to increase your remoteconcurrency limit.  Unless your emails
are 10's of Megabytes each, 3/s is way low.
- -- 
Blue skies...		Todd
| Get a bigger hammer!   |  All vendors suck, but different ones  |
| http://www.mrball.net  |  suck less in different applications.  |
| http://faq.mrball.net  |                --Andy Walden on NANOG  |
   Linux kernel 2.4.19-16mdk   1 user,  load average: 0.00, 0.00, 0.00
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE98XRlIBT1264ScBURAltmAJsED+JgbSx0CKWb1PIf5iopOXXLBQCeKebg
3LeZt00jkHlER19Mqt/bBCU=
=RldY
-----END PGP SIGNATURE-----
