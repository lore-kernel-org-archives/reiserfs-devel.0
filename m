From: Yury Umanets <umka@namesys.com>
Subject: Re: Enabling files as directories?
Date: Fri, 15 Aug 2003 18:17:28 +0400
Message-ID: <1060957048.20707.3.camel@haron.namesys.com>
References: <3F3C3B76.1000002@umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15319-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F3C3B76.1000002@umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@umn.edu>
Cc: reiserfs-list@namesys.com

On Fri, 2003-08-15 at 05:46, Grant Miner wrote:
> I am wondering how can I enable files as directories behavior.  For example:
> touch a; chmod a+x a
> cd a
> touch b -> error, not a directory
> 
> Thanks,
> Grant

linux kernel 2.4.x does not allow this. At least sys_fchdir() does not
allow this. linux-2.6.x does.


-- 
We're flying high, we're watching the world passes by...

