From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 11:44:47 -0700
Message-ID: <20031110114447.L10197@schatzie.adilger.int>
References: <3FAAB330.5040503@nrao.edu> <20031106140747.Z10197@schatzie.adilger.int> <3FAFC969.4080401@nrao.edu> <20031110181212.GA2014@mis-mike-wstn.matchmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16037-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20031110181212.GA2014@mis-mike-wstn.matchmail.com>; from mfedyk@matchmail.com on Mon, Nov 10, 2003 at 10:12:12AM -0800
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Boyd Waters <bwaters+moz@nrao.edu>, reiserfs-list@namesys.com

On Nov 10, 2003  10:12 -0800, Mike Fedyk wrote:
> On Mon, Nov 10, 2003 at 10:22:49AM -0700, Boyd Waters wrote:
> > Andreas Dilger wrote:
> > | If you have a recent e2fsprogs (1.33+ I think), you can use "blkid" to
> > dump
> > | the UUID/LABEL of most filesystem types (including reiserfs, XFS, JFS,
> > ext*).
> > | If run as root it will create a cache of available block devices and
> > | their UUID/LABEL that non-root users can access even if they can't read
> > | the block device, so it doesn't need to be suid or anything.  You can also
> > | use it to locate specific devices by LABEL/UUID/TYPE from scripts, etc.
> > 
> > Great!
> > 
> > as non-root user:
> > 
> > $ /sbin/blkid /dev/loop5
> > /dev/loop5: LABEL="35" UUID="c9923c3f-da67-464f-ad55-6b4da22dabf0"\
> > TYPE="reiserfs"
> > 
> > 
> > So in a script:
> > 
> > #/bin/bash
> > FS_DEV=/dev/hda1
> > FS_UUID=`/sbin/blkid $FS_DEV | cut -d '"' -f4`
> 
> Better would be:
> 
> FS_UUID=`/sbin/blkid $FS_DEV |grep UUID | head -n1| cut -d '"' -f4`

Or rather:

PATH=/sbin:$PATH
eval `blkid $FSDEV | cut -d: -f2-`

and use UUID (TYPE, LABEL) directly (I also hate hard-coding paths in scripts).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

