From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 17:35:49 +0200
Message-ID: <200307111735.49136.Dieter.Nuetzel@hamburg.de>
References: <20030710052931.GA17957@namesys.com> <200307111727.25642.Dieter.Nuetzel@hamburg.de> <20030711153231.GG17180@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030711153231.GG17180@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Am Freitag, 11. Juli 2003 17:32 schrieb Oleg Drokin:
> Hello!
>
> On Fri, Jul 11, 2003 at 05:27:25PM +0200, Dieter N?tzel wrote:
> > > Actually I did it already, as data-logging patches can be applied to
> > > 2.4.22-pre3 (where this truncate patch was included).
> >
> > No -aaX.
>
> Right.
>
> > > > Maybe it _IS_ time for this _AND_ all the other data-logging patches?
> > > > 2.4.22-pre5?
> > >
> > > It's Chris turn. I thought it is good idea to test in -ac first, though
> > > (even taking into account that these patches are part of SuSE's stock
> > > kernels).
> >
> > I don't think -ac would make it => No big Reiser involved...
>
> Would make what?
> I think Alan have agreed to put data-logging code in already.

OK, good to hear.

But "all" ReiserFS data-logging users running -aa (SuSE) kernels (apart from 
WOLK ;-).

-Dieter

