From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sun, 28 Mar 2004 08:40:33 -0800
Message-ID: <40670001.60302@namesys.com>
References: <200403271537.52955.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403271537.52955.sikkh@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Piotr Neuman <sikkh@wp.pl>
Cc: Reiserfs-List@namesys.com

Piotr Neuman wrote:

>The new naming scheme for plugins ("metas" in snapshot 2004.03.26) may on 
>certain occasions cause name clashes. This patch changes "metas" into 
>"..metas" which should avoid this problem in most cases.
>
>  
>
The name clashing is less important than the greater user friendliness.  
Users on the mailing list convinced me of this.

-- 
Hans

