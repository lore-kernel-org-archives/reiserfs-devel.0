From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 16:06:24 -0500
Message-ID: <20040810211428.3902E15D8F@mail03.powweb.com>
References: <20040810205450.GU9811@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810205450.GU9811@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Alex Zarochentsev' <zam@namesys.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, 'ReiserFS List' <reiserfs-list@namesys.com>



> 
> On Tue, Aug 10, 2004 at 03:40:14PM -0500, David Dabbs wrote:
> >
> > The solution I proposed is below, and I followed up that the wait should
> be in the iteration command, but it should probably be moved _after_ all
> reps as I have it below. This will sync/wait after all the phase
> iterations have run instead of after each individual phase iteration
> command. In either case it will not be timed. Sound right, Alex?
> 
> one "wait" should be at the old place still.
> 
[David Dabbs] 
I thought so, then second guessed it.

> but, I don't think we should measure writes w/o final cleaning of the fs
> cache.
> 
[David Dabbs] 
If you mean at phase end, yes that does sound right for write ops.


> 
> Reiser4 had no support for write throttling at some early stages of
> development, w/o final sync() it might look faster than physical disk
> drive.
> 
> > dd
> >

I have been running benchmarks with SYNC=off, as the mongo page recommends
against doing so. In configs where SYNC=ON we would omit the syncs/wais,
yes?

David 

