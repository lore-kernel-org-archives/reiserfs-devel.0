From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: More Slowdown
Date: Thu, 17 Nov 2005 13:02:34 +0100
Message-ID: <437C715A.206@ursynow.2a.pl>
References: <200511111359.39715.jgilmore@glycou.com>	 <200511120906.39109.jgilmore@glycou.com>	 <1131997263.10816.56.camel@teratron.lan.etheus.net>	 <200511142147.07787.chrivers@iversen-net.dk>	 <1132064829.8002.9.camel@teratron.lan.etheus.net> <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com> <437C0BF1.3080109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437C0BF1.3080109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: michael chang <thenewme91@gmail.com>, Craig Shelley <craig@microtron.org.uk>, reiserfs-list@namesys.com

Hans Reiser wrote:
> fsync can be dramatically better optimized, and it will be after the
> kernel merge work is completed.  This optimization will likely consist
> of reducing the tendency to merge atoms and handling fsync by using
> write twice algorithms to a fixed journal area.  Other improvements will
> doubtless be found when time is spent on it.  I am sorry that vim and
> evolution are suffering so much from our neglecting fsync until after
> the merge.  fsync is one of the things I would have us working on if I
> had my choice of what we improved in reiser4 rather than other persons
> making that choice for us at the moment.  Oh well, such is life in the
> society of men.;-)
> 
> It looks like akpm is going to start reading the reiser4 code.  I
> suspect his remarks will be a step above the ones made so far, he wrote
> such nice readahead code.
> 

Just want to add, that for desktop systems its only vim and evolution, 
but for my free hosting server it was very frequent system crashes 
(because of that i lost part of my database) and so on. Just want to 
warn anyone deciding to use reiser4 on server, to use 2.6.12 kernels or 
lower as this bug is almost not existent there.

For some uses of reiser4 this bug is very dangerous. Not just slow work 
of some application, but like i said data loss, system instability (few 
crashes every day), and so on.

I would say such a bug/design choice should be top priority, number one. 
Of course thats not true if reiser4 is meant to be only for home use. 
Just want to point that out, because it seems everybody is using reiser4 
only at home, and i am the only one on earth using it on server 
environment (i guess that wasn't the best idea...)

Thanks in advance for consideration of taking this bug to top of your 
TODO list.

