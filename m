From: Brandon Low <lostlogic@gentoo.org>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Wed, 11 Feb 2004 11:02:50 -0600
Message-ID: <20040211170250.GA8237@lostlogicx.com>
References: <200402102010.04479.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16763-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200402102010.04479.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

This release gives me:

Partition /dev/hda3 is mounted with write permissions, cannot check it

When I try to run fsck.reiserfs /dev/hda3 during bootup when the fs is
mounted readonly.  I have used init=/bin/bash and confirmed this result
interactively... 

This problem prevented me from booting (due to the particular failure
modes of the Gentoo init system) but I'm sure that it is irritating to
others as well (unless it is peculiar to my system).

Kernel: 2.6.3-rc1-mm1
Gentoo Linux (unstable) up-to-date

--Brandon

On Tue, 02/10/04 at 20:10:04 +0300, Vitaly Fertman wrote:
> Hi all, 
> 
> The new reiserfsprogs release is available on our ftp site (ftp.namesys.com).
> 
> It includes:
> * bad block support, documentation is available at 
> http://www.namesys.com/bad-block-handling.html
> 
> *reiserfsck is able to repair ro mounted filesystems.
> 
> * UUID support is rewritten -- link to the libuuid instead of our own code.
> 
> * a few bugs were fixed:
>   - fix for shrinking the filesystem;
>   - fix for making the filesystem with blocksize greater then 4k;
>   - fix for making the journal of minimal size;
>   - fix in reiserfsck --rebuild-sb;
>   - fix in mount entry detection code;
>   - fix for the new fs size calculation in resizer; 
>   - fix for parsing the new fs size parameter correctly in resizer;
>   - fix for checking if the new fs size is correct in resizer;
>   - fix for handling the very last block on the device if formatted on pass2.
> 
> -- 
> Thanks,
> Vitaly Fertman
