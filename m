From: Hans Reiser <reiser@namesys.com>
Subject: Re: Performance improvements to key comparison functions
Date: Wed, 14 Jul 2004 00:03:44 -0700
Message-ID: <40F4DAD0.1060307@namesys.com>
References: <20040713221928.70FA315D92@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040713221928.70FA315D92@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs wrote:

>Scratch the per-level caching idea. What was I thinking? A cached node's
>level is not invariant.
>
Yes it is, for balanced trees at least.

> But (pardon my ignorance of the tree operations)
>could nodes at different tree levels have ld_/rd_key ranges within which the
>key sought could fit, or is the level check present to avoid key comparisons
>against nodes that cannot possibly match (because the level is different)?
>  
>
I don't quite understand you.  Any given key will have at least one node 
(more than one only if there are multiple items with the same key, which 
happens for directory items if hashing is not perfect)  into which it 
falls at each level of the tree.

>
>david
>
>
>
>
>  
>

