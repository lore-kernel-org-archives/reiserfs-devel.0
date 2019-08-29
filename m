From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [GIT PULL] vfs: Add support for timestamp limits
Date: Wed, 28 Aug 2019 21:38:03 -0700
Message-ID: <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4vWLoTov4dXhdv6qv0FbQZfGMiUqISofyTxg+FnFPfY=; b=NRBCa+zU1hhS6i
	zqJOFDZMNahuQtCKeseXFF8dLclxjWSHYsEtRZy8kEbmKbJtJCDjG1KZjerUcoC3I2xtqCO+5yjxH
	IU24tP9CF+YisJbFpyEB7Jb5Rp4IySwtkDcrsRuGKyiuLCL0LPpTZwfYrKE1tLVR1BBqDehwJkQ7n
	wMhuEIG6gcWlmucqPfC6qmLlb0Mna54UpnrXrrKp6iPl8odpG8HQ1mVMr5Xi1DfooC/TdyZ4mn4K2
	UR4kQ3Y55KXCsb8CVnWTufg0S5Qq1cg//rplMP3XVKlJU8WOXEWWENmmSC/JzW9Hovkl4R0lE1MGx
	EYHvTX+PMtuG5isQysCw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=;
 b=Ad4yH+QK5ygrblSOoyxD0tbvjV1ue9nzyr8wf1rjkD8nTQtAUxNZJKQHZoLxHgRk2B
 TEAoeI524dxNfHCqzBGvK8fuiw+bAamqjZzPjGzpO4q1JaVUUDD9ax94jSI09AwQIEcQ
 WVE9Kk/mYHro0Fu7Hu8WrE90Mi3tlpvW3ZwrAo0k7GoHIwwQC60Y8Y9lhWHQ2x0r9tnz
 jSaqwnIO0Z4sBYO3fglWtXsmzhw2k5YPG8bbqxvl5SmNtQPBiiKKdIu9pdlVPfuYLf7e
 1REmXyzixgNc7NV2Y7fqiRSpx+wDxIJjwki+5Yj33Yn9bHcHOqns04S9V/iNntVln4qf
 JFkA==
In-Reply-To: <20190829041132.26677-1-deepa.kernel@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alexander Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: Latchesar Ionkov <lucho@ionkov.net>, martin@omnibond.com, jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, al@alarsen.net, yuchao0@huawei.com, Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>, Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz, stoph Hellwig <hch@lst.de>, nico@fluxnic.net, Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, y2038 Mailman List <y2038@lists.linaro.org>, Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>, Anton Vorontsov <anton@enomsg.org>, linux@armlinux.org.uk, codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu, V9FS Developers <v9fs-developer@lists.sourceforge.net>, Ilya Dryomov <idryomov@gmail.com>

Adding the others who were on original cc, just in case.
- Deepa

On Wed, Aug 28, 2019 at 9:12 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Thanks,
> Deepa
>
> The following changes since commit 5d18cb62218608a1388858880ad3ec76d6cb0d3b:
>
>   Add linux-next specific files for 20190828 (2019-08-28 19:59:14 +1000)
>
> are available in the Git repository at:
>
>   https://github.com/deepa-hub/vfs limits
>
> for you to fetch changes up to f0f216afa4c7e4dee9121fde52ccf57f76119188:
>
>   isofs: Initialize filesystem timestamp ranges (2019-08-28 19:19:36 -0700)
>
> ----------------------------------------------------------------
> Deepa Dinamani (19):
>       vfs: Add file timestamp range support
>       vfs: Add timestamp_truncate() api
>       timestamp_truncate: Replace users of timespec64_trunc
>       mount: Add mount warning for impending timestamp expiry
>       utimes: Clamp the timestamps before update
>       fs: Fill in max and min timestamps in superblock
>       9p: Fill min and max timestamps in sb
>       ext4: Initialize timestamps limits
>       fs: nfs: Initialize filesystem timestamp ranges
>       fs: cifs: Initialize filesystem timestamp ranges
>       fs: fat: Initialize filesystem timestamp ranges
>       fs: affs: Initialize filesystem timestamp ranges
>       fs: sysv: Initialize filesystem timestamp ranges
>       fs: ceph: Initialize filesystem timestamp ranges
>       fs: orangefs: Initialize filesystem timestamp ranges
>       fs: hpfs: Initialize filesystem timestamp ranges
>       fs: omfs: Initialize filesystem timestamp ranges
>       pstore: fs superblock limits
>       isofs: Initialize filesystem timestamp ranges
>
>  fs/9p/vfs_super.c        |  6 +++++-
>  fs/affs/amigaffs.c       |  2 +-
>  fs/affs/amigaffs.h       |  3 +++
>  fs/affs/inode.c          |  4 ++--
>  fs/affs/super.c          |  4 ++++
>  fs/attr.c                | 21 ++++++++++++---------
>  fs/befs/linuxvfs.c       |  2 ++
>  fs/bfs/inode.c           |  2 ++
>  fs/ceph/super.c          |  2 ++
>  fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
>  fs/cifs/netmisc.c        | 14 +++++++-------
>  fs/coda/inode.c          |  3 +++
>  fs/configfs/inode.c      | 12 ++++++------
>  fs/cramfs/inode.c        |  2 ++
>  fs/efs/super.c           |  2 ++
>  fs/ext2/super.c          |  2 ++
>  fs/ext4/ext4.h           | 10 +++++++++-
>  fs/ext4/super.c          | 17 +++++++++++++++--
>  fs/f2fs/file.c           | 21 ++++++++++++---------
>  fs/fat/inode.c           | 12 ++++++++++++
>  fs/freevxfs/vxfs_super.c |  2 ++
>  fs/hpfs/hpfs_fn.h        |  6 ++----
>  fs/hpfs/super.c          |  2 ++
>  fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
>  fs/isofs/inode.c         |  7 +++++++
>  fs/jffs2/fs.c            |  3 +++
>  fs/jfs/super.c           |  2 ++
>  fs/kernfs/inode.c        |  7 +++----
>  fs/minix/inode.c         |  2 ++
>  fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
>  fs/nfs/super.c           | 20 +++++++++++++++++++-
>  fs/ntfs/inode.c          | 21 ++++++++++++---------
>  fs/omfs/inode.c          |  4 ++++
>  fs/orangefs/super.c      |  2 ++
>  fs/pstore/ram.c          |  2 ++
>  fs/qnx4/inode.c          |  2 ++
>  fs/qnx6/inode.c          |  2 ++
>  fs/reiserfs/super.c      |  3 +++
>  fs/romfs/super.c         |  2 ++
>  fs/squashfs/super.c      |  2 ++
>  fs/super.c               |  2 ++
>  fs/sysv/super.c          |  5 ++++-
>  fs/ubifs/file.c          | 21 ++++++++++++---------
>  fs/ufs/super.c           |  7 +++++++
>  fs/utimes.c              |  6 ++----
>  fs/xfs/xfs_super.c       |  2 ++
>  include/linux/fs.h       |  5 +++++
>  include/linux/time64.h   |  2 ++
>  48 files changed, 298 insertions(+), 72 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
