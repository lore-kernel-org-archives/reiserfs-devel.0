From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 11:34:46 +0400
Message-ID: <20030331113446.A31858@namesys.com>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331072250.GC22731@cherenkov.orbis-terrarum.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Mar 30, 2003 at 11:22:50PM -0800, Robin H. Johnson wrote:
> The system refused to mount it originally, so I ran just plain
> --fix-fixable. It showed nothing wrong at all. By a fluke of terminals,
> I have a copy of this first output
> [http://www.orbis-terrarum.net/~robbat2/reiserfs/hdb1.first].
> However the system still refused to mount the drive, showing this in
> syslog:
> Mar 30 22:14:22 [kernel] read_super_block: can't find a reiserfs
> filesystem on (dev 03:41, block 64, size 1024)
> Mar 30 22:14:22 [kernel] read_super_block: can't find a reiserfs
> filesystem on (dev 03:41, block 8, size 1024)

This is indeed strange.

> The drive still refused to mount.
> I dug in fsck.reiserfs --help, and saw '--scan-whole-partition'. Tried
> --rebuild-tree with that on. It showed a LOT of stuff about StatDatas,
> and completed successfully.

Well, this is likely to destroy data, but still it should be mountable at the point of
completion.

Can you please make a metadata dump for us?
"debugreiserfs -p /dev/hdb1 | bzip2 -9c >metadata.bz2" and make this file
available for us to download.

> I just find that there is something definetly wrong if fsck says the
> partition is fine, but Linux refuses to mount it. Either this is a bug
> in Linux, or the reiserfsprogs. Either way, somebody has a bug :-)

Sure, and we are interested in resolving the problem.

Thank you.

Bye,
    Oleg
