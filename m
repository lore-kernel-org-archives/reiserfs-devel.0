From: Mihai RUSU <dizzy@roedu.net>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 3 Mar 2004 12:56:58 +0200 (EET)
Message-ID: <Pine.LNX.4.58L0.0403031254260.24946@ahriman.bucharest.roedu.net>
References: <4044119D.6050502@andrew.cmu.edu> <200403031059.26483.robin.rosenberg.lists@dewire.com>
 <1078309141.863.3.camel@teapot.felipe-alfaro.com> <200403031149.48474.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403031149.48474.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 3 Mar 2004, Christian Mayrhuber wrote:

> On Wednesday 03 March 2004 11:19, Felipe Alfaro Solana wrote:
> 
> > It's not a matter of working: it's a matter of recovering. A bad disk
> > block could potentially destroy a file or a directory, but shouldn't
> > make a filesystem not mountable nor recoverable.
> >
> 
> Something similar happened to a server of mine 2 years ago.

Yep, I was just about to say that too. The data wasnt very important so I 
didnt messed much with it but aparently (when copying with dd noerror) I 
had one or few badblocks and xfs_repair couldnt find the superblock or 
something like that (it was searching printing dots ......).

> I never ever touched xfs since.

Besides that I am pleased in general with XFS :)

The bad thing is someone else also told me about this recovery issues he 
faced with XFS (before it happened to me too).


- -- 
Mihai RUSU                                    Email: dizzy@roedu.net
GPG : http://dizzy.roedu.net/dizzy-gpg.txt    WWW: http://dizzy.roedu.net
                       "Linux is obsolete" -- AST
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFARbn9PZzOzrZY/1QRAq5bAJ97sgHQzPCxkD0AbhRCbsVckX2QmQCgyXb6
gnWhYQWXYCtJIU5jLRMj90E=
=clRL
-----END PGP SIGNATURE-----
