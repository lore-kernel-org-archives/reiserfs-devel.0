From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 12:21:44 -0700
Message-ID: <20030226122144.U1373@schatzie.adilger.int>
References: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1> <200302261914.29475.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302261914.29475.vitaly@namesys.com>; from vitaly@namesys.com on Wed, Feb 26, 2003 at 07:14:29PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: berthiaume_wayne@emc.com, philippe.gramoulle@mmania.com, reiserfs-list@namesys.com

On Feb 26, 2003  19:14 +0300, Vitaly Fertman wrote:
> tests shown that almost all the time was spent on reading bitmap blocks.
> And the same reading is done at mount time actually.

It would be interesting to see if reiserfsck immediately followed by mount
(which is the normal boot behaviour) takes any longer than just the mount.
If not, then the added checks in reiserfsck are good and don't hurt anything,
since you have to read the bitmap blocks from disk anyways.

Oleg posted that the block device cache is flushed upon last close, but I
don't think that is totally true.  It _was_ true for a short while, but
it was rather annoying and I think Al Viro fixed that so that the block
device cache was "lazily" dropped, so you would keep it if you re-opened
the device shortly after closing it.

I suppose the other way to test it would be to run 2 "reiserfsck -a"
in a row.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

