From: Chris Mason <mason@suse.com>
Subject: Re: Resier Fragmentation Effects (was compression vs performance)
Date: Fri, 09 Apr 2004 14:13:36 -0400
Message-ID: <1081534415.16461.10.camel@watt.suse.com>
References: <3DF9165145FACB4C96977FF650C1E9040C469DBF@its-mail1.its.corp.gwl.com>
	 <40763A44.4040107@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40763A44.4040107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: "Burnes, James" <james.burnes@gwl.com>, Stewart Smith <stewart@flamingspork.com>, Tom Vier <tmv@comcast.net>, Scott Young <youngs1@sunyit.edu>, reiserfs-list@namesys.com

On Fri, 2004-04-09 at 01:53, Hans Reiser wrote:
> Burnes, James wrote:
> 
> >I thought nearly all filesystems designed since Berkeley FFS were nearly
> >immune to fragmentation problems.
> >
> >After reading the following analysis at Harvard, it seems that
> >fragmentation is still a problem.
> >
> >http://www.eecs.harvard.edu/~keith/research/tr94.html
> >
> >  
> >
> Yeah, I wish I had read this in 94.  V3 suffers from the same problems 
> as FFS does as described in the abstract (all that I read, sorry about 
> that, I really am a bit busy, so unless someone suggests I should read 
> more.... ) .  V4 cures it though.

I put out some patches last week that try to deal with this in v3.  Take
a look through the archives for mail from me.

The v3 patches are an attempt to do better under common workloads.  I
think they are a big improvement, and I doubt there's much more that can
(or should) be done beyond simple tweaking.

v4 does a better job, and even if it doesn't, it should at least have
enough info in the metadata such that any problems can be fixed.

-chris


