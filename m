From: Mike Benoit <mikeb@netnation.com>
Subject: Re: File system shootout v2.0...
Date: Fri, 17 Oct 2003 08:49:29 -0700
Message-ID: <1066405769.27235.128.camel@mikeb.staff.netnation.com>
References: <1066328379.27235.80.camel@mikeb.staff.netnation.com>
	 <3F8F8631.3010106@namesys.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F8F8631.3010106@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, 2003-10-16 at 23:03, Hans Reiser wrote:
> Mike Benoit wrote:
> 
> >Since the last shootout was so popular, I was able to get my hands on
> >some better hardware to run even more tests on. As well the generated
> >results format was improved slightly. 
> >
> >Bonnie++ and IOZone results on a AMD Opteron 240 system are now posted
> >for your viewing pleasure at: http://fsbench.netnation.com/
> >
> >  
> >
> We have a new snapshot on the way that does much better at this 
> benchmark (we fixed a bug thanks to spotting a performance anomaly while 
> replicating your settings, and the snapshot you are using is actually 
> quite old thanks to our neglect of posting snapshots).
> 
> I will be interested in seeing whether once you and us are using the 
> same snapshot we get the same results.;-) 
> 
> It is a bit odd that reiser4 has both the lowest run time and the worst 
> rating.  We use middle of the road 32 bit CPUs (we'd like to use the 
> latest ones but....;-) ).  For them our CPU consumption seems reasonable.

I assume your referring to the "overall rating" column? The only reason
of course is because Reiser4 uses the most CPU of any other FS I've
tested. The thing I find interesting is that Reiser4 doesn't seem to
perform near as well with IOZone, as it does with Bonnie++, Infact
Reiser3 does slightly better in every IOZone test. 

I look forward to taking the new snapshot out for a test drive. ;) 

PS. Even though I'm running an opteron, I'm have not compiled the kernel
or any other app with a 64bit compiler.

-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

