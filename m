From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 18:24:32 +0400
Message-ID: <200506221824.32995.zam@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org> <42B8B9EE.7020002@namesys.com> <42B8BB5E.8090008@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24457-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B8BB5E.8090008@pobox.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Garzik <jgarzik@pobox.com>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org

On Wednesday 22 June 2005 05:14, Jeff Garzik wrote:
> Hans Reiser wrote:
> > Christoph,
> >
> > Reiser4 users love the plugin concept, and all audiences which have
> > listened to a presentation on plugins have been quite positive about
> > it.  Many users think it is the best thing about reiser4.  Can you
> > articulate why you are opposed to plugins in more detail?  Perhaps you
> > are simply not as familiar with it as the audiences I have presented
> > to.  Perhaps persons on our mailing list can comment.....
> >
> > In particular, what is wrong with having a plugin id associated with
> > every file, storing the pluginid on disk in permanent storage in the
> > stat data, and having that plugin id define the set of methods that
> > implement the vfs operations associated with a particular file, rather
> > than defining VFS methods only at filesystem granularity?
>
> You're basically implementing another VFS layer inside of reiser4, which
> is a big layering violation.

Reiser4 suggests a bit more file types than VFS is aware of. I don't even 
think VFS should be.  It is enough that VFS allows each inode/file/dentry  to 
behave own way.  IIRC VFS object's ->foo_ops is for that.   

Reiser plugins are for the same.  Would you agree with reiser4 plugin design 
if the plugins will not dispatch VFS object methods calls by themselves but 
set ->foo_ops fileds instead?  I guess you don't like to have the two 
dispatching systems at the same level.

> This sort of feature should -not- be done at the low-level filesystem
> level.
>
> What happens if people decide plugins are a good idea, and they want
> them in ext3?  We need massive surgery to extract the guts from reiser4.if 
>
> 	Jeff

Thanks,
Alex

