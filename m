From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: i/o error (lost+found) with reiser4
Date: Mon, 23 Feb 2004 18:20:03 +0300
Message-ID: <20040223152003.GA1712@backtop.namesys.com>
References: <200402222338.23623.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200402222338.23623.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Sun, Feb 22, 2004 at 11:38:23PM +0100, Henning Westerholt wrote:
> Hello all,
> 
> after the regular stat data error, i try to fix the fs as usual. Today the 
> fsck program complains the first time about a fatal corruption. I attached 
> the output from the first fsck run.
> 
> I run fsck with option "build-fs" as recommended, and it seems to fix the 
> error. But now a "ls" in the root of the reiser4 partiton complains about a 
> input/ output error on the directory "lost+found". 
> Output from the system log:
> 
> +++++++++
> reiser4[ls(14750)]: check_open_format40 
> (fs/reiser4/plugin/disk_format/disk_format40.c:551)[vpf-1360]:
> WARNING: The object with the oid 3441763 greater then the max used oid 3441762 
> found.
> reiser4[ls(14831)]: check_open_format40 
> [...the same with stat, bash...]
> +++++++++
> 
> Error messages from ls, stat..:
> 
> +++++++++
> # ls /var/tmp/
> ls: /var/tmp/lost+found: Input/output error  
> ccache  distfiles  emerge-webrsync  kdecache-party  portage  portage-pkg  sync 
> 
> # stat /var/tmp/lost+found
> stat: cannot stat `/var/tmp/lost+found': Input/output error
> 
> # cd /var/tmp/lost+found
> -bash: cd: /var/tmp/lost+found: Input/output error
> 
> #fsck.reiser4 /dev/hdd8 
> ...
> No corruption found.
> +++++++++
> 
> Should i rebuild the partition? Is this a know problem?

This is not known but I have an idea why it happened.  I will discuss it with
our fsck maintainer and then we tell you how to fix the corruption. 

Thanks for the report. 

> Best regards,
> 
> Henning

-- 
Alex.
