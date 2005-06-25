From: David Arendt <admin@prnet.org>
Subject: 2.6.13 merge
Date: Sat, 25 Jun 2005 15:08:00 +0200
Message-ID: <42BD5730.7050308@prnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

Here my personal opinion of merging:

I would find it very usefull the have reiserfs merged into the main 
kernel, but I think the kernel developers should be able to decide how 
they want things in. I would propose to continue discussion with kernel 
developers in order to determine actually how to proceed. What I would 
for the moment find more important would be to bring out patches as soon 
as a new kernel version is available. If people know that they find the 
new patches immediately, they will surely give reiser4 a try. I think 
the main problem actually is that there will be serveral weeks from the 
release of a new kernel until the release of the patches. For example in 
my case I need to upgrade to 2.6.12 due to usb problems with 2.6.11. So 
what are my options actually ? Well probably I will stop using reiser4 
and go back to reiser3. Sure, having reiser4 immediately in the kernel 
would solve this problem, but so would patches coming out little time 
after a new kernel version is released.

Here how I would proceed:

1. (most important I think) release patches only little time after the 
kernel is released
2. look together with kernel developers to find a solution that is 
pleasant for everyone

Where I think 1. is much more important than 2. I know lots of people 
which reason for not using reiserfs is not that it is currently not in 
kernel, but because patches need a long time to be available after the 
kernel release.

Also please don't get me wrong with this. I am not trying to say that 
reiserfs developers don't work hard, but perhaps development priorities 
should be changed a bit, as kernel patches being there  in time is in my 
opinion more important than adding features or changing to be ready for 
inclusion in kernel. I really appreciate your hard work and give you 
much respect.

Bye,
David Arendt
