From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 24 Feb 2003 09:08:39 -0500
Message-ID: <1046095718.16047.440.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>
	 <1045926958.16042.366.camel@tiny.suse.com>
	 <1045930351.16042.377.camel@tiny.suse.com>
	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>
	 <1046020695.16048.409.camel@tiny.suse.com>
	 <3E59787F.2030009@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E59787F.2030009@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Sun, 2003-02-23 at 20:42, Manuel Krause wrote:
> On 02/23/2003 06:18 PM, Chris Mason wrote:
> > I've attached a new kinoded-9.diff.gz, it will apply to both -aa and
> > vanilla.  Please give it a try.
> > 
> > -chris
> 
> Hi and thank you!
> 
> I've replaced the old patch. And the problem is gone -- the partitions 
> are umountable again after copying.
> 

Good to hear

> I see a performance decrease with my copies in data=ordered mode by 
> about 7.5% compared to the 2.4.20-pre10-data-logging (it's about 19% 
> decrease for 2.4.21-pre4 since 2.4.19-data-logging). What is causing 
> this? Partly I can blame it on the disk content distribution that 
> changed. If I removed the kinoded related patches would the throughput 
> rate increase?

That's odd, tests here show performance increasing but I'm testing
2.4.21-pre4 + old data logging vs 2.4.21-pre4 + new data logging

Could I talk you into trying to narrow this down?  Perhaps starting with
a benchmark of the same dataset on both kernels?  The new data logging
code kicks kreiserfsd in sooner to service async commits.  So if your
benchmark lasts < 30 seconds, it is possible the older kernels never did
writes at all during the run.

-chris


