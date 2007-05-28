From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Filesystem corruption
Date: Tue, 29 May 2007 00:19:10 +0100 (BST)
Message-ID: <alpine.DEB.0.99.0705290014560.20505@sheep.housecafe.de>
References: <46598532.5060505@lncsa.com> <Pine.LNX.4.64.0705280025570.10429@sheep.housecafe.de>
 <Pine.LNX.4.64.0705281829510.6275@sheep.housecafe.de>
 <465B1C90.6040009@lncsa.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <465B1C90.6040009@lncsa.com>
Sender: "evil@g-house.de"@mail.g-house.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 28 May 2007, Laurent CARON wrote:
> Always ran check which told me to run fix-fixable or rebuild-tree, which I 
> did after ensuring of backup reliability, and the error was corrected (after 
> eventually losing a few files i fortunately had in the backups).

Well, lucky you :)

> The machine does not seem to have any HW issue, nothing strange in the 
> logs..... :$
> This is just a plain Dell 2650 server with a bunch of SCSI HDD, software 
> raid5 array, reiserfs on top of it.

...and no power-failures, bad memory whatsoever?
Hm, too bad, since now it's unclear 
what *caused* the corruptions in the first place. You'll probably 
(hopefully) be able to correct this corruption with --rebuild-tree but 
I'd have a close look on this filesystem for further curruptions.

Christian.
- -- 
BOFH excuse #118:

the router thinks its a printer.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGW2N/+A7rjkF8z0wRAg9yAJ9PgWYfv1KC1Z3o/cVXScqxTYDPfwCdHKDD
Wy3p1M9ODJFfuqn0JaCEu8U=
=uCAH
-----END PGP SIGNATURE-----

