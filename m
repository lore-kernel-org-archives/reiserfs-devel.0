From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.9-mm1
Date: Fri, 22 Oct 2004 10:24:42 -0700
Message-ID: <4179425A.3080903@namesys.com>
References: <20041022032039.730eb226.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041022032039.730eb226.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Andrew Morton wrote:

>
>  - reiser4: not sure, really.  The namespace extensions were disabled,
>    although all the code for that is still present.  Linus's filesystem
>    criterion used to be "once lots of people are using it, preferably when
>    vendors are shipping it".  That's a bit of a chicken and egg thing though.
>    Needs more discussion.
>
>  
>
No distro using reiserfs V3 as the default is going to keep doing so 
once reiser4 meets their stability requirements. Reiserfs is used by a 
lot of people, and reiser4 obsoletes it, and the users know that. None 
of the distros have expressed any intent of staying on V3, and they'd be 
silly to do it. Many of them have expressed a desire to use reiser4. 
Next year, indications are that reiser4 usage by distros as their 
default will exceed that which is today possessed by V3. The higher 
performance of V4 is going to increase our market share.

I would like to encourage its inclusion as an experimental filesystem 
BEFORE vendors ship it. I think first putting experimental stuff in the 
kernels used by hackers makes sense. I think it creates more of a community.

I'd like to point out that there is a lot of stuff in the kernel that is 
a lot less stable than reiser4.

That said, inclusion in -mm found some bugs, and we are still testing 
one of the fixes which was a bit deep. I want to finish that testing 
(not more than 7 days) and send you all fixes before asking for inclusion.

Also, Hellwig made a valid point about getting rid of some macros that 
reduce readability (I also hate code that prevents editors finding 
called functions), and zam is working on fixing that.

Lindows is planning on shipping with reiser4 in its next release. I 
would very much like to see our inclusion before that.
