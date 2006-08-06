From: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Sun, 6 Aug 2006 16:23:16 +0200
Message-ID: <916440956.20060806162316@wp.pl>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com>  <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl>
Reply-To: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1692247736.20060801231255@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> I know it is very easy to create ubuntu kernel packages (I have done a few)
> I might try to do one for current dapper kernel for i386. But it would have
> to wait due to time my personal constraints (projects, etc.)
Answering myself...

I tried to create a kernel package with reiser4 for ubuntu-server (dapper)
They ship a 2.6.15 (heavily modified) kernel upon which the current
reiser4-for-2.6.17-3.patch applies fine but unfortunately miscompiles, eg.
fs/reiser4/plugin/file_ops_readdir.c: In function 'llseek_common_dir':
fs/reiser4/plugin/file_ops_readdir.c:486: warning: implicit declaration of function 'mutex_lock'
fs/reiser4/plugin/file_ops_readdir.c:486: error: 'struct inode' has no member named 'i_mutex'
fs/reiser4/plugin/file_ops_readdir.c:508: warning: implicit declaration of function 'mutex_unlock'
fs/reiser4/plugin/file_ops_readdir.c:508: error: 'struct inode' has no member named 'i_mutex'

I bet these are trivial to fix and I will try to do this but my time constraints
currently prevent me from doing that.

There also is an issue with grub. The kernel alone is fine for creating partitions
(or loop devices) but with grub not patched we can't install boot partitions. No biggy,
I guess, but still a problem.

I could create a vanilla + reiser4 kernel package easily but that would be stripped
off of the important dapper/debian patches and that is a no-no for dapper users, I guess.
At least for non-guru freaks who run their own, modified kernels.



-- 
Best regards,
Maciej


