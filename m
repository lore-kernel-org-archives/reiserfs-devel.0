From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Bug with fsck.reiser4 build-fs - Hangs at 100%
Date: Tue, 09 Nov 2004 19:15:15 +0300
Message-ID: <1100016914.1373.83.camel@tribesman.namesys.com>
References: <Pine.LNX.4.51.0411052339130.5646@leandra.the-lab.virtadpt.net>
	 <200411071514.50082.vitaly@namesys.com>
	 <Pine.LNX.4.51.0411081412321.5646@leandra.the-lab.virtadpt.net>
	 <b28a886104110811287311b7@mail.gmail.com>
	 <Pine.LNX.4.51.0411082248520.5646@leandra.the-lab.virtadpt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22320-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.51.0411082248520.5646@leandra.the-lab.virtadpt.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Wolf <julia@virtadpt.net>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-11-09 at 06:55, Julia Wolf wrote:
> On Mon, 8 Nov 2004, Jeremy West wrote:
> 
> > So you were experiencing the filesystem hanging and then fixed it
> > using the latest reiser4progs?  I thought reiser4progs was basically
> > provided mkfs.reiser4 and fsck.reiser4?  I was thinking my issue was
> > kernel related, and not reiser4progs related.  I guess I totally
> > missed the mark there then.
> 
>   No, you were right the first time. There were two completely different
> bugs I reported. One was with the kernel locking up (which still happens
> by the way). And the other one was just the fsck.reiser4 going into an
> infinite loop or something, the machine kept running fine otherwise.
> 
>   The kernel lock-ups seem to mostly happen once the filesystem is 200G
> full (out of about 250G) and when writing large files. I can actuially see
> when it's just about to lock up because the whole system 'pauses' but
> interupts (like keyboard and blinking cursor on framebuffer) keep running,
> and then after like 10 seconds or so, it locks up hard. (Framebuffer
> cursor stops and no response to keystrokes (caps lock and alt-sysreq)
> 
>   When it pauses/hesitates I can alt+sysreq, but for some weird reason
> with this kernel (Linux 2.6.9 with broken-out reiser4 pataches)
> alt+sysrew-T and alt+sysrew-M or P, etc. don't print any information (just
> the header)
> 
Would you please try to reproduce this lockup with reiser4 debug turned
on (File systems -> Reiser4 (EXPERIMENTAL ...) -> Enable reiser4 debug
options -> Assertions)? Can you set up serial console so that we could
catch reiser4 output if it will be issued?


