From: Russell Coker <russell@coker.com.au>
Subject: Re: Advangates (A file-based interface for mount)
Date: Fri, 11 Jul 2003 17:30:39 +1000
Message-ID: <200307111730.39630.russell@coker.com.au>
References: <3F078EF1.6090908@mrs.umn.edu> <20030710025545.GB1160@vestdata.no> <200307110759.52384.tdickenson@geminidataloggers.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14880-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307110759.52384.tdickenson@geminidataloggers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toby Dickenson <tdickenson@geminidataloggers.com>, reiserfs-list@namesys.com

On Fri, 11 Jul 2003 16:59, Toby Dickenson wrote:
> > not all filesystems it will be possible to corrupt the metadata in a way
> > that will make the kernel crash or lock up - in some cases it may even
> > be possible to corrupt the data in such a way that it becomes a
> > security-problem? How could this be solved?
>
> I would hope that the filesystems commonly used on removable media would
> try to defend against this. Is this hoping too much?

I expect that the VFAT and other drivers for MS based file systems would 
perform reasonably well in this regard.  MS-DOS floppy disks have a history 
of being stuffed up in every imaginable way.

Ext2/3 seem to do reasonably well in this regard.  It's been a long time since 
I saw an Ext2 file system that could kill a kernel.

ReiserFS does poorly in this regard.  I have just replaced some defective RAM 
in my laptop.  When the RAM got corrupted and corrupted a file system it was 
common for a ReiserFS file system to get in a state whereby mounting it or 
performing regular operations on it would crash the kernel (not even Oops it, 
but lock it solid).  The same machine also had Ext3 file systems which gave 
no problems under the same situation.

I have been told that it is not possible to make ReiserFS do all checks on 
such data.  I hope that Reiser4 will be more resiliant in this regard.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

