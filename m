From: John <geearf@free.fr>
Subject: REISER4 problem,
Date: Thu, 04 May 2006 22:24:43 +0200
Message-ID: <445A630B.9050803@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I think I may have found a bug.

I'm using reiser4 for my /home directory on a 2.6.15 (ubuntu) patched 
kernel for reiser4.

Yesterday I filled my /home once, then emptied it a little, then filled 
it again, and so on about 3 or 4 times. I shut it down properly and all 
seemed ok.
Then today when I started it, the partition was completelty messed up. I 
fixed it with fsck but I had a lot of troubles to get it back working 
even when fsck said it was ok...
I had many different error messages in dmesg, like error input/ouput, 
inode error, and sd error.

If I can help you on anything about this please ask,

Thanks,

John
