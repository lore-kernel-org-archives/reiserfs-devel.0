From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 28 Feb 2003 08:32:30 -0500
Message-ID: <1046439149.2163.21.camel@tiny.suse.com>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E5F196C.1040001@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>


> > Comparing data-logging-35 vs data-logging-36+kinoded-9+dirty_inode I 
> > have a performance increase of 2.5% for the new data-logging. Like you 
> > say above.
> 
> But... though you were right with 2.4.21 data-logging performance 
> relations: --> What was causing that performance loss between 2.4.19 
> +data-logging and now???
> 

Did you exclude your changing dataset as a potential cause?  If not I'm
very interested in the details.

-chris


