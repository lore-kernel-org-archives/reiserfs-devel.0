From: Oleg Drokin <green@namesys.com>
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: Thu, 16 Jan 2003 10:49:06 +0300
Message-ID: <20030116104906.A7078@namesys.com>
References: <b01ff1$sp0$1@genki.hungrycats.org> <avprcs$bfi$1@satsuki.furryterror.org> <b01ff1$sp0$1@genki.hungrycats.org> <15908.17236.966170.982897@laputa.namesys.com> <b04o8a$eah$1@satsuki.furryterror.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12369-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b04o8a$eah$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jan 15, 2003 at 05:44:26PM -0500, Zygo Blaxell wrote:
> > > And now I can reliably reproduce it.  It has nothing to do with MD,
> > > linear, raid, SMP, or unclean shutdowns.
> > > 
> > > I can reproduce this bug on a plain IDE disk partition in about three
> > > hours on Linux 2.4.20 (compiled for SMP but running on UP, full .config
> > > and system details available on request).  My test system has about 4 gigs
> > > under /etc, /usr, and /var, /dev/hdc2 is 25GB, and there is 1G of swap.
> >Thanks for the report. We shall try to reproduce it tonight.
> Were you successful?  If your experience is anything like mine, you
> should have hundreds if not thousands of broken files by now...

Yes, we were able to reproduce the problem and now we are trying to fix it.
Thanks a lot for your help and for the script.

Bye,
    Oleg
