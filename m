From: Jeff Garzik <jgarzik@pobox.com>
Subject: Re: reiser4 plugins
Date: Tue, 21 Jun 2005 21:14:06 -0400
Message-ID: <42B8BB5E.8090008@pobox.com>
References: <20050620235458.5b437274.akpm@osdl.org> <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B8B9EE.7020002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:
> Christoph,
> 
> Reiser4 users love the plugin concept, and all audiences which have
> listened to a presentation on plugins have been quite positive about
> it.  Many users think it is the best thing about reiser4.  Can you
> articulate why you are opposed to plugins in more detail?  Perhaps you
> are simply not as familiar with it as the audiences I have presented
> to.  Perhaps persons on our mailing list can comment.....
> 
> In particular, what is wrong with having a plugin id associated with
> every file, storing the pluginid on disk in permanent storage in the
> stat data, and having that plugin id define the set of methods that
> implement the vfs operations associated with a particular file, rather
> than defining VFS methods only at filesystem granularity?

You're basically implementing another VFS layer inside of reiser4, which 
is a big layering violation.

This sort of feature should -not- be done at the low-level filesystem level.

What happens if people decide plugins are a good idea, and they want 
them in ext3?  We need massive surgery to extract the guts from reiser4.

	Jeff



