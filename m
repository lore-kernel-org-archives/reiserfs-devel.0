From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 errors
Date: Thu, 26 Feb 2004 00:53:47 +0300
Message-ID: <200402260053.47624.vitaly@namesys.com>
References: <20040224234137.GA21990@pillars.net> <200402251742.12597.vitaly@namesys.com> <403CF124.8080406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <403CF124.8080406@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Vincent <bobvin@pillars.net>
Cc: reiserfs-list@namesys.com

On Wednesday 25 February 2004 22:01, Hans Reiser wrote:
> Vitaly Fertman wrote:
> >On Wednesday 25 February 2004 16:35, Hans Reiser wrote:
> >>Vitaly Fertman wrote:
> >>>Hello,
> >>>
> >>>On Wednesday 25 February 2004 02:41, Bob Vincent wrote:
> >>>>I've been playing around with reiser4 on a non-critical machine at
> >>>> work, and managed to corrupt a 20-gig reiser4 partition.
> >>>>
> >>>>I've run fsck.reiser4 several times to no avail; finally downloaded
> >>>>and compiled the 2.6.3-internal-testing-going-on version of the utils.
> >>>>
> >>>>(much later...)
> >>>>
> >>>>Well, unlike the other versions; this one completed the fsck okay.
> >>>>
> >>>>Just wondering what the following message means?
> >>>>
> >>>> Warning: Can't find stat data extension plugin by its id 0x4.
> >>>>
> >>>>I see it quite often.
> >>>
> >>>If an object is created with some non standard plugins, their ids
> >>>are stored in the special extention of the object stat data. But this
> >>>extention plugin is not ready in the progs yet.
> >>
> >>Why is fsck finding non-standard plugins on his computer?
> >
> >fsck found 4th bit set in the extension mask for this file, not
> > non-standard plugins.
> >
> >As I know Bob could call ioctl(UNPACK) on this file, probably smth else?
> >Another reason is a corruption.
>
> Find the reason and fix it, or get someone else to fix it.

Bob, would you run
	debugfs.reiser4 -P /dev/xxx | bzip2 -c > xxx.bz2 
on a reiser4 fs and provide it for downloading when fsck.reiser4 will report 
about such unknown stat data extentions on this fs? If you did not perform any
unusual action (like the mentioned ioctl) with your files we can probably find
some bugs there.

-- 
Thanks,
Vitaly Fertman


