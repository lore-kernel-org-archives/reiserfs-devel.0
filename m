From: Oleg Drokin <green@namesys.com>
Subject: Re: add_save_link:search_by_key
Date: Mon, 7 Jul 2003 09:56:39 +0400
Message-ID: <20030707055639.GA22258@namesys.com>
References: <1057354336.1968.7.camel@atlas.vinterbro.com> <20030705114653.GA7094@namesys.com> <1057557060.1925.4.camel@atlas.vinterbro.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1057557060.1925.4.camel@atlas.vinterbro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Hagen <trond@vinterbro.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Jul 07, 2003 at 07:51:01AM +0200, Trond Hagen wrote:

> Thanks, but the Red Hat kernel is a 2.4.20 why isn't the fix merged in ?

Oops. I meant that the fix was merged into 2.4.21.

Bye, 
    Oleg
> On Sat, 2003-07-05 at 13:46, Oleg Drokin wrote:
> > Hello!
> > 
> > On Fri, Jul 04, 2003 at 11:32:16PM +0200, Trond Hagen wrote:
> > 
> > > why I'm getting a lot of these ? 
> > > Jul  4 22:24:59 db-http1 kernel: vs-2100: add_save_link:search_by_key
> > > ([-1 15610004 0x1001 DIRECT]) returned 1
> > > I'm running: 2.4.20-13.7smp  (Red Hat 7.3 kernel)
> > 
> > Sounds like you've been bitten by infamous iget4() race. The fix is
> > merged into 2.4.20
> > The individual fix can be obtained from
> > ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending/07-race-fix.diff
> > Don't forget to fsck your reiserfs filesystems after applying
> > the fix (use latest reiserfsprogs from our ftp site, not the old
> > stuff from RH 7.3!)
> > 
> > Bye,
> >     Oleg
> >


