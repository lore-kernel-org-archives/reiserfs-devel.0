From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Two "maybe" related problems
Date: Wed, 19 May 2004 16:09:15 +0400
Message-ID: <1084968555.1431.127.camel@tribesman.namesys.com>
References: <200405181657.48868.mbuesch@freenet.de>
	 <1084892983.1431.112.camel@tribesman.namesys.com>
	 <200405191357.37303.mbuesch@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405191357.37303.mbuesch@freenet.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Buesch <mbuesch@freenet.de>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2004-05-19 at 15:57, Michael Buesch wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On Tuesday 18 May 2004 17:09, you wrote:
> > This is probably caused by the fact that system oopsed already.
> > I would suggest you to boot of rescue system and change /etc/fstab so
> > that /dev/hda13 does not get mounted on booting (noauto in fourth field
> > of a /etc/fstab's record)
> > Do so for other filesystems underlying deveices of which were
> > repartitioned.
> > reboot in usual way
> > if it does not oops on boot (it should not) - mkreiserfs will not get
> > stuck
> 
> I rebooted and updated reiserfs tools. Now it works as expected.
> 
> But should the kernel (reiser4 driver) be "allowed" to oops,

No.

> if someone tries to mount a non-existing partition, just because
> there's some old and corrupt data left, from a previous filesystem?
> Shouldn't it simply refuse to mount?

Yes
we shall fix it


> 
> - -- 
> Regards Michael Buesch  [ http://www.tuxsoft.de.vu ]
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
> 
> iD8DBQFAq0uvFGK1OIvVOP4RAn2YAJ9+AYo29gLPT8jZjFdjV7pLka88cACg0vHQ
> tvvzO2HGeT/x73FrTbaBJ5I=
> =Yg1o
> -----END PGP SIGNATURE-----
> 

