From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: inode generation numbers
Date: Wed, 10 Sep 2003 00:53:22 +0200
Sender: bernd-schubert@web.de
Message-ID: <200309100053.23352.bernd-schubert@web.de>
References: <200309092108.37805.bernd-schubert@web.de> <20030909140751.E18851@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030909140751.E18851@schatzie.adilger.int>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tuesday 09 September 2003 22:07, Andreas Dilger wrote:
> On Sep 09, 2003  21:08 +0200, Bernd Schubert wrote:
> > for a user space nfs-daemon it would be helpful to get the inode
> > generation numbers. However it seems the fstat() from the glibc doesn't
> > support this, but refering to some google search fstat() from some (not
> > all) other unixes does.
> > Does anyone know how to read those numbers from userspace with linux?
>
> For ext2/ext3 filesystems you can use EXT2_GET_VERSION ioctl for this.

regarding to fs/ext2/ioctl.c it should be EXT2_IOC_GETVERSION, shouldn't it?

> Maybe reiserfs as well.
>

Hello,

thanks a lot, it seems to work pretty well.
Since I have never used the ioctl() call before I only want to be sure I don't 
do something wrong,  I think this is correct, isn't it?

int ret, igen;
ret = ioctl(fd, EXT2_IOC_GETVERSION, &igen);


It also works for reiserfs-partitions with the very same call, @reiserfs-team, 
this won't change in the future, will it?


Cheers,
	Bernd

