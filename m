From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Thu, 22 May 2003 12:09:37 -0400 EDT
Message-ID: <11604422062-BeMail@cr593174-a>
References: <3ECCED08.2050709@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3ECCED08.2050709@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote on Thu, 22 May 2003 19:30:16 +0400:
> Forgive me for asking some bonehead questions.....
> 
> Are skip lists height balanced?  (All paths to the leaves are equal?)

Only on the average, at least in the original skip list algorithm.  The
height is determined randomly when the node is created; there is no
rebalancing.  The random distribution is defined as you would expect,
50% of the nodes have 1 level, 25% have 2 levels, ... 0.5**n of the
nodes have n levels.  Surprisingly, this works fairly well.

- Alex
