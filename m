From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: in reiser4 can extent pointer exist at any level
Date: Fri, 21 Jan 2005 12:19:39 +0300
Message-ID: <1106299179.3200.21.camel@tribesman.namesys.com>
References: <20050120171834.54511.qmail@web60108.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050120171834.54511.qmail@web60108.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pallavi Dalya <pallavidalya@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-01-20 at 20:18, Pallavi Dalya wrote:
> Hello,
> 
>       In reiser4 only the node pointer items are
> present throughout the tree except for the leaves of
> the tree and the other items like the tail policy
> item,directory entry items and stat data items are
> present in the leaf nodes.
>       But recently I came accross a extent pointer
> present in the root of the tree in reiser4. Is this
> possible.

Extent items can be at level which is above the leaf one only.
So, if your tree height is 2 - you can have extebt item in the tree
root. If you see something else - you have encountered a bug.

>       But according to the theory all the data should
> be present at the lower level (i.e the leaf level) of
> the tree. Then how can an extent pointer exist at any
> level but the leaf of the tree.
> 
> Pallavi
>  
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> 

