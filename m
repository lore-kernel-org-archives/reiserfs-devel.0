From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck bug
Date: Thu, 6 May 2004 13:18:04 +0400
Message-ID: <200405061318.04964.vitaly@namesys.com>
References: <40994D84.1010901@users.sf.net> <200405061159.59882.vitaly@namesys.com> <4099F3FE.5080902@users.sf.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4099F3FE.5080902@users.sf.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kir Kostuchenko <kir@users.sourceforge.net>, reiserfs-list@namesys.com

On Thursday 06 May 2004 12:14, Kir Kostuchenko wrote:
> Vitaly Fertman wrote:
> >Hello,
> >
> >On Thursday 06 May 2004 00:24, Kir Kostuchenko wrote:
> >>    hi, I've got error message from the reiserfsck 'out of disk space',
> >>in the rebuild tree mode.
> >>
> >>    I think it's a bug of reiserfsck, I can send you bzip2'ed image of
> >>the partition.
> >>
> >>    Please help.
> >
> >If a file item offset is broken this sometimes looks like some items
> >are lost and the hole is inserted, the needed space is proportional to
> >the hole size in reiserfs, this is why fsck may run of disk space. The
> >standard solution here is to find a larger partition, zero it (or enlarge
> >the existent one and zero the added part), make a raw copy of the
> >problem partition to it, run reiserfsck --rebuild-sb and then reiserfsck
> >--rebuild-tree.
>
>     Thanks.
>
>     So, if I only have a file with raw copy of my partition, I should do
> something like:
>
> // make 1 gb additional space
> # dd if=/dev/zero of=additional_space bs=1000k count=1000

with a file you can 
  dd if=/dev/zero of=the_copy bs=1k count=1 seek=X
where X=the current size in kilos + 1G. 

with a partition:
  dd if=/dev/zero of=the_copy bs=1M seek=X
where X=the current size in megabytes (be sure you do not zero some 
data of the current fs there)

> // add to my raw bad partition copy
> # cat additional_space >> bad_partition
>
> // map to the loop device
> # losetup /dev/loop0 bad_partition

not necessary, you can fsck the file itselt.

> // run reiserfsck with --rebuild-sb
> # reiserfsck --rebuild-sb --rebuild-tree /dev/loop0

reiserfsck --rebuild-sb /dev/loop0 | reiserfsck --rebuild-sb the_copy
reiserfsck --rebuild-tree /dev/loop0 | reiserfsck --rebuild-tree the_copy

>     Am I right?
>
> >Although it could be another reason, if you make the packed metadata:
> >	debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
> >and provide them for downloading, I will investigate if there is some
> >bug.
>
>     If my previous step will cause an error, send metadata to you?

yes.

-- 
Thanks,
Vitaly Fertman

