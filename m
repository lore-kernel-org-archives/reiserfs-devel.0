From: Andrew Thompson <vagabond@mapdesign.net>
Subject: Reiser4 hard locks. Volunteering for testing.
Date: Sun, 15 Aug 2004 23:07:37 +0100
Message-ID: <411FDEA9.9020404@mapdesign.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi everyone, I've been trying out Reiser4 lately and I've experienced 
frequent system locks when there's lots of Disk IO activity. I'm happy 
to report debug info or whatever you guys need, you just need to let me 
know what to do and what to send you.

I'm running gentoo linux unstable, with a patched 2.6.8.1 kernel, but 
I've had similar problems on the 2.6.7 and 2.6.6 kernels over the last 
month or so (I hadn't tried reiser4 for a very long time before that). 
I've tried renicing reiser4, as mentioned in some of the threads on the 
gentoo forums, but I'm not sure what else to try.

My system is a Dual Athlon 1900++MP Asus a7m266-d with 1 gig of ram. I'm 
also using the ati kernel module, so the kernel is "tainted" I guess. i 
have a 20 gig reiser4 partition, recreated today with the latest libaal 
and reiser4progs (1.0.0). I've tried just copying files to it and it 
will just lock after an apparently random time, and the whole system 
locks, the magic sysrq key doesn't work (or after I do an emergency sync 
it fails to do anything else).

 From what I've seen of it when its not locking up its extremely fast 
and since you say Reiser4 needs more testers I'm volunteering. I'll run 
any kernel you want, turn on any debugging options whatever if it will 
help somebody track down the problem.

Thanks in advance,

Andrew
