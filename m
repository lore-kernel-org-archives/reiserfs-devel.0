From: Hans Reiser <reiser@namesys.com>
Subject: Re: searching on groups of files in reiser4
Date: Wed, 27 Apr 2005 07:24:29 -0700
Message-ID: <426FA09D.8090009@namesys.com>
References: <20050417113856.155b8166.a.nielsen@shikadi.net> <426F934D.504@maya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23928-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <426F934D.504@maya.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nicolas Smallwood <smallwood@maya.com>
Cc: reiser <reiserfs-list@namesys.com>

Nicolas Smallwood wrote:

> Hello,
>
> My question concerns searching through a group of files on reiser4.
> Assume that we are dealing with a directory full of files (say a few 
> million or so).
>
> If I am currently viewing a given file, and wish to iterate to the 
> next file in the directory,
> is there a method to do so without opening the base directory and 
> moving from one
> directory entry to the next until you find it?
>
> In short, are there any constructs to perform a binary search on these 
> directories instead of a slow
> O(n) search using seekdir or whatever method?
>
> Or is some type of plugin our best route?

We can write some sort of plugin for you, and it will be the best 
solution.  I assume that readdir() does not do what you need because the 
order you need to iterate in is not that of readdir()?  (Your exact 
phrasing would seem to indicate that your needs are met by iterating 
through the directory using readdir() ).

>
>
> Thank You,
>
> Nicolas Smallwood
> Maya Design
>
>
>

