From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 22:53:40 +0400
Message-ID: <200208152253.40413.vitaly@namesys.com>
References: <200208152007.42370.degerrit@web.de> <200208152227.21766.vitaly@namesys.com> <200208152036.35333.degerrit@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208152036.35333.degerrit@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gerrit Hannaert <degerrit@web.de>, reiserfs-list@namesys.com


Hi, 

On Thursday 15 August 2002 22:36, Gerrit Hannaert wrote:
> > why did you decided to run fix-fixable? You run --check just before it
> > and it said to run --fix-fixable or what?
>
> Er... I confess it was just a hunch, I did run --check but as I recall it
> did not tell me to, it did say there were corruptions in any case. The
> filesystem needed fixing and fix-fixable seemed less drastic than
> rebuild... (The undeletable files were basically a thorn in my eye and I
> just wanted to be sure there were no corruptions other than these clearly
> visible ones).

Last reiserfscks say either 
There were found %d corruptions which can be fixed only during --rebuild-tree
or 
There were found %d corruptions which can be fixed with --fix-fixable
or 
No corruptions found.	

Do you remember what was there?

> > Did reiserfsck finish its work or (was)stopped/failed?
>
> Yes, reiserfsck finished properly.
>
> > > What went wrong here?
> > > Will reiserfsck --rebuild-tree fix this? Or is the error some
> > > compilation thing? What are my chances to recover the filesystem?
> >
> > Chances are good. No data ware lost and I am checking how reiserfsck
> > handle direcory nlinks now.
>
> It would be nice to recover most of the fs. I'd probably be better using
> some standard, tested reiserfsck-binaries over my own this time I suppose?

No problem in reiserfsck 3.6.3 found for now. I have just run --fix-fixable 
on a test partition, evth is fine. 

Ah, I guess I know what happened. I think you have some fatal corruptions and 
rebuild-tree is required. In this case check and fix-fixable do not perform 
semantic check.

To be able to solve the problem with nlinks without rebuild-tree, fix-fixable 
zeros them on the first check and increment nlinks during the semantic pass.

To check this guess - when you run check do you have the phrase:
Fatal corruptions were found, Semantic pass skipped?


-- 

Thanks,
Vitaly Fertman
