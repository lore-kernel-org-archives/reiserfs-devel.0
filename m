From: Christian <evilninja@gmx.net>
Subject: Re: Odd Reiser4 Compilation Question
Date: Tue, 08 Mar 2005 16:16:05 +0100
Message-ID: <422DC1B5.50007@gmx.net>
References: <cd1827fb19b35e879936db66b71ab516@stanford.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <cd1827fb19b35e879936db66b71ab516@stanford.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Can Sar <csar@stanford.edu>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Can Sar wrote:
> Hi,
> 
> I am trying to install the Reiser4 tools (mainly mkfs.reiser4 and
> fsck.reiser4) in an alternative directory and because there is still so
> very little documentation on Reiser4 available, I'm having some major

reiser4progs-1.0.4.tar.gz comes with a GNU configure script:

$ ./configure --help | grep -A5 "Installation directories"
Installation directories:
  --prefix=PREFIX         install architecture-independent files in PREFIX
                          [/usr/local]
  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
                          [PREFIX]

so if you type

$ ./configure --prefix=/usr/local/alternative_directory

the files should show up under this very directory. does it not work? any
error messages you want to share then?

thanks,
Christian.

PS: just tried it by myslf: be sure to get libaal too:
ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.4.tar.gz
or else "configure" will complain....

- --
BOFH excuse #325:

Your processor does not develop enough heat.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCLcG1C/PVm5+NVoYRAsPxAKCdeGZSiC7OhH+dqHNv6+bml9CTXQCeLEjo
qA8OgSIuuD77ZBFqRU1Z8ts=
=kvJj
-----END PGP SIGNATURE-----
