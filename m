From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH 4/4] reiserfs: on-demand bitmap loading
Date: Tue, 17 Jan 2006 11:03:31 -0800
Message-ID: <43CD3F83.3060207@namesys.com>
References: <20060117135417.GA8374@locomotive.unixthugs.org> <43CD38B1.2020804@namesys.com> <43CD3EA1.80709@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CD3EA1.80709@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

> Hans Reiser wrote:
>
> >Are you saying that you allow bitmaps to be unloaded?  If yes, how about
> >making that a separate option, and not the default?
>
>
> They're released, yes. Whether or not they're unloaded is up to the rest
> of the system, vm pressure, etc to determine. This isn't any different
> than the patch I posted before, which you ultimately approved in
> September.
>
> If the bitmaps are to be pinned at all, I'd prefer to make *that* the
> option. ReiserFS's behavior with respect to bitmaps is inconsistent with
> every other Linux file system. I'd prefer to make the dynamic bitmaps
> the default, and if you really must, add an option to continue to pin
> them.
>
> The fact remains that the bitmap blocks are infrequently accessed in
> comparison with other bits of metadata that we don't pin. They're not
> accessed at all in a read-only environment, and barely accessed in a
> light-write workload. If the bitmaps are truly in demand for heavy
> writing, the caches should keep those blocks in memory, the same as they
> do on other file systems. If another file system, application, or kernel
> subsystem needs that memory more, it should be available for it to claim.

Ok.

>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

