From: cami <camis@mweb.co.za>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Sat, 06 Mar 2004 00:30:12 +0200
Message-ID: <4048FF74.70508@mweb.co.za>
References: <4044119D.6050502@andrew.cmu.edu> <200403030700.57164.robin.rosenberg.lists@dewire.com> <1078307033.904.1.camel@teapot.felipe-alfaro.com> <200403031059.26483.robin.rosenberg.lists@dewire.com> <1078309141.863.3.camel@teapot.felipe-alfaro.com> <4047DF05.8080209@tequila.co.jp> <40480031.3080301@mweb.co.za> <4048E878.5070505@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17102-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4048E878.5070505@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>> I've had ext3 corruptions of note.. Running ext3 on squid's caching
>> partition (expensive hardware + raid1+0 setup), what i'd have was if
>> any proccess wrote to that caching partition, it would lock up the
>> process.. even an rm on any file inside that partition would lock up
>> rm.. after shutting down the machine, and _reformatting_ that partition
>> with mkfs, it *still* done the same thing.. After getting fed up being
>> unable to resolve the problem, 
> 
> Did you post to the ext3-users list on this?

Live/Production machines leave very little time for proper debugging..
(so to answer your question, no..)

> Were your processes stuck in "D" state, or did you have high systems times?

Even with the machine rebooted, i was still experiencing the same
thing..

> If so, you could have configured squid to put fewer files in each 
> directory, or use the htree patch (for 2.4 kernels) or it's in by 
> default in 2.6.

Doesnt make much sense, even when reformatting the disk with ext3
again, proved to be useless.. After about 20 seconds with squid
running, the same issues would arise.. The machine was up for
about 40 days before the issues occured..

Regards,
Cami
