From: Chris Mason <mason@suse.com>
Subject: Re: Status data loggin patches?
Date: Thu, 04 Dec 2003 11:38:59 -0500
Message-ID: <1070555939.27612.190.camel@tiny.suse.com>
References: <20031203T1502.GA.5b882.stse@fsing.fs.uni-sb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031203T1502.GA.5b882.stse@fsing.fs.uni-sb.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephan Seitz <nur-ab-sal@gmx.de>
Cc: reiserfs-list@namesys.com

On Wed, 2003-12-03 at 09:07, Stephan Seitz wrote:
> Hi!
> 
> Can someone please explain the status of the data logging patch?
> 
> It should be included in 2.4.23, but it is not there. Was it not sent 
> or was it rejected?
> 

I was trying to finalize journal-header patch, which improves
performance and data=ordered features in general.  But a few other
things ended up sucking down too much time and it didn't happen in time
for 2.4.23.  I think it is best right now for me to concentrate on 2.6
instead.

> Are there versions for 2.6 to test? I would like to test the new 
> kernel, but not without data logging patch.
> 

2.6 data logging is coming along.  Data logging is actually a few
different pieces, and I'm pulling them apart for the 2.6 port.  First is
better performance for small transactions, second is the actual
data=ordered/data=journal code.

-chris


