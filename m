From: Chris Mason <mason@suse.com>
Subject: Re: fsync() Performance Issue
Date: 07 May 2002 21:22:53 -0400
Message-ID: <1020820973.8451.193.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CD8387F.5030107@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2002-05-07 at 16:26, Manuel Krause wrote:

> > The data logging stuff is beta code, if you have a good test bed where
> > it's ok if things go wrong I can make you a special patch with the
> > pending stuff merged.
> > 
> So, what should I do? I believed in ReiserFS stability so far more than 
> usual and it went o.k. since years. I would not consider my notebook a 
> safe test bed machine but I do know the value of uptodate backups. ;-)

;-) I'd wait a bit for the patches to stabilize.  As the development
slows down, it gets easier for me to spend the time on merging with
various things.  Plus, people like Yura integrate it into their
projects.  

> 
> When the reiserfs speedup patches will go into mainline, what they'll do 
> hopefully, you need to adjust your patches anyways:

Yes.

> BTW, why do you "not believe iicache should be good to use, because 
> similar functionality (with less overhead) can be achieved by 
> pagecache." as Oleg wrote today?! Is that true and why isn't that 
> realized yet?

I think the iicache is solid experimental work, and that it does a great
job of showing a place where reiserfs can improve performance.  Before
I'd suggest including it, I think we need to find the single best mode
of operation and get rid of all the other stuff.

The idea behind the iicache is to maintain a cache of the metadata in
the tree for use later on.  Yura did this by putting extra fields into
the reiserfs part of the inode, but I think it can also by done by just
mapping in the pages corresponding to the metadata.  There are
advantages to each approach, but I think using the pages as the backing
for the iicache will end up cleaner in the end.

Oleg is experimenting a little with this too, Yura deserves a lot of
credit not just for starting the iicache patch, but for maintaining it
over this long period of time.

-chris


