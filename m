From: Brian Tinsley <btinsley@emageon.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 10:16:52 -0600
Message-ID: <3E3AA174.7040001@emageon.com>
References: <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>	 <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de>	 <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de>	 <3E3A6D76.7080300@namesys.com> <20030131123943.GH15359@marowsky-bree.de>	 <20030131160624.A12036@namesys.com>	 <1044021310.15684.154.camel@tiny.suse.com>	 <20030131170855.A13196@namesys.com> <1044023000.15680.180.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, Lars Marowsky-Bree <lmb@suse.de>, Hans Reiser <reiser@namesys.com>

Chris Mason wrote:

>But not a recent example of someone using them in a high end
>configuration.  It's even possible that someone has, but doing it over
>time for release after release?  Those are the customers that end up
>going to redhat and suse.
>
>-chris
>
Here's a good case study on this topic:

We started out a couple of years ago with a RedHat distro that we found 
a problem with and could not get a fix for *in any timely manner*, so I 
started using vanilla 2.4.17 kernel with the patch I required. Over 
time, we started seeing numerous other subtle problems that drove our 
service guys and customers crazy because they were difficult to pinpoint 
and caused a lot of down time. So I would eventually track down the 
problem, find a patch, and redeploy a new kernel. I am neither a sys 
admin (in this job) nor a kernel maintainer, so I got sick of this cycle 
quickly. By this time, a new Red Hat distro rolled out that I tested and 
verified that it addressed all of our previous problems. Frankly, I was 
elated, and we brought most of our existing systems up to this new level 
quickly and started loading it on new systems. Well, it didn't take very 
long before I found myself right back in the same boat (those that use 
the linux-ha heartbeat software know what I'm talking about here!). 
AFAIK, this problem is *still* not fixed and a precise bug report was 
posted many months ago. So, here we go to vanilla kernels 2.4.19, and 
soon thereafter, 2.4.20. Guess what happens now? Linux VM problems, 
really *stupid* ones in my opinion, start hitting a select few of our 
systems; of course they are the most critical ones! Thankfully, I 
happened to notice a couple of postings on LKML of others having 
seemingly the same problem, so I start talking to them. It didn't take 
long before one of the VM developers got involved and worked one-on-one 
with me to analyze my problem and within 2 days, I had it fixed (for 
anyone interested, the 2.4.20-aa1 kernel was the silver bullet). So, now 
I spend endless hours in the lab testing this kernel and eventually many 
more hours overseeing the upgrade of numerous sites. Guess what happens 
next? It's good news this time! Not a *single* (kernel based) problem 
from any of the sites running this new kernel! The downside is that I am 
once again exhausted by having to maintain the kernel. So now I've 
extended the opportunity to SuSE to try and make my life easier (but 
haven't heard back from them yet, Lars ;) ). What will happen next, I 
dare not even guess, but having worked on some level with a few people 
at SuSE and being educated about their products offerings recently, I 
have to say that I am confident things will work out.


-- 

Brian Tinsley
Chief Systems Engineer
Emageon



