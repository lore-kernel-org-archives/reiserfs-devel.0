From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sat, 7 Aug 2004 21:54:21 -0500
Message-ID: <20040808025812.732C215DF6@mail03.powweb.com>
References: <41148997.4070404@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20065-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41148997.4070404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>



> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Saturday, August 07, 2004 2:50 AM
> To: David Dabbs
> Cc: 'ReiserFS List'
> Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
> error"
> 
> >
> >Mongo. The pipe character is not legal in a filename as an example.
> >
> >I think I have discovered the problem - unless there was a reason mongo
> was
> >issuing mount/unmount commands at the start/end of a mongo 'run' as well
> as
> >before/after _each phase_. I just removed the mount/unmount calls that
> >bracket each phase execution and I am not seeing the errors. In addition,
> >reiser4 is running much faster. For instance, with the 'extra'
> >mount/unmounts r4 reported a REAL TIME stats of approximately 700 & 40
> for
> >CREATE and MKFILES. After removing the mount/un calls it is reporting 224
> &
> >50 REAL TIME.
> >
> >
> can you quote code more in these emails?
> 

Instead of cutting/pasting sections here see
http://dabbs.net/reiser4/mongopl.html. I have annotated my modifications to
mongo's mount handling with 'dmd.' There are other non-annotated changes I
have made, but they are not germane to this issue. If you want to know
exactly what is different, diff this with the mongo.pl in the build Elena
recently uploaded at 
http://thebsh.namesys.com/benchmarks/mongo-2004.07.26.tar.gz.

I'm still rerunning tests to see if I can reproduce, but time is limited
this weekend.

David


