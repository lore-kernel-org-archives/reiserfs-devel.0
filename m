From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: Reiserfs labels/uuid in 2.5.X
Date: Thu, 16 May 2002 01:25:24 -0600
Message-ID: <20020516072524.GJ12975@turbolinux.com>
References: <3CE34780.603@attbi.com> <20020516095144.A7116@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10323-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020516095144.A7116@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Jordan Breeding <jordan.breeding@attbi.com>, reiserfs-list@namesys.com

On May 16, 2002  09:51 +0400, Oleg Drokin wrote:
> On Thu, May 16, 2002 at 12:45:36AM -0500, Jordan Breeding wrote:
> >   I noticed that reiserfstune can now generate uuids and place labels 
> > in the superblock.  When will the reiserfs code in 2.5.X be able to use 
> > those fields to do things like `mount -L "/usr" /usr`?  Right now that 
> 
> AFAIK, this have nothing to do with kernel at all.
> Label decoding is done by mount itself.
> Andreas Dilger can shed moer light on this topic,

You are correct - the support needs to go into mount itself.  Sadly,
while I have a working version of libblkid available (which understands
labels and UUIDs in reiserfs), I have never finished the work to
integrate this into the mount program.

The blkid library is available at the below URL if anyone is
interested in working on this.  I have agreement from Andries Brouwer
(mount maintainer) that he would accept this change, but I have never
gotten around to doing it.

http://www-mddsp.enel.ucalgary.ca/People/adilger/blkid/

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

