From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: 2GB limit won't go away
Date: Sun, 9 Jun 2002 23:42:52 -0600
Message-ID: <20020610054252.GD20388@turbolinux.com>
References: <1023708533.4654.301.camel@xserver> <20020609183534.GC14168@turbolinux.com> <1023754229.4654.1831.camel@xserver> <20020609231608.B8386@namesys.com> <1023780454.3999.52.camel@xserver> <20020610085822.A10921@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020610085822.A10921@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Chris Worley <chrisw@lnxi.com>, reiserfs-list@namesys.com

On Jun 10, 2002  08:58 +0400, Oleg Drokin wrote:
> Would following sequence of commans help?
> dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880

Just as a tip for LFS testers, it is much easier to test with a sparse
file instead of waiting for 2GB to be written to disk:

dd if=/dev/zero of=./test.bigfile bs=1k seek=1023M

(this puts you just short of the 2GB limit in case your seek is broken).
Note that you should probably strace the failing "dd" command to ensure
it is opening the file with O_LARGEFILE.  If not, it isn't a kernel
problem but a tool problem instead.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

