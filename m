From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 09 Mar 2003 13:12:21 -0500
Message-ID: <1047233540.8215.164.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>
	 <1045926958.16042.366.camel@tiny.suse.com>
	 <1045930351.16042.377.camel@tiny.suse.com>
	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>
	 <1046020695.16048.409.camel@tiny.suse.com>
	 <3E59787F.2030009@mb.tu-ilmenau.de>
	 <1046095718.16047.440.camel@tiny.suse.com>
	 <3E5A5A31.5070008@mb.tu-ilmenau.de> <3E5A9A7A.5040806@mb.tu-ilmenau.de>
	 <3E5F196C.1040001@mb.tu-ilmenau.de>
	 <1046439149.2163.21.camel@tiny.suse.com>
	 <3E66B73D.6030008@mb.tu-ilmenau.de>
	 <1046922372.2161.275.camel@tiny.suse.com> <3E66C88E.40207@mb.tu-ilmenau.de>
	 <3E69FA70.5030601@mb.tu-ilmenau.de>
	 <1047227975.8215.150.camel@tiny.suse.com>
	 <3E6B74C0.5050702@mb.tu-ilmenau.de>
	 <1047230647.8219.161.camel@tiny.suse.com>
	 <3E6B7C61.9050405@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6B7C61.9050405@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Sun, 2003-03-09 at 12:39, Manuel Krause wrote:
> > Very much, thanks.  Thanks to some work Jeff recently did, my current
> > thought is the slow down is related to the block allocator, and the
> > search_by_reada patch.  Jeff and I are working up numbers to see if this
> > is right, more details on monday.
> > 
> 
> I hope you don't blame the search_by_reada patch itself for a slowdown. 
> There is a 05-search_reada-4.diff in my said 2.4.19 setup. Or didn't you 
> integrate that patch in your other patches since then - and excluded it?

Just the opposite, I think the search_reada patch helps, but not with
the default allocator in 2.4.21.  The metadata seems to be spread too
far apart there.  I promise, more details on monday after we get some
additional numbers to back things up ;-)

-chris


