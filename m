From: Andrew Morton <akpm@osdl.org>
Subject: Re: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 14:59:39 -0800
Message-ID: <20040324145939.4e656b20.akpm@osdl.org>
References: <1080149399.14737.77.camel@watt.suse.com>
	<20040324141855.742a6395.akpm@osdl.org>
	<1080167194.14743.120.camel@watt.suse.com>
	<20040324143516.3162cbfe.akpm@osdl.org>
	<1080168379.14743.124.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17446-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080168379.14743.124.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason <mason@suse.com> wrote:
>
> On Wed, 2004-03-24 at 17:35, Andrew Morton wrote:
> >  
> > > For data=ordered?  The only docs are to mount -o data=writeback if you
> > > don't want data=ordered (which is the new default).  No tool upgrades
> > > are required.
> > 
> > OK, thanks.  Switching the default on day one sounds radical doesn't it?
> > 
> It does, but the code has been in testing -suse and on the reiserfs
> list.  This dooesn't mean data=ordered is perfect, but it's not quite
> day one either.  I can switch the default back, but I'd rather have a
> trial by fire ;-)

OK.

> > > reiserfs needs a Documentation/filesystems/reiserfs.txt, but it needs
> > > that in general.  I'll write one up and have the namesys guys review.
> > 
> > OK.  And these guys need boring old changelogs please:
> > 
> The top of each patch has a boring old changelog.  I can reformat them
> if needed.

Oh, I didn't notice that.

Anything other than one-patch-per-email with changelog in the body is a bit
of a pain.

I'll go fetch the patches again :(
