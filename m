From: Hans Reiser <reiser@namesys.com>
Subject: Re: [r4] a few benchmarks
Date: Sun, 17 Aug 2003 20:04:43 +0400
Message-ID: <3F3FA79B.2030700@namesys.com>
References: <20030816203028.GA14504@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15339-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030816203028.GA14504@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vs <vs@thebsh.namesys.com>, zam@thebsh.namesys.com
Cc: Cyrille Chepelov <cyrille@chepelov.org>, reiserfs-list@namesys.com

Cyrille Chepelov wrote:

>Hi all,
>
>I performed a couple of benchmarks on a spare machine, and put them online.
>
>I couldn't perform all the tests I wanted (see my previous "oops" message),
>the hardware is not exactly representative of today's machines, some details
>would use some tuning for more representative results, and I had
>ideas for extra things I'd like to measure, but here are today's results anyway
>for what it's worth: http://www.chepelov.org/cyrille/fsbench-results
>
>	-- Cyrille
>
>  
>
please look into how he measures fragmentation, reproduce his result, 
and figure out why we have any at all.  Cyrille is right that there 
should be none at all.

-- 
Hans


