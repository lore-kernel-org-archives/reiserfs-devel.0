From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs v3 patches updated - Bug
Date: Wed, 07 Apr 2004 19:58:03 -0400
Message-ID: <1081382282.5111.9.camel@watt.suse.com>
References: <1081210239.4994.69.camel@watt.suse.com>
	 <200404071128.17846.christian.mayrhuber@gmx.net>
	 <1081343236.30811.516.camel@watt.suse.com>
	 <200404071714.39187.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404071714.39187.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

On Wed, 2004-04-07 at 11:14, Christian Mayrhuber wrote:
> On Wednesday 07 April 2004 15:07, you wrote:
> > On Wed, 2004-04-07 at 05:28, Christian Mayrhuber wrote:
> > > On Tuesday 06 April 2004 18:38, Christian Mayrhuber wrote:
> > > > On Tuesday 06 April 2004 02:10, Chris Mason wrote:
> > > >
> > > > Seem to run fine so far with
> > >
> > > I've to correct myself. There seems to be a problem with
> > > install. Version: install (coreutils) 5.0.91
> > >
> > > install: cannot change owner of ,,/tmp/mkinitrd.18919/initrd/bin/echo" :
> > > operation not permitted
> > >
> > > I can change the owner with chown without problems.
> >
> > Could you please strace the failing function?
> 
> Attached. 
> 
> The function is
> chown32("/tmp/wavesearch-deb.log.bz2", -1, -1) = -1 EPERM (Operation not 
> permitted)
> 
> The same install works fine on 2.6.4 + data=ordered.
> The disk is mounted with data=ordered.

Strange stuff, we can't reproduce it here.  Are you sure you've got the
whole patch set applied (maybe missing permission-reiserfs?)

Thanks for the strace, we'll have to debug this when you get back.

-chris


