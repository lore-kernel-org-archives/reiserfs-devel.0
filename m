From: =?ISO-8859-1?Q?Jussi_Vainionp=E4=E4?= <jjvainio@cc.hut.fi>
Subject: Re: Journal-601 error on Redhat 7.3 / reiserfs / ext3 / raid 5
Date: Thu, 03 Jul 2003 01:14:08 +0300
Message-ID: <3F035930.9050701@cc.hut.fi>
References: <3F00B119.7080701@cc.hut.fi> <20030701054339.GA7914@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030701054339.GA7914@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:
> 
>>Apr 27 20:18:06 un kernel: journal-601, buffer write failed
> 
> 
> I do not know who to blame here. Try to heavily write to loop device itself (without using
> reiserfs) to see if something will break? Or bettr yet - upgrade to newer kernel and see if that's
> cures your problem?

I tried the same operation using ext2 instead of reiserfs and at least that worked without any problems.


