From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 19:32:31 +0400
Message-ID: <20030711153231.GG17180@namesys.com>
References: <20030710052931.GA17957@namesys.com> <200307111716.56823.Dieter.Nuetzel@hamburg.de> <20030711152431.GF17180@namesys.com> <200307111727.25642.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14890-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307111727.25642.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Hello!

On Fri, Jul 11, 2003 at 05:27:25PM +0200, Dieter N?tzel wrote:
> > Actually I did it already, as data-logging patches can be applied to
> > 2.4.22-pre3 (where this truncate patch was included).
> No -aaX.

Right.

> > > Maybe it _IS_ time for this _AND_ all the other data-logging patches?
> > > 2.4.22-pre5?
> > It's Chris turn. I thought it is good idea to test in -ac first, though
> > (even taking into account that these patches are part of SuSE's stock
> > kernels).
> I don't think -ac would make it => No big Reiser involved...

Would make what?
I think Alan have agreed to put data-logging code in already.

Bye,
    Oleg
