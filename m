From: Francesco Biscani <biscani@pd.astro.it>
Subject: Re: More Slowdown
Date: Wed, 16 Nov 2005 02:40:43 +0100
Message-ID: <200511160240.45212.biscani@pd.astro.it>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan> <1132098269.7652.6.camel@teratron.lan.etheus.net> <437A811B.5000509@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437A811B.5000509@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: David Masover <ninja@slaphack.com>, Craig Shelley <craig@microtron.org.uk>

On Wednesday 16 November 2005 01:45, David Masover wrote:
> I got sick of waiting for it and nuked the fsync call.  All my kernels
> have a custom patch such that sys_fsync just returns true, no matter what.

Mhh.. would it be something like this?

=2D-- buffer.c.old        2005-11-16 02:36:46.129829994 +0100
+++ buffer.c    2005-11-16 02:37:11.125079752 +0100
@@ -376,7 +376,7 @@

 asmlinkage long sys_fsync(unsigned int fd)
 {
=2D       return do_fsync(fd, 0);
+       return 1;
 }

What are the implications of doing something like this? Is "sync" going to=
=20
stop working or isn't it using this function?

Thanks,

  Francesco

=2D-=20
Dr. Francesco Biscani
Dipartimento di Astronomia
Universit=E0 di Padova
biscani@pd.astro.it
