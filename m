From: David Masover <ninja@slaphack.com>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Thu, 14 Sep 2006 17:23:25 -0500
Message-ID: <4509D65D.7040908@slaphack.com>
References: <200609131451.42474.lists@qutek.net> <200609132110.45703.lists@qutek.net> <4509B3CD.3010903@slaphack.com> <200609141609.06713.lists@qutek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29892-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609141609.06713.lists@qutek.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Quinn Harris <lists@qutek.net>
Cc: reiserfs-list@namesys.com

Quinn Harris wrote:
> On Thursday 14 September 2006 13:55, David Masover wrote:
>> Quinn Harris wrote:
>>> The boot optimization was over 3885 files.  Ideally those files would be
>>> ordered head to tail in a sequence that perfectly matches the order they
>>> will be read.
>>>
>>> I bring this up here because I expect with reiser4, a repacker, and this
>> Now that you mention it, do you have a control of some sort to prove
>> this isn't just fragmentation?  That is, copy the files you're messing
>> with in some random order (that should make booting slower), and
>> benchmark that?
> 
> That is a good point.  Recording the disk layout before and after to compare 
> relative fragmentation would be a good idea.  As well as randomizing the 
> sequence as a sanity check.
> 
> Also note that during boot I was using readahead on all 3885 files.  So the 
> kernel has a good opportunity to rearrange the reads.  And the read sequence 
> doesn't necessary match the order its needed (though I tried to get that).

Speaking of which, did you parallize the boot process at all?  I'd 
estimate my system easily spent more than 50% of its boot time not 
touching the disk at all before I did that.  Gentoo can do this, I'm not 
sure what else, as it kind of needs your init system to understand 
dependencies.

As far as faster load times for Firefox and OpenOffice, you may be on to 
something here, but then, these apps probably match up pretty well with 
the on-disk format, too.

This would probably be most useful for a case where you have to read a 
lot of small files, with relatively low CPU usage, in a fairly 
unpredictable order.  I suspect it would be nice for Gentoo's Portage 
tree, though I can't think what else.
