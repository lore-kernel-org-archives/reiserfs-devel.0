From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Fwd: [PATCH] install standard {fsck,mkfs}.reiserfs symlinks
Date: Thu, 11 Oct 2012 11:54:22 -0400
Message-ID: <5076EBAE.6090401@suse.com>
References: <1232209178-25889-1-git-send-email-vapier@gentoo.org> <507595E5.8050409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <507595E5.8050409@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/10/12 11:36 AM, Edward Shishkin wrote:
> 
> 
> 
> -------- Original Message -------- Subject: 	[PATCH] install
> standard {fsck,mkfs}.reiserfs symlinks Date: 	Sat, 17 Jan 2009
> 11:19:38 -0500 From: 	Mike Frysinger <vapier@gentoo.org> To:
> reiserfs-devel@vger.kernel.org
> 
> 
> 
> Since utilities expect to be able to run `mkfs.$FS` and
> `fsck.$FS`, reiserfs should install symlinks for these to the right
> place.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org> --- 
> fsck/Makefile.am       |    2 ++ mkreiserfs/Makefile.am |    2 ++ 2
> files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/fsck/Makefile.am b/fsck/Makefile.am index
> 7b1013c..f2f0d9a 100644 --- a/fsck/Makefile.am +++
> b/fsck/Makefile.am @@ -9,3 +9,5 @@ EXTRA_DIST = $(man_MANS)
> 
> reiserfsck_LDADD = $(top_srcdir)/reiserfscore/libcore.a
> $(top_srcdir)/lib/libmisc.a
> 
> +install-exec-hook: +	$(LN_S) reiserfsck
> $(DESTDIR)$(sbindir)/fsck.reiserfs diff --git
> a/mkreiserfs/Makefile.am b/mkreiserfs/Makefile.am index
> 72cd707..aed0cfa 100644 --- a/mkreiserfs/Makefile.am +++
> b/mkreiserfs/Makefile.am @@ -6,3 +6,5 @@ EXTRA_DIST = $(man_MANS)
> 
> LDADD = $(top_srcdir)/reiserfscore/libcore.a
> $(top_srcdir)/lib/libmisc.a
> 
> +install-exec-hook: +	$(LN_S) mkreiserfs
> $(DESTDIR)$(sbindir)/mkfs.reiserfs -- 1.6.1
> 

Applied.

- -Jeff


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQduutAAoJEB57S2MheeWymYwQALofasyFtF5LnjwiaYf6sIMm
psfcgi6MqWiItAlVMK5PucI0Dpear5E3vfvidQxckdWzeTt6FJcHy2yZlwKp0MsP
iAhqvKt2mzABs77iqxAxazVxgrULfrwEPpyC1Tg7aCgp98AurqTwi8DsuR4C+a2B
y6Os0jkeqOs7tb5kFQqSiuBpX1ixQrEKw1xaM8VnBxr5l1p2PcNkPK/ht0w31bUD
y0fhZRdLsXkGurtJmEKY9aTcU6wxskelRn59hhdZvjxCWOvhoJJbWc+50/BYUGyO
mByrXWL8EJev/2ngYLirpZfOSbp4IZj6gFu++54n4I5Jf7cvIA4LSA2XE28BLyCD
mH/9Y/yKfPEyZ/b8zrGHz3Xdf/iNAFpq8wl7wo6ddht0wXPUiPxxKArQlBTXv+j3
nQVrCsLeyg7rBVRAMiDdYHLh6LEaND4xg1par/rRYFIYOArBrUxWNDQ11klRmdpL
HUPZ9qE/Zy4fLCcoPnWTp1zbjt8DDQvms0wI4v7TcNWMjvob4HdYGn40uGFtoefP
VeqoTTS47Aw/cHmHo59hsA0Gtg5tXQX9T2W6HwOSmZCwh2hdQHuzLGzBCv3yBjR+
dGCJvO6qDmzryLUQnyBUZL4W0Ym9BLCI4vcfHdp14LppgQrlpcP/Tydq0xANdGiV
SRYezUGkDMYuxMsUyDOO
=hrUR
-----END PGP SIGNATURE-----
