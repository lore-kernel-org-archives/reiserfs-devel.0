From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 crash
Date: Thu, 25 Nov 2004 22:21:19 +0200
Message-ID: <20041125202119.GJ26192@nysv.org>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi> <1101369249.1628.13.camel@tribesman.namesys.com> <20041125221919.2180794b.hihone@bigpond.net.au> <20041125112343.GG26192@nysv.org> <20041125184832.GI26192@nysv.org> <20041126070059.0893de98.hihone@bigpond.net.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041126070059.0893de98.hihone@bigpond.net.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cal <hihone@bigpond.net.au>
Cc: reiserfs-list@namesys.com

On Fri, Nov 26, 2004 at 07:00:59AM +1100, Cal wrote:
>
>Both of those patches appear to be from the mm series.  They're in
>2.6.10-rc2-mm2 and 2.6.10-rc2-mm3 (at least), and have generous
>comments at their head regarding their purpose.

OK, I admit I didn't read through them :)

But they don't seem to be in Reiser4-for-2.6.9? 

bzcat /usr/src/kernel_stuff/cko/2.6.9-cko3/make-tree_lock-an-rwlock.patch.bz2 | patch -p1 --dry-run
patching file fs/buffer.c
Hunk #1 succeeded at 992 (offset 50 lines).
Hunk #2 succeeded at 1000 (offset 50 lines).
patching file fs/inode.c
Hunk #1 succeeded at 201 (offset 5 lines).

Anyway, my compile just failed:

fs/built-in.o(.text+0x9da81): In function `mask_ok_common':
: undefined reference to `vfs_permission'
make[1]: *** [.tmp_vmlinux1] Error 1
make[1]: Leaving directory `/usr/src/linux-2.6.9-cko4a'
make: *** [stamp-build] Error 2

Yeah, I tried to merge that to -cko before trying the vanilla one,
because of obvious performance-related reasons...[1]

I don't think -cko caused that, though, all went afaict well through..

I think I'll boot -cko3 again and just avoid apt-get or something,
this is starting to suck pretty bad :)

[1]
Merge Con's code into mainline, this current one is next to unusable,
damnit :P

-- 
mjt

