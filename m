From: Joe Feise <jfeise@feise.com>
Subject: Re: Bug (?) with 2.6.15-mm4
Date: Mon, 16 Jan 2006 11:30:20 -0800
Message-ID: <43CBF44C.60106@feise.com>
References: <20060116182241.GA5121@gelma.net>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060116182241.GA5121@gelma.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: akpm@osdl.org

Andrea Gelmini wrote on 01/16/06 10:22:

> Hi all,
> 	a few line, without logs and in depth info, to describe a problem
> 	(if it's not already known, I will do a real bug report).
> 	
> 	Well, I've got a Satellite P20, with /dev/md1 crypto-loopbacked
> 	with /dev/loop0 (losetup -e aes), and /dev/loop0 mount on / with
> 	reiser4.
> 	With
> Linux cogno 2.6.15-mm2 #1 PREEMPT Sun Jan 8 14:27:42 CET 2006 i686 GNU/Linux
> 	everything works fine since the day I compiled it.
> 	Same config, but -mm4, I've got freeze. Sometimes after minutes,
> 	sometimes after hours.
> 	After last crash I booted from a rescue partition. Mounting
> 	partition where system was writing gives no warning, but checking
> 	it with fsck.reiser4 (Debian testing, package reiser4progs version 1.0.5-1)
> 	two inconsistency were founded (and fixed).
> 
> Thanks a lot for your time and your work,
> gelma
> 


I also see freezes, since 2.6.15-mm2. I did not attribute that to reiser4,
though, since there is more in the -mm patches.
I have noticed, though, that at least the last -mm4 freeze resulted in serious
reiser4 corruption. I had to use the --build-fs option to fsck.reiser4.

-Joe

