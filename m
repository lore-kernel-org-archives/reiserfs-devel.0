From: Steven Cole <elenstev@mesatop.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: 26 Aug 2003 14:25:49 -0600
Message-ID: <1061929549.1670.49.camel@spc9.esa.lanl.gov>
References: <20030826102233.GA14647@namesys.com>
	 <1061922037.1670.3.camel@spc9.esa.lanl.gov>
	 <20030826182609.GO5448@backtop.namesys.com>
	 <1061926566.1076.2.camel@teapot.felipe-alfaro.com>
	 <20030826194321.GA25730@namesys.com>
	 <1061927482.1666.36.camel@spc9.esa.lanl.gov>
	 <20030826200530.GC1258@matchmail.com>
	 <1061928831.1666.46.camel@spc9.esa.lanl.gov>
	 <20030826202649.GD1258@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030826202649.GD1258@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Oleg Drokin <green@namesys.com>, Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>, Alex Zarochentsev <zam@namesys.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>

On Tue, 2003-08-26 at 14:26, Mike Fedyk wrote:
> On Tue, Aug 26, 2003 at 02:13:51PM -0600, Steven Cole wrote:
> > On Tue, 2003-08-26 at 14:05, Mike Fedyk wrote:
> > > Can you try ext3 with -o data=writeback, as well as xfs & reiser3?
> > 
> > [root@spc1 /]# umount /dev/hda9
> > [root@spc1 /]# mount -t ext3 -o data=writeback /dev/hda9 /home
> > [root@spc1 /]# mount -t reiserfs /dev/hda10 /share_r
> > [root@spc1 /]# mount -t xfs /dev/hda12 /share_x
> > 
> 
> Please use the same partition for all filesystem tests, otherwise you will
> be showing results that need to be adjusted for inner-spindle disk speed.

Good point.  That will take a little more time, but at least the results
will be more meaningful.  Thanks.

Steven

