From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: mongo benchmark results
Date: Mon, 26 Jul 2004 12:54:10 +0400
Message-ID: <20040726085410.GB4881@backtop.namesys.com>
References: <20040726055047.E145F15C29@mail03.powweb.com> <4104A933.7020509@namesys.com> <16644.49106.254644.433410@laputa.namesys.com> <20040726084315.GA4881@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040726084315.GA4881@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Clusterfs.COM>
Cc: Hans Reiser <reiser@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Mon, Jul 26, 2004 at 12:43:15PM +0400, Alex Zarochentcev wrote:
> On Mon, Jul 26, 2004 at 12:24:50PM +0400, Nikita Danilov wrote:
> > Hans Reiser writes:
> >  > David Dabbs wrote:
> >  > 
> >  > >At http://dabbs.net/reiser4/mongo.html I've posted some benchmarks from my
> >  > >aging but available test box. All numbers were generated with the Namesys
> >  > >mm7 snapshot. The "A.INFO_R4=new" are results from a reiser4 with modified
> >  > >comparison functions as well as znode_contains_key_strict(). So, here are my
> >  > >questions:
> >  > >
> >  > >Do these results appear consistent with others' recent benchmarking? 
> >  > >  
> >  > >
> >  > Increase file_size to 8k, and then we can compare.  This will reduce 
> >  > reiser4's space savings from 19% to 9%, but it will probably increase 
> >  > performance.
> >  > 
> >  > Your work had a remarkable effect on the create phase.  Very good work.  
> >  > I don't know why the impact was not larger for the stats phase.
> > 
> > Isn't this strange that changes to the key comparison function
> > improved _real_ time more than _cpu_ time?
> 
> cpu time is hidden :) A foreground process may just wait, when pdflush
> does all work.  We can't measure it by time(1).

I think we should calculate cpu utilization from /proc/stat values
same way as vmstat(8) does.

-- 
Alex.
