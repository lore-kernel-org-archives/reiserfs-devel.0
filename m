From: cami <camis@mweb.co.za>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Fri, 05 Mar 2004 06:21:05 +0200
Message-ID: <40480031.3080301@mweb.co.za>
References: <4044119D.6050502@andrew.cmu.edu> <200403030700.57164.robin.rosenberg.lists@dewire.com> <1078307033.904.1.camel@teapot.felipe-alfaro.com> <200403031059.26483.robin.rosenberg.lists@dewire.com> <1078309141.863.3.camel@teapot.felipe-alfaro.com> <4047DF05.8080209@tequila.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4047DF05.8080209@tequila.co.jp>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> as for me I stopped using raiser, jfs or xfs at home. why? too many
> negative experience. bad blocks (xfs total b0rked), raiserfs (similar
> things) and I even didn't try jfs. with ext3 it works very well.

I've had ext3 corruptions of note.. Running ext3 on squid's caching
partition (expensive hardware + raid1+0 setup), what i'd have was if
any proccess wrote to that caching partition, it would lock up the
process.. even an rm on any file inside that partition would lock up
rm.. after shutting down the machine, and _reformatting_ that partition
with mkfs, it *still* done the same thing.. After getting fed up being
unable to resolve the problem, i formatted that partition with reiserfs
and have never looked back since.. This type of problem i've have on
more than one occasion with ext3.. In the last couple of years i havent
had one single issue with reiserfs, and will continue to use/support it.

Regards,
Cami
