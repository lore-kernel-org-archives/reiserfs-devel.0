From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Thu, 27 Feb 2003 09:11:13 +0300
Message-ID: <20030227091113.A28643@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1> <200302261914.29475.vitaly@namesys.com> <20030226122144.U1373@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030226122144.U1373@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>, berthiaume_wayne@emc.com, philippe.gramoulle@mmania.com, reiserfs-list@namesys.com

Hello!

On Wed, Feb 26, 2003 at 12:21:44PM -0700, Andreas Dilger wrote:

> > tests shown that almost all the time was spent on reading bitmap blocks.
> > And the same reading is done at mount time actually.
> It would be interesting to see if reiserfsck immediately followed by mount
> (which is the normal boot behaviour) takes any longer than just the mount.

Two subsequent fsck -a takes twice the time. Almost (+- 2 secs of 48)

> Oleg posted that the block device cache is flushed upon last close, but I
> don't think that is totally true.  It _was_ true for a short while, but

It is. You can trivially verify that.

> it was rather annoying and I think Al Viro fixed that so that the block
> device cache was "lazily" dropped, so you would keep it if you re-opened
> the device shortly after closing it.

No, I do not think so. Invalidate inode pages (or whatever) is called on
last device close. Anyway think of two fscks on two filesystems, then mounting.

Though last time I played with stock SuSE kernels (not so long ago), they had
this behavior turned off and cache survived device close.

> I suppose the other way to test it would be to run 2 "reiserfsck -a"
> in a row.

Yes, Philippe did this for us already.

Bye,
    Oleg
