From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: REISER4 problem,
Date: Fri, 05 May 2006 10:53:45 +0400
Message-ID: <1146812025.6254.18.camel@tribesman.namesys.com>
References: <445A630B.9050803@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28563-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <445A630B.9050803@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John <geearf@free.fr>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-05-04 at 22:24 +0200, John wrote:
> Hello,
> 
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
> If I can help you on anything about this please ask,
> 

It would be interesting to take a look at error messages you get from
kernel and at reiser4.fsck's output.

