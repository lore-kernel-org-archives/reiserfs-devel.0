From: Mike Benoit <mikeb@netnation.com>
Subject: Re: File system shootout v2.0...
Date: Fri, 17 Oct 2003 13:45:58 -0700
Message-ID: <1066423558.27235.159.camel@mikeb.staff.netnation.com>
References: <1066328379.27235.80.camel@mikeb.staff.netnation.com>
	 <3F8F8631.3010106@namesys.com>
	 <1066405769.27235.128.camel@mikeb.staff.netnation.com>
	 <3F903593.9080602@namesys.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F903593.9080602@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2003-10-17 at 11:31, Hans Reiser wrote:
> Mike Benoit wrote:
> 
> >On Thu, 2003-10-16 at 23:03, Hans Reiser wrote:
> >  
> >
> >
> > The thing I find interesting is that Reiser4 doesn't seem to
> >perform near as well with IOZone, as it does with Bonnie++, Infact
> >Reiser3 does slightly better in every IOZone test. 
> >
> >
> >  
> >
> To do well at IOzone, we need to carefully code to optimize for doing 
> small amounts of work with every system call, and make the code very 
> lightweight when doing so.  We would probably need to make the code 
> uglier and less well abstracted to do this. 
> 

Does this have anyhing to do with IOZone's "Recond Length" option by
chance? Though, that wouldn't seem to make sense, as the larger the
reclen I tried, the slower Reiser4 performed in comparison to the other
file systems. 

http://fsbench.netnation.com/new_hardware/2.6.0-test5/iozone.html

Nikita released a new snapshot today, so I'll try running some more
tests with a much wider range of benchmark options in the coming days.


So far though, I think the test5 and test7 kernels are making more of a
difference in the benchmark results then the new Reiser4 snapshot is. 

http://fsbench.netnation.com/new_hardware/combined/bonnie.html

As all the file system results have improved marginally, with the
exception of Reiser3, which seems to have improved almost 10%. Reiser4
in Extents mode is showing some fairly different numbers, mainly in
regard to CPU usage.

> I think I would rather add lots of plugins instead.  We probably will 
> make a modest effort to improve at IOzone, but not a big one.
> 
> If I can produce a filesystem that has more plugins and more features, 
> and wins at performance for disk IO intensive workloads, that is 
> probably more valuable than winning at both disk IO intensive and cache 
> intensive work loads.  At least that is my thinking.  Right now I think 
> that our performance is good enough that we should concentrate mostly on 
> debugging (fixing a few performance anomalies as we find them though), 
> ship what we have so users can use, and then focus on creating the 
> semantics that will make LongHorn's SQL look quite cumbersome in 
> comparison when operating on semi-structured data.
> 
> Performance is not my goal.  Performance is just a way point that I need 
> to reach so that I can resupply with cash for payroll purposes, get 
> enough market share that users will adopt semantic changes I introduce, 
> and then I can go LongHorn hunting.

I'm definitely looking forward to all the different plugins people will
create for Reiser4, it should prove to be quite interesting. 


-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

