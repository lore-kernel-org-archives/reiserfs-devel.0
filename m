From: "David Dabbs" <david@dabbs.net>
Subject: Re: reiser4 went into -mm
Date: Fri, 20 Aug 2004 18:25:36 -0000
Message-ID: <20040820182536.11CAF15E7E@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20441-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>


>
>Hans, the notes akpm put into the 2.6.8.1-mm2 ChangeLog include the following:
>
>If you see results that are much different from those at
>www.namesys.com/benchmarks.html, let us know.
>
>but the latest benchmarks available there are from March against 2.6.5-rc2.
>Does this mean that neither R4 nor other filesystems' performance has changed since then or do you expect potential users to run their own updated benchmarks?
>
>David
>
>
>If they have changed, I want to know about it.....;-)
>
>David, we should work on getting your key comparison patch evaluated.  
>Zam, please look into it when you can, and send me your todo list 
>because I fear it is very full.
>

If I were at home and not at my in-laws' place in western Mass. I would be finalizing this. What has held it up on my end is the intermittent inability to 
finish a mongo run without some sort of problem. This is why I was inquiring about mongo's mounting/unmounting. If it is simply that my hardware is dodgy, then I'll need to find another platform on whichg to test. 

When I return home at the end of the month I'll base the patch on the 2.6.8.1-mmX, test it and forward a copy.

David

