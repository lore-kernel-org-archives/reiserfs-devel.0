From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Subject: Re: Desaster Reiser
Date: Thu, 05 Sep 2002 12:32:25 -0400
Message-ID: <3D778719.1030609@neuronet.pitt.edu>
References: <3D776FEF.F34E655B@tridentemonigotes.com> <20020905140942.B19752@namesys.com> <3D773A35.5070702@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiser <reiserfs-list@namesys.com>

Hans Reiser wrote:

> Let's put this a bit more strongly.  2.4.3 should never have shipped to 
> users.  It particularly has a ridiculously easy to hit bug in VFS that 
> affected reiserfs that would have been found if there was a policy of 
> test before shipping VFS changes.  No one should be using it, and it is 
> definitely worth your time to upgrade.
> 
> We also have some not so easy but still possible to hit bugs in reiserfs 
> up until 2.4.18.  I suggest 2.4.19/18 which is known to be rock stable 
> for us. 
> 2.4.20-pre2 has some substantial performance improvements, but is more 
> risky as it has not been as well tested.

I would suggest you add a statement like the above in your web site.
-- 
      Rafael

