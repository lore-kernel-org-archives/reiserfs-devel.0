From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: 2.6.9-mm1
Date: Mon, 25 Oct 2004 15:52:49 -0400
Message-ID: <417D5991.3050003@tmr.com>
References: <20041022032039.730eb226.akpm@osdl.org><20041022032039.730eb226.akpm@osdl.org> <4179425A.3080903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4179425A.3080903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:

> I would like to encourage its inclusion as an experimental filesystem 
> BEFORE vendors ship it. I think first putting experimental stuff in the 
> kernels used by hackers makes sense. I think it creates more of a 
> community.

I think -mm *is* what is run by hackers. That said, do you really think 
that it is stable with 4k stack? (that's a real question, it wasn't for 
me in 2.6.8-mm? when I briefly tried it).

I see the major benefits to people running heavy i/o load, like database 
and servers. And those are the users with the most to lose if it still 
has residual learning experiences.

I do think that akpm is capable of deciding when it should go in without 
all this politicing, and I doubt he or Linus care if it makes a vendor 
kernel first, considering all the things in vendor kernels which NEVER 
get to mainline.

-- 
    -bill davidsen (davidsen@tmr.com)
"The secret to procrastination is to put things off until the
  last possible moment - but no longer"  -me
