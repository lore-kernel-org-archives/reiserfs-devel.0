From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Wed, 29 Dec 2004 18:05:59 -0800
Message-ID: <41D36287.4080900@namesys.com>
References: <20041228221218.GA6412@schmorp.de> <20041229185529.GA7513@hello-penguin.com> <41D31C22.9060400@namesys.com> <20041229214324.GA5206@schmorp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041229214324.GA5206@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Stefan Traby <stefan@hello-penguin.com>

pcg( Marc)@goof(A.).(Lehmann )com wrote:

>
>
>Again, this is a lame excuse for a bug. First you declare some features on
>your filesystem, later, when it turns out that it isn't being delivered,
>you act as if this were a known condition.
>  
>
Well this is true, you are right.  Reiser4 is the fix though.

>(Even if it were ok to fail file creation, the error generated is still
>wrong. It is a bug, no matter how you try to twist it).
>  
>
Blame Alan Cox for that, he changed it from -EHASHCOLLISION (or some 
such error I invented, I forget) over my objections.

