From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sat, 12 Oct 2002 16:29:50 -0600
Message-ID: <20021012222950.GK3045@clusterfs.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <200210121052.22603.bofh@coker.com.au> <20021012150028.G14731@vestdata.no> <200210121600.39712.bofh@coker.com.au> <3DA89A37.2070801@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DA89A37.2070801@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Russell Coker <bofh@coker.com.au>, Ragnar =?unknown-8bit?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

On Oct 13, 2002  01:55 +0400, Hans Reiser wrote:
> Someday not too long from now, it will look like one filesystem even 
> though it is in multiple cases.  Whether that is in reiser5 or reiser6 
> depends on what sponsors fund first.

Hans,
you should take a look at Lustre - www.lustre.org.  We are basically
already developing what you are suggesting - a distributed filesystem
which is built atop two or more local filesystems.  The aggregate
throughput of N lustre storage servers is basically N times the
throughput of a single server (clients communicate directly with the
storage targets, so the cross-sectional bandwidth in perfectly
scalable on a switched network).

Like Intermezzo, Lustre can be stacked on top of journaling local
filesystems, so it would be possible to use reiserfs for both the
metadata and storage targets.

We are deploying on a 1000-node cluster early next year, and expect
total throughput around 4GB/s (we have already made a limited test
at 1.4GB/s) with 90TB of storage - on a 2.4 kernel.  Because we are
using multiple separate filesystems, we are not hampered by the
2TB block device limit, and we get all sorts of parallelisms that
are not possible with a single large server.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

