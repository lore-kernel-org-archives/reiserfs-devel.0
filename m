From: David Masover <ninja@slaphack.com>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Fri, 22 Sep 2006 12:23:09 -0500
Message-ID: <45141BFD.1030001@slaphack.com>
References: <4513827A.50809@slaphack.com> <200609221245.47857.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609221245.47857.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Alexander Zarochentsev wrote:

> I guess futex (, FUTEX_WAIT, ) calls can be ignored in this analysis. 
> They just wait another threat to call futex(, FUTEX_WAKE, ).  
> Interesting to find that thread and look what it was doing before 
> FUTEX_WAKE? Or FUTEX_WAIT returns ETIMEDOUT?

It probably would be interesting, but I'm a complete newbie at strace. 
You'll have to walk me through this one step by step...
