From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Reoccuring corruption problem
Date: Sat, 21 Aug 2004 10:59:37 +0300
Message-ID: <20040821075937.GF1284@nysv.org>
References: <200408192046.27223.zyrax@home.se> <20040819194222.GC29745@favonius> <200408210743.41317.zyrax@home.se>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408210743.41317.zyrax@home.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Nilsson <zyrax@home.se>
Cc: sander@humilis.net, reiserfs-list@namesys.com

On Sat, Aug 21, 2004 at 07:43:41AM +0200, Dan Nilsson wrote:
>
>After running the test I fsck:ed to remove the corruptions, then proceeded by 
>removed my /usr/portage tree (where corruptions seem to easily occur) and 
>reinstalled all the files (with rsync). The same type of corruption occured 
>but now to a different directory than "usual". 

I think you should provide the metadata dump of the filesystem with and
without breakage to Namesys, so they can look at it when their new network
is up and running. This has usually been the next logical step :)

Did you have any debugging options turned on?

-- 
mjt

