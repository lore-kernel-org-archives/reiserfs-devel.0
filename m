From: Todd Lyons <todd@mrball.net>
Subject: Re: Error message - vs-13070
Date: Sun, 16 Feb 2003 07:33:59 -0800
Message-ID: <20030216153359.GA28622@mrball.net>
References: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home> <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home> <5.2.0.9.0.20030216203350.018dd7d8@mail.bogus.home>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12782-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.0.20030216203350.018dd7d8@mail.bogus.home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Heberle wanted us to know:

>hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=6599945, 
>sector=4286584
>end_request: I/O error, dev 03:03 (hda), sector 4286584
>These errors look to me like a hardware problem (bad sector on the drive).
>Definately not a reiserfs problem, thanks for the reply Oleg.

Depends, is 4286584 beyond the end of what really exists, or is that in
the middle of your valid sectors?
- -- 
Blue skies...	Todd 	Public key: http://www.mrball.net/todd.asc
We're sysadmins.  To us, data is a protocol overhead.  --Mans Nilsson
   Linux kernel 2.4.19-16mdk   3 users,  load average: 0.00, 0.00, 0.00
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE+T69nIBT1264ScBURApNeAJ9jkcgnpp3MPQSG0epvnNpuLdLVeQCgjPRB
qyjplPc7WRx72nbquw8LIYA=
=oF9p
-----END PGP SIGNATURE-----
