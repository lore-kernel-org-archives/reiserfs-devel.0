From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] reiserfs v3 fixes and features
Date: Fri, 16 Apr 2004 16:39:52 -0400
Message-ID: <1082147992.27614.1462.camel@watt.suse.com>
References: <1081274618.30828.30.camel@watt.suse.com>
	 <1082141666.27614.1448.camel@watt.suse.com> <200404162147.16846@WOLK>
	 <200404162206.50654@WOLK>  <1082147216.27614.1459.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1082147216.27614.1459.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc-Christian Petersen <m.c.p@kernel.linux-systeme.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Fri, 2004-04-16 at 16:26, Chris Mason wrote:
> On Fri, 2004-04-16 at 16:06, Marc-Christian Petersen wrote:
> > On Friday 16 April 2004 21:47, Marc-Christian Petersen wrote:
> > 
> > Hi again,
> > 
> > > > ftp.suse.com/pub/people/mason/patches/reiserfs/2.6.5-mm6
> > > > Only reiserfs-group-alloc-9 has changed.
> > 
> > > hmm, does not apply to 2.6.5-mm6 (applied all from series.mm) before for
> > > sure.
> > 
> > Somewhen in the near future I'll forget my name ;(
> 
> I just downloaded things to double check and it still works for me. 
> But, that ftp directory had an added bonus file in it 2.6.5-mm6.bz2,
> which was incomplete.  I've deleted it, make sure you aren't patching
> based on that.

Hmpf, I was supposed to remember to take that patch -l out of my
.quiltrc.  The patch had whitespace rejects and I didn't notice.

I've replaced it with reiserfs-group-alloc-10, if you don't want to wait
for the suse ftp site mirror, QUILT_PATCH_OPT="-l" quilt push

Sorry for the confusion.

-chris


