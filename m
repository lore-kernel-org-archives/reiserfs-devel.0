From: Chris Mason <mason@suse.com>
Subject: Re: Horrible ftruncate performance
Date: 11 Jul 2003 13:09:03 -0400
Message-ID: <1057943343.13317.65.camel@tiny.suse.com>
References: <20030710052931.GA17957@namesys.com>
	 <200307111716.56823.Dieter.Nuetzel@hamburg.de>
	 <20030711152431.GF17180@namesys.com> <200307111730.50601.m.c.p@gmx.net>
	 <20030711154415.GI17180@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030711154415.GI17180@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Marc-Christian Petersen <m.c.p@gmx.net>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com

On Fri, 2003-07-11 at 11:44, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Jul 11, 2003 at 05:34:12PM +0200, Marc-Christian Petersen wrote:
> 
> > > Actually I did it already, as data-logging patches can be applied to
> > > 2.4.22-pre3 (where this truncate patch was included).
> > > > Maybe it _IS_ time for this _AND_ all the other data-logging patches?
> > > > 2.4.22-pre5?
> > > It's Chris turn. I thought it is good idea to test in -ac first, though
> > > (even taking into account that these patches are part of SuSE's stock
> > > kernels).
> > Well, I don't think that testing in -ac is necessary at all in this case.
> 
> May be not. But it is still useful ;)
> 
> > I am using WOLK on many production machines with ReiserFS mostly as Fileserver 
> > (hundred of gigabytes) and proxy caches.
> 
> I am using this code on my production server myself ;)
> 
> > If someone would ask me: Go for 2.4 mainline inclusion w/o going via -ac! :)
> 
> Chris should decide (and Marcelo should agree) (Actually Chris thought it is good
> idea to submit data-logging to Marcelo now, too). I have no objections.
> Also now, that quota v2 code is in place, even quota code can be included.
> 
> Also it would be great to port this stuff to 2.5 (yes, I know Chris wants this to be in 2.4 first)

Marcelo seems to like being really conservative on this point, and I
don't have a problem with Oleg's original idea to just do relocation in
2.4.22 and the full data logging in 2.4.23-pre4 (perhaps +quota now that
32 bit quota support is in there).

2.5 porting work has restarted at last, Oleg's really been helpful with
keeping the 2.4 stuff up to date.

-chris


