From: Chris Mason <mason@suse.com>
Subject: Re: Quota support for UID >65534
Date: 16 Jul 2002 08:25:32 -0400
Message-ID: <1026822332.4952.523.camel@tiny>
References: <1026727900.18163.61.camel@max> 
	<1026731371.21656.301.camel@tiny>  <1026807249.1066.31.camel@max>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026807249.1066.31.camel@max>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zeljko Brajdic <zorz@iskon.hr>
Cc: ReiserFS-list <reiserfs-list@namesys.com>

On Tue, 2002-07-16 at 04:14, Zeljko Brajdic wrote:
> On Mon, 2002-07-15 at 13:09, Chris Mason wrote:
> > On Mon, 2002-07-15 at 06:11, Zeljko Brajdic wrote:
> > > Hello,
> > > 
> > > I've applied quota patches for vanilla kernel-2.4.18 found at
> > > ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/quota-2.4/2.4.18/
> > > Everything works perfectly except for checking quota with command `quota
> > > -v username' if username have UID >65534. Interesting is that `repquota'
> > > doesn't have that problem and showing.
> > > 
> > > This is output of `quota':
> > > 
> > > root@led 12:02 (/usr/src/linux) > quota -v bureq
> > > quota: Error while getting quota from /dev/sda4 for 200000: Invalid argument
> > > Disk quotas for user bureq (uid 200000): none
> > 
> > Which disk format are you using?  You can check this with debugreiserfs
> > /dev/xxxxx
> > 
> root@led 13:12 (/usr/src/linux) > debugreiserfs /dev/sda4
> 
> <-------------debugreiserfs, 2002------------->
> reiserfsprogs 3.x.1b
> 
> 
> Filesystem state: consistency is not checked after last mounting
> 
> Reiserfs super block in block 16 on 0x804 of format 3.6 with standard journal

This means your reiserfs disk can support the high uids.

> 
> 
> We have found "error". :) In fs/dquot.c at line 2057 exists if
> statement:
> 
>         if (id & ~0xFFFF)
>                 goto out;
> 
> Is this feature or bug?! :) This have been found in vanilla kernel-2.4.18

This check is not in a quota patched kernel.  sys_quotactl isn't in
fs/dquot.c with the quota patches applied.

Did you apply all of the patches in my quota directory?  I think so,
since the kernel wouldn't compile otherwise ;-)

quota -v high_uid_user works fine for me, which version of the quota
utils do you have installed?

-chris




