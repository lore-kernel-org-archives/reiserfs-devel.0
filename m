From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: Data-logging and md as / fs bug
Date: Tue, 13 May 2003 17:00:09 +0200
Message-ID: <3EC10879.1040902@netscape.net>
References: <3EB30852.6090402@netscape.net> <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com> <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com> <20030512072943.GA21604@namesys.com> <3EC0FE02.9030007@netscape.net> <20030513142501.GI12963@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi and thank you, for the quick reply!

On 05/13/2003 04:25 PM, Oleg Drokin wrote:
> Hello!
> 
> On Tue, May 13, 2003 at 04:15:30PM +0200, Manuel Krause wrote:
> 
> 
>>Do you have something new to try? Does this original patch affect disk 
>>i/o perfomance (positive/negative)?
> 
> 
> No. I have old patch instead that applies to 2.4.20 and basically every other kernel
> and that I am pushing to Marchelo as this iget5_locked is too intrusive at current 2.4
> development stage.

In what kind? Or: What kind of intrusion do you mean then (see below)?!

> This old patch is attached.
> 
> 
>>Always appreciated are less intrusive ones regarding i/o speed ;-))
> 
> 
> I/O speed should be the same with all the aproaches.
> The patch below is a bit more cpu hungry as it introduces one more spinlock.
> 
> Bye,
>     Oleg
[Patch]

But, errhm, why should I use a patch that uses more cpu and doesn't 
speed up disk i/o (see above)???

I only did a very little testing when the discussions on 
iget5_locked_for-2.4.21-pre5-datalogging.diff, kinoded-? + 
inode-dirty-for-kinoded began. And it seemed that kinoded + inode-dirty 
doesn't make a difference without quota (as Chris already pointed out) 
but that I loose 2s on OpenOffice- and 1s on Netscape7-startup time 
without your -pre5 patch. Is that possible or should I improve my 
looking-at-the-clock or re-verify that?


Thanks,

  Manuel

