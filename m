From: Hans Reiser <reiser@namesys.com>
Subject: Re: Performance improvements to key comparison functions
Date: Tue, 13 Jul 2004 11:33:55 -0700
Message-ID: <40F42B13.3040009@namesys.com>
References: <20040712084615.29D4915F82@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19602-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040712084615.29D4915F82@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs wrote:

>It appears that by removing some conditionals in the reiser4 key comparison
>functions key comparison performance improves by at least 2x.
>Using a purpose-built znode_contains_key_strict and the new comparison code,
>cache scanning could be almost three times as fast -- even faster with a
>single unsigned char 'hint' member added to the znode structure. 
>
>A writeup, including the timings and the code, is available at
>
>	http://dabbs.net/reiser4
>
>
>I'd be interested in your feedback.
>
>
>David Dabbs
>
>
>
>
>  
>
Please let me know the results of your further testing and refinements.  
Thanks for your contribution to our work.

mongo is my preferred benchmark, it has a lot of settings that allow you 
to define the file set, and I encourage you to play with them.   If you 
call me, I'd enjoy talking with you about your work.

+1 510 482-2483, or cell phone of +1 510 435-9758

Hans
