From: Sander <sander@humilis.net>
Subject: Re: REISER4 problem,
Date: Fri, 5 May 2006 04:40:38 +0200
Message-ID: <20060505024038.GA8054@favonius>
References: <445A630B.9050803@free.fr>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28559-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <445A630B.9050803@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John <geearf@free.fr>
Cc: reiserfs-list@namesys.com

John wrote (ao):
> I think I may have found a bug.
> 
> I'm using reiser4 for my /home directory on a 2.6.15 (ubuntu) patched 
> kernel for reiser4.
> 
> Yesterday I filled my /home once, then emptied it a little, then filled 
> it again, and so on about 3 or 4 times. I shut it down properly and all 
> seemed ok.
> Then today when I started it, the partition was completelty messed up. I 
> fixed it with fsck but I had a lot of troubles to get it back working 
> even when fsck said it was ok...
> I had many different error messages in dmesg, like error input/ouput, 
> inode error, and sd error.

That sounds more like a broken disk than a Reiser4 error. Can you post
the error messages from dmesg?

	With kind regards, Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
