From: Oleg Drokin <green@namesys.com>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Mon, 10 Mar 2003 15:28:01 +0300
Message-ID: <20030310152801.F19773@namesys.com>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com> <20030304111807.A18814@namesys.com> <20030310131528.B9033@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13169-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030310131528.B9033@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>

Hello!

On Mon, Mar 10, 2003 at 01:15:28PM +0100, Ookhoi wrote:

> Wow. I now apply the following patches to linux-2.4.20:
> patch-2.4.21-pre5
> patch-2.4.21-pre5-ac2
> 03-relocation-6.diff
> 04-reiserfs-sync_fs-1.diff
> 05-data-logging-36-ac5.diff
> 06-logging-export.diff
> 08-reiserfs-quota-26.diff
> kinoded-9.diff
> 10-reiserfs-quota-link-fix.diff
> iget5_locked_for_2.4.21-pre5-datalogging.diff
> oleg.patch
> And they all just apply cleanly. They must like each other very much :-)
> For some reason, I do not have quota support though.

How do you know you do not have quota support?

> # cat /etc/fstab
> # /etc/fstab: static file system information.
> #<partition> <mountpoint>  <type>    <options>                      <dump><pass>
> /dev/hda2  /               reiserfs  noatime,usrquota,grpquota          0  0
> /dev/hda3  /www            reiserfs  noatime,usrquota,grpquota          0  0
> /dev/hda5  /tmp            reiserfs  noatime,usrquota,grpquota          0  0
> /dev/hda6  /var            reiserfs  noatime,usrquota,grpquota          0  0
> $ mount
> rootfs on / type rootfs (rw)
> /dev/root on / type reiserfs (rw,noatime)
> /dev/hda3 on /www type reiserfs (rw,noatime)
> /dev/hda5 on /tmp type reiserfs (rw,noatime)
> /dev/hda6 on /var type reiserfs (rw,noatime)
> $ dmesg | grep -i quota
> VFS: Disk quotas vdquot_6.5.1
> Any quick ideas?

Have you tried to actually enable quotas (with quotaon) and see if it works?

Bye,
    Oleg
