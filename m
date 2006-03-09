From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Thu, 09 Mar 2006 11:52:58 -0800
Message-ID: <4410879A.5010606@namesys.com>
References: <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz> <4407944F.5030206@suse.com> <20060303100407.GF2855@atrey.karlin.mff.cuni.cz> <4408C080.4070600@suse.com> <20060306115926.GL1175@atrey.karlin.mff.cuni.cz> <440DFD7A.9040000@suse.com> <20060308182014.GC14184@atrey.karlin.mff.cuni.cz> <440F2C81.3@suse.com> <20060308231426.GI14934@schatzie.adilger.int> <44107366.5090407@namesys.com> <44107DE5.7040707@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44107DE5.7040707@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Jan Kara <jack@suse.cz>, ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

Jeff Mahoney wrote:

>
>
> And as I've said before, Hans, if the original code base was capable of
> supporting the plethora of items the white paper hyped, we wouldn't have
> run into this problem either.

This is an odd criticism.  V3 never pretended to have item plugins.  V4
does.  If you add a new item plugin to V4, it will work quite well.

>
> I would have loved to have implemented xattrs as another item type, but
> as soon as I did that, the kernel crashed almost instantly on not
> recognizing the new item type in the balance code. While it was
> certainly fixable in that version, properly fixing it would have
> required a ReiserFS 3.7 with capability bits similar to ext[23]. Looking
> back, maybe that wouldn't have been such a bad thing.

All of the performance issues and stable code destabilization issues you
are experiencing now are what I expected, and what motivated my wanting
to defer acls for V4, and by so doing (and thus concentrating our
development resources on V4) advance the schedule for V4.

>
> As for waiting for v4, we've been through this before. Users wanted ACLs
> on ReiserFS yesterday, and I'd hardly brush aside features that users
> have been demanding as marketing.

There is a difference between brushing them aside, and choosing to put
them into the next major release because proper solution of them
requires deeper work than stuffing them into a file.  

Also, marketing is important.  The problem is when marketing motivates
wishful thinking about the shape of the code.  Architecture is like
sculpting, you must sense what the wood or marble wants to be shaped
into as clearly as you see the vision in your head of what you want it
to be.   When it won't support the shape you want, then in sculpting you
need another piece of wood, and in programming you need another major
release.

That said, I understand you are seeking to provide the users with what
they want, and that while we disagree on the best strategy for that, we
both try to do the best we can for the users.

> There's no denying that a
> reiser4-based solution would have been cleaner, but sometimes we just
> have to make do with what we've got.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

