From: Phil Frost <indigo@unununium.org>
Subject: Re: Need help recovering lost partitions
Date: Wed, 28 Jan 2004 17:36:35 -0500
Message-ID: <20040128223635.GA9570@unununium.org>
References: <20040128123530.20160.h009.c001.wm@mail.ngenllc.com.criticalpath.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16641-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040128123530.20160.h009.c001.wm@mail.ngenllc.com.criticalpath.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan@ngenllc.com
Cc: reiserfs-list@namesys.com

It's unlikely you will be able to do anything before you restore your
partition table. To do that, there exist utilities that scan the drive
for patterns that imply a filesystem was there at some time. I suggest
gpart, but there are many others.

It's likely that trying to rebuild the filesystem as one huge FS did
more harm than good. If you have a backup image of the drive, use that;
if you don't make one before you do anything with dd, such as
'dd if=/dev/hdX of=backup_image'. Then you can do all sorts of
diagnostics on the image, and you can copy it before you make any
changes, and eventually restore it to the drive, by using dd again,
should you be able to recover your data.

On Wed, Jan 28, 2004 at 03:35:28PM -0500, dan@ngenllc.com wrote:
> I have a hard drive which had about 5 ReiserFs 3.6
> logical partitions on it until last night.  After
> booting up my computer (running Mandrake 9.2) I got
> some error messages saying that it needed to fsck the
> drive.  It went in a loop for quite a bit of time --
> fscking all the partitions and then rebooting, finding
> errors again, and rebooting.  I figured out how to get
> in manually, and tried backing up my data.  In the
> process though my partition table was lost.  (I tried
> deleting an ext2 partition I didn't need using fdisk
> and when I wrote teh new partition table to disk the
> partition was empty).
> 
> At some point I decided that enough is enough and
> installed Mandrake on another hard drive, and tried
> finding partitions using parted and gpart.  Neither
> utility managed to detect my partitions.
> 
> So I took a big jump.  I put one giant partition on the
> hard drive (ReiserFS) and ran reiserfsck --rebuild-tree
> -scan-whole-partition.
> 
> I was overjoyed to find that the files were there --
> 6,000+ files and numberous directoies were found. 
> However, every file I opened was either filled with
> nulls or gobblygook.  
> 
> I know the data is on the drive.  However reiserfsck
> found them proves this.  However, I figured that
> (perhaps) the --rebuild-tree is reading all files from
> the start of the giant partition.
> 
> How can I go about recovering my data?
> 
> Many many thanks in advance,
> 
> -Dan
> 
> 
> 
> Dan Anderson
> Manager
> nGen, LLC.
> Phone: (914) 466-8526
> Fax: (775)562-2622
> Email: dan@ngenllc.com
