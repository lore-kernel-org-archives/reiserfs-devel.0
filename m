From: "Brian G. Olson" <bgo@cwru.edu>
Subject: Re: Fixing corrupt reiserfs partition when it registers as full
Date: Mon, 9 Jun 2003 12:44:28 -0400
Message-ID: <20030609164427.GB2834@jade.cwru.edu>
References: <20030604221436.GA19187@pals.cwru.edu> <20030605074823.GA10373@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030605074823.GA10373@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, Jun 05, 2003 at 11:48:23AM +0400, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Jun 04, 2003 at 06:14:36PM -0400, Brian G. Olson wrote:
> > Okay, I've got a reiserfs partition that went bad. I'm don't know how,
> > but for some reason the partition became completely full.  Showing up as
> > 100% full using df -h. However checking all the files on the partition
> > (using du -shc) it should have been a little more than half full (2.4G
> > partition), just as I remember df -h showing the last time I checked. So
> > I unmounted it, and checked with reiserfsck --check.  Sure enough, it
> > said I had a problem and told me to do use --rebuild-tree.  Okay, I do
> > that and pass 1 completes. Then on pass 2 it says it wants to add a
> > bunch of leaves (on the order of 10,000 leaves), but of course the
> > partition registers as full so it fails. That is where I am currently
> > stuck. I can't even mount it anymore, mount says it's 'not a directory'. 
> > I'm currently using reiserfsck version 3.6.6 from the Knoppix v3.2 cd.
> > Now I'm gonna try to find a newer version to use, but in the mean time,
> > if anyone has any ideas I'd really appreciate it. Thanks
> 
> Hm, the easiest solution is to copy entire partition with 'dd' to a bigger partition
> or to a file (and then append a file with some zeroes like this:
> "dd if=/dev/zero bs=4096 count=11000 | cat >>filewithpartition.img"),
> then run "reiserfsck --rebuild-sb" on the resulting partition or file,
> it will ask you some questions and you need to agree to a proposed fs size and you must say "no"
> to a question that asks if you did a resize.
> This will add some more space for fsck to work with.
> Then retry "reiserfsck --rebuild-tree" operation.
> 
> If you choose to copy image into a file, you will be able to mount the image
> using the loop device driver (-o loop option to mount command) after succesful
> finish of "reiserfsck --rebuild-tree" operation.
> 
> Bye,
>     Oleg
> 

Thanks for your help Oleg! I had some time to work on the problem this
weekend, and your tips really helped. I brought the HD with the bad
partition to another computer which had enough free space to make a
temporary partition. Copied the bad partition to the new one (which had
more space) using dd, fixed the superblock, then fixed it with
reiserfsck --rebuild-tree. I then shrunk it with resize_reiserfs so it
would fit on the original partition, dd'd it back to the original
partition, ran resize_resierfs again to make sure it was using the
entire partition, and now all is well. Oh, and after each step I used
reiserfsck --check to make sure everything was okay. 

Thanks again.

Brian
