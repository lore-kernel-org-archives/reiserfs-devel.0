From: Hans Reiser <reiser@namesys.com>
Subject: Re: Recursive modified-timestamp?
Date: Sun, 02 Jan 2005 09:52:33 -0800
Message-ID: <41D834E1.6030404@namesys.com>
References: <4329085595-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4329085595-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>
>Possibly.  But I'd like to generalize it a bit.  Percolated attributes are
>perhaps a better more general idea.  We already have inherited attributes
>(such as security of children being inherited from the parent) so going in
>the other direction isn't all that big step, it just needs an application,
>like your modification detection system.
>  
>
The general form of inheritance should not be restricted to inheriting 
from parents.  Parents should merely be a default if nothing is 
specified as what one inherits from.  And when one inherits, one can 
write through to what one inherits from, at least by default.

At least, such are my thoughts on the matter.

Hans
