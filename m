From: Christoph Hellwig <hch@infradead.org>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 15:29:47 +0100
Message-ID: <20050622142947.GA26993@infradead.org>
References: <20050620235458.5b437274.akpm@osdl.org> <42B8B9EE.7020002@namesys.com> <42B8BB5E.8090008@pobox.com> <200506221824.32995.zam@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200506221824.32995.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Zarochentsev <zam@namesys.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org

On Wed, Jun 22, 2005 at 06:24:32PM +0400, Alexander Zarochentsev wrote:
> Reiser plugins are for the same.  Would you agree with reiser4 plugin design 
> if the plugins will not dispatch VFS object methods calls by themselves but 
> set ->foo_ops fileds instead?  I guess you don't like to have the two 
> dispatching systems at the same level.

That is exactly the point I want to make.  I haven't looked at the design
in detail for a long time, but schemes to allow different object to have
different operation vectors is a good idea.  We already have that to
varying degrees in all filesystems, and making that more formal is a good
thing.  
