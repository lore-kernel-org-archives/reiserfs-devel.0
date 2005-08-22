From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Can one stop reiserfsck --rebuild-tree
Date: Mon, 22 Aug 2005 19:22:16 +0400
Message-ID: <200508221922.16972.vitaly@namesys.com>
References: <20050822143231.5108.qmail@web51401.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050822143231.5108.qmail@web51401.mail.yahoo.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: "Ricardo (Tru64 User)" <tru64user@yahoo.com>

On Monday 22 August 2005 18:32, Ricardo (Tru64 User) wrote:
> Hi,
> Checking reiserfs manpages...i dont see a mention of
> the effects of killing --rebuild-tree process once in
> progress.

it is possible to lose data, when interrupting reiserfsck, however 
it depends on the rebuild stage: 
pass0, pass1 -- no problem;
2 -- internal tree is rebalanced intensively, the worst time to kill;
semantic and lost&found passes -- it is posible to lose data as when 
a corruption is found, tree is rebalanced. thus than fewer corruptions 
present, than fewer rebalancings are performed, than lower chances
to lose data.

> Can this be suspended (ctrl ^Z)?

yes, no problem.
 
-- 
Thanks,
Vitaly Fertman
