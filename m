From: Hans Reiser <reiser@namesys.com>
Subject: Re: new reiser4 snapshot
Date: Fri, 17 Oct 2003 22:51:53 +0400
Message-ID: <3F903A49.4090007@namesys.com>
References: <16272.3551.934067.370680@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16272.3551.934067.370680@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>

This snapshot fixes two fatal bugs, and improves performance.  Nikita 
can still make it crash, sigh, and we have discovered some unnecessary 
seeks when replicating Mike Benoit's settings for bonnie++ that are due 
to block allocation bugs.  Sigh.  We are probably still at least 2 weeks 
away from code that we can seriously ask people to use.  The performance 
is good enough to be well worth using despite the allocation bugs, but 
we don't like to ask people to use code we know how to crash.

-- 
Hans


