From: "Kurt Ghekiere" <Kurt@ris.be>
Subject: RE: Problems with accessing directory
Date: Sun, 29 May 2005 20:09:04 +0200
Message-ID: <6445A33351733A49B99193A797803D7C0C7635@sbs.RIS.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Webservice <info@webservice.be>, reiserfs-list@namesys.com

Valdis,
Thank you for your info,=20
Its Sunday evening in Belgium, we will have to find a solution
Because as ISP its that or cut the phone lines tomorrow :-)
If we find something we'll post it=20
Thanks,
Kurt & Pascal=20

-----Oorspronkelijk bericht-----
Van: Valdis.Kletnieks@vt.edu [mailto:Valdis.Kletnieks@vt.edu]=20
Verzonden: zondag 29 mei 2005 20:05
Aan: Kurt Ghekiere
CC: Webservice; reiserfs-list@namesys.com
Onderwerp: Re: Problems with accessing directory=20

On Sun, 29 May 2005 18:44:02 +0200, Kurt Ghekiere said:

> May 29 17:28:51 mail3 kernel: Process hax0r (pid: 3738,
> stackpage=3Df121b000)
> May 29 17:28:51 mail3 kernel: Stack: 00000000 bfffffe5 00001000=20
> f63b6000 bfffe7f0 f63b6000 bffff8e4 00000000
> May 29 17:28:51 mail3 kernel:        f78aaf22 00000a3a 00000020
f121a000
> c0108a93 0000000b bfffe7f0 f78a99a1
> May 29 17:28:51 mail3 kernel:        00000000 00000000 00000000
00000000
> 00000000 00000000 00000000 00000000
> May 29 17:28:51 mail3 kernel: Call Trace:    [<c0108a93>]
> May 29 17:28:51 mail3 kernel:
> May 29 17:28:51 mail3 kernel: Code: 8a 02 84 c0 75 ef e8 9c ec ff ff=20
> 89
> c2 80 3a 00 0f 84 bb 00

Interesting process name indeed. Hopefully you recognize it? ;)

I would suggest running the call trace through ksymoops, but it's so
short that we've quite obviously clobbered the stack to the point that
ksymoops won't tell us anything useful.

I'd investigate why you get all those insmod errors - why is the system
trying to load pciehp and hw_random if there's no device?
Alternatively, are other modules getting loaded incorrectly and blocking
those from starting? It's possible that if your kernel and modules are
out of sync, that Bad Things like panics happen....

You probably should look at upgrading the userspace reiserfsck and
MD/LVM tools
- your kernel seems unhappy with the old versions.

Other than that, I admit to not having any clear "AHA! THAT's their
problem"
solution, sorry....

