From: Oleg Drokin <green@namesys.com>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Mon, 10 Mar 2003 16:40:35 +0300
Message-ID: <20030310164035.I19773@namesys.com>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com> <20030304111807.A18814@namesys.com> <20030310131528.B9033@humilis> <20030310152801.F19773@namesys.com> <20030310141605.D9033@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13171-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030310141605.D9033@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>

Hello!

On Mon, Mar 10, 2003 at 02:16:05PM +0100, Ookhoi wrote:

> > > And they all just apply cleanly. They must like each other very much :-)
> > > For some reason, I do not have quota support though.
> > How do you know you do not have quota support?
> o  The options are not listed in /proc/mounts
>    IIRC they should before quota is switched on (can't check that right

From the quotaon man page, it seems that these usrquota stuff are checked by
quota tools in /etc/fstab.

> o  quotacheck gives this: 
>    # quotacheck /dev/hda3
>    quotacheck: Can't stat() mounted device /dev/root: No such file or directory
> o  quotaon gives this:
>    # quotaon -ugv /www
>    quotaon: Can't stat() mounted device /dev/root: No such file or directory

Hm, I always thought that quota tools work with /etc/mtab,
don't you have /etc/mtab to be a symlink to /proc/mounts?
This might confuse it.

> > Have you tried to actually enable quotas (with quotaon) and see if it works?
> Yes :-)
> On a system where quota does not work either (due to missing patches:
> 2.4.21-pre4-ac4):
> # mount
> /dev/md1 on / type reiserfs (rw,noatime,usrquota,grpquota)

This output looks correct.

> On the system I compiled the last kernel for (2.4.21-pre5-ac2):
> # mount
> rootfs on / type rootfs (rw)
> /dev/root on / type reiserfs (rw,noatime)

This one suggests you have something strange with /etc/mtab.
Here's what I usually see (no quota enabled this time)
> mount
/dev/hda2 on / type reiserfs (rw)
...

> For some reason, the mount options are not listed.

This is because reiserfs is lacking necessary callback to print it's current
mount options in /proc/mounts, I think.

Bye,
    Oleg
