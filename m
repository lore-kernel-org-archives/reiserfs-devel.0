From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree always finds errors --check is ok
Date: Mon, 10 Jan 2005 15:50:34 +0300
Message-ID: <200501101550.34403.vitaly@namesys.com>
References: <41D71C4E.6000209@hanaden.com> <200501072343.08374.vitaly@namesys.com> <41DF2CD6.7040800@hanaden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41DF2CD6.7040800@hanaden.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hanasaki <hanasaki@hanaden.com>, reiserfs-list@namesys.com

On Saturday 08 January 2005 03:44, hanasaki wrote:
> Could you outline exactly what takes place on a rebuild-tree?

reiserfs has two types of blocks. There are unformatted nodes. They
contain plain user file data. And there are formatted nodes. These may 
contain both user file data and filesystem metadata. --rebuild-tree scans
all blocks looking for filesystem metadata, e.g. for formatted nodes. 
However you can put a reiserfs image into a file, then file data (e.g. 
unformatted nodes of the host fs) will contain formatted nodes of the 
fs image, and rebuilding of the host fs will be screwed up as there is 
no way to distinguish image fs metadata kept in unformatted nodes 
of the host fs from the host fs metadata.

> I was under the incorrect assumption that if a rebuild-tree is 100%
> successful then the FS is ok and a subsequent rebuild-tree will have
> nothing to fix/report.  .....

In your case, some unformatted nodes look like formatted ones for the 
first sight, however after fixing all the corruptions in these nodes fsck 
realises that there is no valid metadata left and that they are either 
completely broken nodes or file data ones. To not corrupt file data fsck 
does not flush the made changes on disk. And as nothing gets changed 
the same attempt of fixing these nodes repeats again on the next rebuild.

> Vitaly Fertman wrote:
> > On Tuesday 04 January 2005 20:25, hanasaki wrote:
> >>Version of reiserfsk
> >>======================
> >>== From debian sarge
> >>/sbin/reiserfsck -V
> >>reiserfsck 3.6.19 (2003 www.namesys.com)
> >>== also used the version in knoppix 3.7 with similar results
> >>
> >>the output of two consecutive runs of --rebuild-tree on the same
> >>unmounted partition are attached.  Below is the diff
> >
> > rebuild-tree finds some blocks that looks like reiserfs formatted
> > blocks for the first sight whereas they are not and just belongs to
> > some file bodies. The consistency check reveals no valid metadata
> > in them, so they are considered as not valid reiserfs formatted blocks
> > and left not modified on disk. This is why the second run of rebuild-tree
> > finds them again and tries to do all the stuff again.

-- 
Thanks,
Vitaly Fertman


