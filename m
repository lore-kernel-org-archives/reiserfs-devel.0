From: Valdis.Kletnieks@vt.edu
Subject: Re: Problems with accessing directory
Date: Sun, 29 May 2005 14:05:04 -0400
Message-ID: <200505291805.j4TI562Y010885@turing-police.cc.vt.edu>
References: <6445A33351733A49B99193A797803D7C0C7631@sbs.RIS.local>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1117389903_6734P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 29 May 2005 18:44:02 +0200."
             <6445A33351733A49B99193A797803D7C0C7631@sbs.RIS.local> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Kurt Ghekiere <Kurt@ris.be>
Cc: Webservice <info@webservice.be>, reiserfs-list@namesys.com

--==_Exmh_1117389903_6734P
Content-Type: text/plain; charset=us-ascii

On Sun, 29 May 2005 18:44:02 +0200, Kurt Ghekiere said:

> May 29 17:28:51 mail3 kernel: Process hax0r (pid: 3738,
> stackpage=f121b000)
> May 29 17:28:51 mail3 kernel: Stack: 00000000 bfffffe5 00001000 f63b6000
> bfffe7f0 f63b6000 bffff8e4 00000000
> May 29 17:28:51 mail3 kernel:        f78aaf22 00000a3a 00000020 f121a000
> c0108a93 0000000b bfffe7f0 f78a99a1
> May 29 17:28:51 mail3 kernel:        00000000 00000000 00000000 00000000
> 00000000 00000000 00000000 00000000
> May 29 17:28:51 mail3 kernel: Call Trace:    [<c0108a93>]
> May 29 17:28:51 mail3 kernel:
> May 29 17:28:51 mail3 kernel: Code: 8a 02 84 c0 75 ef e8 9c ec ff ff 89
> c2 80 3a 00 0f 84 bb 00

Interesting process name indeed. Hopefully you recognize it? ;)

I would suggest running the call trace through ksymoops, but it's so short that
we've quite obviously clobbered the stack to the point that ksymoops won't tell
us anything useful.

I'd investigate why you get all those insmod errors - why is the system trying
to load pciehp and hw_random if there's no device?  Alternatively, are other
modules getting loaded incorrectly and blocking those from starting? It's
possible that if your kernel and modules are out of sync, that Bad Things like
panics happen....

You probably should look at upgrading the userspace reiserfsck and MD/LVM tools
- your kernel seems unhappy with the old versions.

Other than that, I admit to not having any clear "AHA! THAT's their problem"
solution, sorry....

--==_Exmh_1117389903_6734P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCmgRPcC3lWbTT17ARAvAlAJ0ZhEl2ZdQIKYrwnc8lpTBLsbVfWQCgvUyl
2DoyGqYWKRCrWLjOIXkUhTk=
=lim8
-----END PGP SIGNATURE-----

--==_Exmh_1117389903_6734P--
