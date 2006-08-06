From: Hans Reiser <reiser@namesys.com>
Subject: article abour Reiser4 on linux.com
Date: Sun, 06 Aug 2006 03:19:57 -0600
Message-ID: <44D5B43D.3060501@namesys.com>
References: <87bqqzbaug.fsf@baldur.nicundtas.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87bqqzbaug.fsf@baldur.nicundtas.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Byfield <bbyfield@axion.net>
Cc: Tassilo Horn <heimdall@uni-koblenz.de>, reiserfs-list@namesys.com

Bruce, regarding "a longstanding convention of avoiding plugins in the
kernel", considering that we are the first and only ones ever to have
plugins, and considering the existence of binary kernel modules, I don't
think your characterization is accurate.  Perhaps there was some
licensing controversy on lkml I am unaware of?  Since plugins are
(always) compiled in, unlike kernel modules, I don't see how there is a
licensing issue.

I think your characterization of plugins as something we impose on the
VFS is unfair.  Plugins exist entirely internally to reiser4 --- we
impose nothing on anyone.  I only wish to impose my views on Reiser4,
not on VFS, because I really don't care for haggling with others about
the code they wrote not having the features I want.  I don't think you
should characterize me as saying coding style conformity is the issue:
that is how my opponents portray it, as some sort of 80 characters vs.
120 characters per line disagreement in which I refuse to go along.  I
think social connections prevailing over technical merits is the issue,
and perhaps also whether VFS should intrude deeply into the independence
of filesystem design based on the assumption that the VFS authors are
more likely to get it right, or whether it should let each filesystem do
what it wants to do based on the hope that if enough people try their
own thing in a decentralized system, odds are that one of them will get
it more right than the others and users will be able to choose that FS.

I never made a reference to Steve Lord or Jim Lord, so suggesting that I
got it wrong about him is inaccurate. 

Your characterization of the issue of whether Linux should double its
filesystem performance as a philosophical point seems odd to me --- I
think my writing failed to reach you as an audience on that point.

Reiser4 was first proposed for inclusion in October 2002, and a casual
reader of your article would think it was proposed in 2005.

Many journalists will run my words past me to see if it fairly portrays
my views --- perhaps you might choose to do that with those you write
about in the future.  In my experience it is a good journalistic practice.

On a positive note, it seems like Andrew Morton will singlehandedly turn
the Reiser4 review process into a technical not a political process, and
I am much encouraged by that.  He has made numerous useful technical
remarks in his last email, and we are addressing them.

Thanks for your time,

Hans


Tassilo Horn wrote:

>Hi,
>
>there's another Reiser4 article on linux.com [1], mainly about
>politics. Neither much of the technical discussion is covered, nor are
>the comments too positive, but it may be interesting anyway.
>
>One thing which bothers me most: Whenever such an article appears it's
>commented mostly by kiddies speaking after the mouth of several kernel
>developers, sophisticating most of their comments, ripping them out of
>context or spreading superficial knowledge. Of course those comments let
>it get to possible new users.
>
>Kind regards and keep up the great work,
>Tassilo (pleased Reiser4 user since 2.6.0_testX)
>
>Footnotes: 
>[1] http://www.linux.com/article.pl?sid=06/07/31/1548201
>  
>

