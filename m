From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins (the technical email in this flame fest)
Date: Thu, 23 Jun 2005 06:17:48 -0700
Message-ID: <42BAB67C.6030407@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org> <42B8B9EE.7020002@namesys.com> <42B8BB5E.8090008@pobox.com> <200506221824.32995.zam@namesys.com> <20050622142947.GA26993@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050622142947.GA26993@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexander Zarochentsev <zam@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org

Since this did not get an answer, and since it is the technical email in
the flamefest, I thought I would resend it appropriately labeled.

Correct me if I am wrong:

What exists currently in VFS are vector instances, not classes. Plugins,
selected by pluginids, are vector classes, with each pluginid selecting
a vector class. You propose to have the vector class layer (aka plugin
layer) in reiser4 export the vector instance to VFS for VFS to handle
for each object, rather than having VFS select reiser4 and reiser4
selecting a vector class (aka plugin) which selects a method.

If we agree on the above, then I will comment further.

Christoph Hellwig wrote:

>On Wed, Jun 22, 2005 at 06:24:32PM +0400, Alexander Zarochentsev wrote:
>  
>
>>Reiser plugins are for the same.  Would you agree with reiser4 plugin design 
>>if the plugins will not dispatch VFS object methods calls by themselves but 
>>set ->foo_ops fileds instead?  I guess you don't like to have the two 
>>dispatching systems at the same level.
>>    
>>
>
>That is exactly the point I want to make.  I haven't looked at the design
>in detail for a long time, but schemes to allow different object to have
>different operation vectors is a good idea.  We already have that to
>varying degrees in all filesystems, and making that more formal is a good
>thing.  
>
>
>  
>


