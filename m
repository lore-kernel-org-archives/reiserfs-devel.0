From: Ookhoi <ookhoi@humilis.net>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Mon, 10 Mar 2003 14:16:05 +0100
Message-ID: <20030310141605.D9033@humilis>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com> <20030304111807.A18814@namesys.com> <20030310131528.B9033@humilis> <20030310152801.F19773@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030310152801.F19773@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>

Oleg Drokin wrote (ao):
> On Mon, Mar 10, 2003 at 01:15:28PM +0100, Ookhoi wrote:
> > Wow. I now apply the following patches to linux-2.4.20:
> > patch-2.4.21-pre5
> > patch-2.4.21-pre5-ac2
> > 03-relocation-6.diff
> > 04-reiserfs-sync_fs-1.diff
> > 05-data-logging-36-ac5.diff
> > 06-logging-export.diff
> > 08-reiserfs-quota-26.diff
> > kinoded-9.diff
> > 10-reiserfs-quota-link-fix.diff
> > iget5_locked_for_2.4.21-pre5-datalogging.diff
> > oleg.patch
> > And they all just apply cleanly. They must like each other very much :-)
> > For some reason, I do not have quota support though.
> 
> How do you know you do not have quota support?

o  The options are not listed in /proc/mounts
   IIRC they should before quota is switched on (can't check that right
                                                 now though)
o  quotacheck gives this: 
   # quotacheck /dev/hda3
   quotacheck: Can't stat() mounted device /dev/root: No such file or directory
o  quotaon gives this:
   # quotaon -ugv /www
   quotaon: Can't stat() mounted device /dev/root: No such file or directory

I don't have /dev/root on any of my systems, so I don't understand the
error.

I tried both debian quota tools, and fresh ones from sourceforge:
# quota -V
Quota utilities version 3.08.
Compiled with RPC
Bugs to mvw@planets.elm.net, jack@suse.cz


> > # cat /etc/fstab
> > # /etc/fstab: static file system information.
> > #<partition> <mountpoint>  <type>    <options>                      <dump><pass>
> > /dev/hda2  /               reiserfs  noatime,usrquota,grpquota          0  0
> > /dev/hda3  /www            reiserfs  noatime,usrquota,grpquota          0  0
> > /dev/hda5  /tmp            reiserfs  noatime,usrquota,grpquota          0  0
> > /dev/hda6  /var            reiserfs  noatime,usrquota,grpquota          0  0
> > $ mount
> > rootfs on / type rootfs (rw)
> > /dev/root on / type reiserfs (rw,noatime)
> > /dev/hda3 on /www type reiserfs (rw,noatime)
> > /dev/hda5 on /tmp type reiserfs (rw,noatime)
> > /dev/hda6 on /var type reiserfs (rw,noatime)
> > $ dmesg | grep -i quota
> > VFS: Disk quotas vdquot_6.5.1
> > Any quick ideas?
> 
> Have you tried to actually enable quotas (with quotaon) and see if it works?

Yes :-)

On a system where quota does not work either (due to missing patches:
2.4.21-pre4-ac4):
# mount
/dev/md1 on / type reiserfs (rw,noatime,usrquota,grpquota)

On the system I compiled the last kernel for (2.4.21-pre5-ac2):
# mount
rootfs on / type rootfs (rw)
/dev/root on / type reiserfs (rw,noatime)

For some reason, the mount options are not listed.
