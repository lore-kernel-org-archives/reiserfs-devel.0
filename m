From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: mongo benchmark results
Date: Mon, 26 Jul 2004 15:01:52 +0400
Message-ID: <20040726110152.GC4881@backtop.namesys.com>
References: <20040726055047.E145F15C29@mail03.powweb.com> <4104A933.7020509@namesys.com> <16644.49106.254644.433410@laputa.namesys.com> <20040726084315.GA4881@backtop.namesys.com> <16643.28049.628875.578115@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16643.28049.628875.578115@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Sun, Jul 25, 2004 at 12:21:37PM +0400, Nikita Danilov wrote:
> Alex Zarochentsev writes:
>  > On Mon, Jul 26, 2004 at 12:24:50PM +0400, Nikita Danilov wrote:
>  > > Hans Reiser writes:
>  > >  > David Dabbs wrote:
>  > >  > 
>  > >  > >At http://dabbs.net/reiser4/mongo.html I've posted some benchmarks from my
>  > >  > >aging but available test box. All numbers were generated with the Namesys
>  > >  > >mm7 snapshot. The "A.INFO_R4=new" are results from a reiser4 with modified
>  > >  > >comparison functions as well as znode_contains_key_strict(). So, here are my
>  > >  > >questions:
>  > >  > >
>  > >  > >Do these results appear consistent with others' recent benchmarking? 
>  > >  > >  
>  > >  > >
>  > >  > Increase file_size to 8k, and then we can compare.  This will reduce 
>  > >  > reiser4's space savings from 19% to 9%, but it will probably increase 
>  > >  > performance.
>  > >  > 
>  > >  > Your work had a remarkable effect on the create phase.  Very good work.  
>  > >  > I don't know why the impact was not larger for the stats phase.
>  > > 
>  > > Isn't this strange that changes to the key comparison function
>  > > improved _real_ time more than _cpu_ time?
>  > 
>  > cpu time is hidden :) A foreground process may just wait, when pdflush
>  > does all work.  We can't measure it by time(1).
> 
> In this case real time is less than twice larger than cpu time, but
> speedup is 9 times larger. Even if all (real - cpu) time were spent by
> mongo process waiting for pdflush that was only doing CPU work, such
> difference couldn't be explained.

Who said that new code improves CPU time for backgound pdflush/flush not more
than it improves foreground reiser_fract_tree?  It seems that the flush code
contains more key comparion ops than reiser4_write() which is expected to
spent most CPU time in copy_from_user().

-- 
Alex.
