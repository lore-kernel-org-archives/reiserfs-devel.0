From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 15:24:25 -0400
Message-ID: <1081279465.30829.128.camel@watt.suse.com>
References: <1081210239.4994.69.camel@watt.suse.com>
	 <200404061838.05099.christian.mayrhuber@gmx.net>
	 <4072F6F1.3090806@mweb.co.za> <1081277245.30813.81.camel@watt.suse.com>
	 <4073022E.3090100@mweb.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4073022E.3090100@mweb.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: camis <camis@mweb.co.za>
Cc: reiserfs-list@namesys.com

On Tue, 2004-04-06 at 15:17, camis wrote:
> >>Has anyone done any throughput/benchmarks for the various
> >>new patches/code?
> > 
> > The block allocator stuff is fresh from the oven and still warm inside. 
> > I'll be posting benchmarks for it as the week goes on.
> 
> Something interesitng:
> I have 8 dell 2650's (dual xeon 2.8ghz+hyperthreading) and i've setup
> the one machine above with the patches.. All 8 machines are incoming
> MX/smtp machines which handle quite large loads (5gigs of mail per day).
> 
> machine 1: 
> (mounted:noatime,nodiratime,data=ordered,alloc=skip_busy:dirid_groups,packing_groups)
> 
>   21:16:17  up 12:17,  1 user,  load average: 0.45, 1.04, 1.07
> 375 processes: 374 sleeping, 1 running, 0 zombie, 0 stopped
> CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
>             total    7.2%    0.0%   32.4%   0.0%     0.8%    5.2%  353.2%
>             cpu00    1.8%    0.0%   10.6%   0.1%     0.9%    1.3%   85.0%
>             cpu01    1.5%    0.0%    7.4%   0.0%     0.1%    0.9%   89.9%
>             cpu02    1.7%    0.0%    7.0%   0.0%     0.1%    1.7%   89.3%
>             cpu03    1.8%    0.0%    7.4%   0.0%     0.1%    1.5%   88.9%
> 
> Iowait total stays hovering at around the 6->8% mark..
> 
> machine 2->8: (mounted: noatime,nodiratime)
> 
>   21:14:31  up 1 day,  8:41,  1 user,  load average: 0.43, 0.72, 0.66
> 392 processes: 391 sleeping, 1 running, 0 zombie, 0 stopped
> CPU states:  cpu    user    nice  system    irq  softirq  iowait    idle
>             total    8.0%    0.0%   35.2%   0.0%     1.6%    0.8%  352.8%
>             cpu00    2.0%    0.0%   11.1%   0.1%     1.5%    0.3%   84.6%
>             cpu01    2.0%    0.0%    7.7%   0.0%     0.3%    0.1%   89.5%
>             cpu02    2.2%    0.0%    7.7%   0.0%     0.0%    0.3%   89.5%
>             cpu03    1.8%    0.0%    8.7%   0.0%     0.0%    0.0%   89.3%
> 
> The majority of the rest of the machines iowait hover around the 1%
> mark.. CPU time tends to be about the same, just the iowait is much
> much higher..

Very interesting.  data=ordered makes fsync more expensive, since it
ends up syncing more then just the buffers for that one file.  Could you
please try removing data=ordered from machine1?

-chris


