From: Todd Lyons <todd@mrball.net>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Mon, 19 Apr 2004 16:32:49 -0700
Message-ID: <20040419233248.GA11539@mrball.net>
References: <1081698647.5514.3.camel@redeeman.linux.dk> <407971B8.9090202@fbsd.za.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <407971B8.9090202@fbsd.za.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

aquadog wanted us to know:

>I'm having the exact same problem. Doing a gentoo stage1 install,
>and it fails on glibc every time. Exact same configuraiton on reiser3 
>partition and it works no problem.

I got all excited when I first read this because I am having stability
problems on my Gentoo box with a lone ReiserFS (3.6).  So I'm going to
rebuild glibc with no optimizations, but I'm not running reiser4, so my
results will probably have no bearing on things.  Doesn't hurt to try
though.

- -- 
Blue skies...	Todd                   http://www.mrball.net
        Public key:  http://www.mrball.net/todd.asc
        Signing an email is like wearing underwear.  
  You don't have to, but it's a really good idea to do it.
Linux kernel 2.4.22-12.tmb.1mdk   2 users,  load average: 0.22, 0.05, 0.02
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: http://www.mrball.net/todd.asc

iD8DBQFAhGGgIBT1264ScBURAm0BAJ9rewJB82iXZinWVaAx9K32mP1v4ACfWUa+
Sy9URjQSK4tbXS7rdnFaU94=
=QhXE
-----END PGP SIGNATURE-----
