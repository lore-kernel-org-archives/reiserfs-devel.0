From: Oleg Drokin <green@namesys.com>
Subject: Re: free space seems wrong...
Date: Thu, 6 Mar 2003 09:47:05 +0300
Message-ID: <20030306094705.A5417@namesys.com>
References: <1046886804.23752.25.camel@calculon>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1046886804.23752.25.camel@calculon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Mar 05, 2003 at 06:53:24PM +0100, Soeren Sonnenburg wrote:

> is_leaf: free space seems wrong: level=1, nr_items=7, free_space=3468 rdkey 
> vs-5150: search_by_key: invalid format found in block 4792161. Fsck?
> is_leaf: free space seems wrong: level=1, nr_items=7, free_space=3468 rdkey 
> vs-5150: search_by_key: invalid format found in block 4792161. Fsck?
> when accessing a certain directory using du and on the prompt
> Input/output error.

This is a sign of filesystem corruption,

> The disk was full somewhen but now is only half full.

This "free space" relates to in-tree nodes, not general filesystem situation.

> Should I be worried / is it necessary to fix the filesystem ?

Sure, you'd better run reiserfsck and follow it's advices.
Be sure to use latest reiserfsprogs.

> The problem is, this filesystem is like 2-3 years old and was converted
> to reiserfs 3.6 maybe a year ago...but as it is a production environment
> I would not want to put it down at all...

You can run reiserfs --check even on readonly mounted fs just to get idea
on how broken it is and then to plan what to do next.

Bye,
    Oleg
