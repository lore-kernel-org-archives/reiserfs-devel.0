From: Ookhoi <ookhoi@humilis.net>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Mon, 10 Mar 2003 13:15:28 +0100
Message-ID: <20030310131528.B9033@humilis>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com> <20030304111807.A18814@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030304111807.A18814@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>

Oleg Drokin wrote (ao):
> Patches from
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21 should
> apply just fine, except that you need to apply my version of
> 05-data-logging... patch.  You can get it from
> ftp://namesys.com/pub/reiserfs-for-2.4/testing/05-2.4.21-pre5-data-logging-36.diff.gz
> 
> Also we have not merged that journal overflow patch (deleting
> highly-fragmented files) anywhere yet, as you reported you had hangs
> with it and running quotacheck. Below is the patch you should apply on
> top of all Chris' patches for this overflow fix.
> 
> Also another patch you probably want to apply is my iget5_locked
> bugfix for 2.4, You can find it at
> ftp://namesys.com/pub/reiserfs-for-2.4/testing/iget5_locked_for_2.4.21-pre5-datalogging.diff.gz
> it should be applied on top of datalogging/quota stuff I mentioned
> above.
> 
> --- fs/reiserfs/stree.c.orig	Tue Mar  4 10:55:33 2003
> +++ fs/reiserfs/stree.c	Tue Mar  4 10:57:30 2003
> @@ -1125,6 +1125,19 @@
>  		put_block_num(p_n_unfm_pointer, 0, 0);
>  		journal_mark_dirty (th, p_s_sb, p_s_bh);
>  		reiserfs_free_block(th, inode, tmp, 1);
> +		/* In case of big fragmentation it is possible that each block
> +		   freed will cause dirtying of one more bitmap and then we will
> +		   quickly overflow our transaction space. This is a
> +		   counter-measure against that scenario */
> +		if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
> +		    int len = th->t_blocks_allocated;
> +		    pathrelse(p_s_path) ;
> +		    reiserfs_restart_transaction(th, len) ;
> +		    reiserfs_update_inode_transaction(inode) ;
> +		    need_research = 1;
> +		    break;
> +		}
> +
>  		if ( item_moved (&s_ih, p_s_path) )  {
>  			need_research = 1;
>  			break ;

Wow. I now apply the following patches to linux-2.4.20:

patch-2.4.21-pre5
patch-2.4.21-pre5-ac2
03-relocation-6.diff
04-reiserfs-sync_fs-1.diff
05-data-logging-36-ac5.diff
06-logging-export.diff
08-reiserfs-quota-26.diff
kinoded-9.diff
10-reiserfs-quota-link-fix.diff
iget5_locked_for_2.4.21-pre5-datalogging.diff
oleg.patch

And they all just apply cleanly. They must like each other very much :-)

For some reason, I do not have quota support though.

# cat /etc/fstab
# /etc/fstab: static file system information.
#
#<partition> <mountpoint>  <type>    <options>                      <dump><pass>
/dev/hda2  /               reiserfs  noatime,usrquota,grpquota          0  0
/dev/hda3  /www            reiserfs  noatime,usrquota,grpquota          0  0
/dev/hda5  /tmp            reiserfs  noatime,usrquota,grpquota          0  0
/dev/hda6  /var            reiserfs  noatime,usrquota,grpquota          0  0

$ mount
rootfs on / type rootfs (rw)
/dev/root on / type reiserfs (rw,noatime)
/dev/hda3 on /www type reiserfs (rw,noatime)
/dev/hda5 on /tmp type reiserfs (rw,noatime)
/dev/hda6 on /var type reiserfs (rw,noatime)

$ dmesg | grep -i quota
VFS: Disk quotas vdquot_6.5.1

On a different system, where quota did not work because there 
was no support for reiserfs, I got this:
~# dmesg | grep -i quota
VFS: Disk quotas vdquot_6.5.1
reiserfs_getopt: unknown option "usrquota"

Because this "unknown option" line is missing on the system, 
I assume the kernel does think there is quota support for reiserfs.

$ grep -i quota config.progress.10-mar-2003
CONFIG_QUOTA=y

Any quick ideas?

Thanks in advance!
