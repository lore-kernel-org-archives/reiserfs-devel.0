From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.4.19-pre7.pending 01-05 didn't make it's way into -pre8?
Date: Fri, 3 May 2002 16:54:46 +0400
Message-ID: <20020503165446.A851@namesys.com>
References: <200205031448.56202.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205031448.56202.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Fri, May 03, 2002 at 02:48:55PM +0200, Dieter N?tzel wrote:

> Only for notification and up-to date info.
> Seems that 06 is in, Chris?

Yes, it is.

> Do all of the above patches apply clean against
> linux-2.4.19p7-compound-speedup-2.patch and
> linux-2.4.19p7-iicache-new-15.patch

Not sure about iicache, stuff should apply cleanly to
linux-2.4.19p7-compound-speedup-2.patch

> Please resend to Marcello, again.

Hans wants one more patch added to patchset before sending. so we are waiting
until that patch gets tested enough.

> What about all the "pending" quota stuff?

It is impossible without new format quota added into 2.4 kernel which
is not going to happen anytime soon, I think.

> Shouldn't you try harder to get this in, too?

A lot of people tried, but without generic quota stuff it is not possible.

> Even all (?) current SuSE (one of the main ReiserFS promoter) release kernels 
> do not include the quota stuff. Why?

Chris might know why they don't include new quota stuff.

Bye,
    Oleg
