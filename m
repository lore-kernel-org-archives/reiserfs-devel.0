From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: mongo benchmark results
Date: Mon, 26 Jul 2004 21:08:36 +0400
Message-ID: <20040726170835.GE4881@backtop.namesys.com>
References: <20040726055047.E145F15C29@mail03.powweb.com> <4104A933.7020509@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4104A933.7020509@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elena Gryaznova <grev@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Sun, Jul 25, 2004 at 11:48:19PM -0700, Hans Reiser wrote:
> David Dabbs wrote:
> 
> >At http://dabbs.net/reiser4/mongo.html I've posted some benchmarks from my
> >aging but available test box. All numbers were generated with the Namesys
> >mm7 snapshot. The "A.INFO_R4=new" are results from a reiser4 with modified
> >comparison functions as well as znode_contains_key_strict(). So, here are 
> >my
> >questions:
> >
> >Do these results appear consistent with others' recent benchmarking? 
> > 
> >
> Increase file_size to 8k, and then we can compare.  This will reduce 
> reiser4's space savings from 19% to 9%, but it will probably increase 
> performance.
> 
> Your work had a remarkable effect on the create phase.  Very good work.  
> I don't know why the impact was not larger for the stats phase.
> 
> Elena, please reproduce his results on our hardware.

2 Lena:

I have added a cpu utilization stat (ratio of system time for all cpus to total
time, in percents) to mongo.pl.

Please take new mongo before repeating the benchmark.

-- 
Alex.
