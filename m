From: Hans Reiser <reiser@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Thu, 03 Apr 2003 23:44:38 +0400
Message-ID: <3E8C8F26.6020108@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com> <200303301130.24136.phma@webjockey.net> <3E8824B4.55C63A55@namesys.com> <3E88300C.22B54FD7@namesys.com> <20030331133618.GO8452@hvs.envisage.co.za> <3E88496C.E83B780F@namesys.com> <20030331164502.GU8452@hvs.envisage.co.za> <3E8985D5.7CA598FF@namesys.com>            <3E89B908.1070106@namesys.com> <200304031614.h33GE7S7004132@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304031614.h33GE7S7004132@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>
>A better bet would be to use the LSM security framework to create a module
>that carries the tokens around for the process - this could even allow you
>to do things like add a new key token to a process group leader and have
>it propagate to already-running children (which is a phenomenally useful
>thing to do that you can't do with an environment variable).  So for
>instance, you could add a new key to your X login process, and all the
>myriad subshells would get it - and thus any processes THEY launch) without
>the need to log out from X and log back in again...
>
>  
>
Thanks.  This is why it was important to discuss these things on the 
list....

-- 
Hans


