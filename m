From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Tue, 01 Nov 2005 19:25:26 +0300
Message-ID: <436796F6.10603@namesys.com>
References: <1130860221.12859.23.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1130860221.12859.23.camel@laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fionn Behrens <fionn@spamfilter.de>
Cc: reiserfs-list@namesys.com

Hello

Fionn Behrens wrote:
> Hi all,
> 
> you may remember my recent "story from userland". Stubborn as I am, I
> decided to give 2.6.14 another shot for it. Following a recommendation
> found in the above mentioned thread, I tried the patch from 
> http://iphitus.loudas.com/archck.php this time, which includes the
> latest reiser4 from mm.
> 
> Unfortunately I once more hit the wall and was forced to go back to
> 2.6.11 (including another --build-fs run to regain compatibility with
> the old but working reiser4 drivers). I wish there was a mount option to
> exclude the new extensions so I can test new kernels without losing half
> a day for fscking when things get whacky.
> 

Did fsck.reiser4 say you that you have to --build-fs?

> This time suspend seemingly works without reiser4 processes freaking
> out.
> But now it looks like any time any mmapped file is synced to a reiser4
> partition, the process who tries to do that will freeze forever. In

Can you please check what fs/reiser4/reiser4.h:REISER4_USE_EFLUSH is set to?
If it is 0, please try your test having it set to 1.

> addition, any process trying to access the open mmapped file afterwards
> will freeze forever as well. I created a screenshot of an strace running
> while this happened. Find it at http://fionn.de/reiser4again.jpg
> 

If the above does not help  - would you please set up either sereial console or
netconsole and catch sysrq-T output with its help?

> Of course, tests on files on other file systems than reiser4 did not
> show this behaviour. I tested on two different Systems, one Pentium M
> and one Athlon, same result.
> 
> I wish I knew what I am doing wrong. I'd bet you guys all have reiser4
> up and running with 2.6.14 and no problems at all. Or what? 
> 
> best regards,
> 		Fionn

