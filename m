From: Hans Reiser <reiser@namesys.com>
Subject: Re: File system shootout v2.0...
Date: Fri, 17 Oct 2003 22:31:47 +0400
Message-ID: <3F903593.9080602@namesys.com>
References: <1066328379.27235.80.camel@mikeb.staff.netnation.com>	 <3F8F8631.3010106@namesys.com> <1066405769.27235.128.camel@mikeb.staff.netnation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1066405769.27235.128.camel@mikeb.staff.netnation.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mikeb@netnation.com
Cc: reiserfs-list@namesys.com

Mike Benoit wrote:

>On Thu, 2003-10-16 at 23:03, Hans Reiser wrote:
>  
>
>
> The thing I find interesting is that Reiser4 doesn't seem to
>perform near as well with IOZone, as it does with Bonnie++, Infact
>Reiser3 does slightly better in every IOZone test. 
>
>
>  
>
To do well at IOzone, we need to carefully code to optimize for doing 
small amounts of work with every system call, and make the code very 
lightweight when doing so.  We would probably need to make the code 
uglier and less well abstracted to do this. 

I think I would rather add lots of plugins instead.  We probably will 
make a modest effort to improve at IOzone, but not a big one.

If I can produce a filesystem that has more plugins and more features, 
and wins at performance for disk IO intensive workloads, that is 
probably more valuable than winning at both disk IO intensive and cache 
intensive work loads.  At least that is my thinking.  Right now I think 
that our performance is good enough that we should concentrate mostly on 
debugging (fixing a few performance anomalies as we find them though), 
ship what we have so users can use, and then focus on creating the 
semantics that will make LongHorn's SQL look quite cumbersome in 
comparison when operating on semi-structured data.

Performance is not my goal.  Performance is just a way point that I need 
to reach so that I can resupply with cash for payroll purposes, get 
enough market share that users will adopt semantic changes I introduce, 
and then I can go LongHorn hunting.

-- 
Hans


