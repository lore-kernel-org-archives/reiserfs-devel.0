From: Chris Worley <chrisw@lnxi.com>
Subject: Re: 2GB limit won't go away
Date: 10 Jun 2002 08:00:34 -0600
Message-ID: <1023717639.6253.7.camel@localhost.localdomain>
References: <1023708533.4654.301.camel@xserver>
	<20020609183534.GC14168@turbolinux.com>
	<1023754229.4654.1831.camel@xserver> <20020609231608.B8386@namesys.com>
	<1023780454.3999.52.camel@xserver> <20020610085822.A10921@namesys.com> 
	<20020610054252.GD20388@turbolinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020610054252.GD20388@turbolinux.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sun, 2002-06-09 at 23:42, Andreas Dilger wrote:
> Note that you should probably strace the failing "dd" command to ensure
> it is opening the file with O_LARGEFILE.  If not, it isn't a kernel
> problem but a tool problem instead.

# strace dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880
...
open("./test.bigfile", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 1
...

But, it was a good suggestion.  The dd/seek does speed testing.

Thanks,

Chris

> On Jun 10, 2002  08:58 +0400, Oleg Drokin wrote:
> > Would following sequence of commans help?
> > dd if=/dev/zero of=./test.bigfile bs=1024 count=5242880
> 
> Just as a tip for LFS testers, it is much easier to test with a sparse
> file instead of waiting for 2GB to be written to disk:
> 
> dd if=/dev/zero of=./test.bigfile bs=1k seek=1023M
> 
> (this puts you just short of the 2GB limit in case your seek is broken).

