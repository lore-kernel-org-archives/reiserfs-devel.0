From: Oleg Drokin <green@namesys.com>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging (was:Compatibility of  current 2.4.19.pending ...)
Date: Fri, 13 Sep 2002 11:37:35 +0400
Message-ID: <20020913113735.A6022@namesys.com>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11438-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D81076E.6090408@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Thu, Sep 12, 2002 at 11:30:22PM +0200, Manuel Krause wrote:

> >When I see the discussion about the new block-allocator, the testing 
> >directory etc. I assume a definite "No." (Please, please, correct me, if 
> ;-) You really didn't correct me so far. Mmh. :-(

Datalogging is incompatible with stuff in testing directory. It won't apply
cleanly to new block allocatior, but that's can be easily fixed.

> >So, for the overnight change to pre-kernel 7, where are the new 
> >data-logging patches Hans even announced to lkml?
> So I really got a 2.4.20-pre6 compiled with the 
> preempt-kernel-rml-2.4.20-pre5-1.patch and Olegs fix he sent to the list 
> yesterday. BTW, have the testing patches from -pre5 gone into -pre6? It 
> isn't clear to me.

Testing patches were merged into -pre6 by Marcelo's mistake and -pre7
have these patches removed already.

> Application startup timings of NS-7.0 and OOo-1.0.1 didn't increase. :-))

Sure, read code path did not changed at all.

> I hope I don't need to comment on the values...

Sure. datalogging and new file_write code are not solutions to same problem.
These are solutions for different problems and can be used together (after
merging of course) for even better performance, I hope ;)

Bye,
    Oleg
