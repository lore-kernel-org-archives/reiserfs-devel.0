From: David Masover <ninja@slaphack.com>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Fri, 15 Sep 2006 17:27:50 -0500
Message-ID: <450B28E6.90405@slaphack.com>
References: <200609131451.42474.lists@qutek.net> <4509D65D.7040908@slaphack.com> <54E99998-88D2-4E0D-8970-1C3DA365DBE0@smartgames.ca> <200609151520.39826.lists@qutek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609151520.39826.lists@qutek.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Quinn Harris <lists@qutek.net>
Cc: reiserfs-list@namesys.com

Quinn Harris wrote:
> On Thursday 14 September 2006 23:15, Toby Thain wrote:
>> On 14-Sep-06, at 6:23 PM, David Masover wrote:
>>> Quinn Harris wrote:
>>>> On Thursday 14 September 2006 13:55, David Masover wrote:
>>>>> ...
>>>> That is a good point.  Recording the disk layout before and after
>>>> to compare relative fragmentation would be a good idea.  As well
>>>> as randomizing the sequence as a sanity check.
>>>> Also note that during boot I was using readahead on all 3885
>>>> files.  So the kernel has a good opportunity to rearrange the
>>>> reads.  And the read sequence doesn't necessary match the order
>>>> its needed (though I tried to get that).
>>> Speaking of which, did you parallize the boot process at all?
>> Just off the top of my head, wouldn't that make the access sequence
>> asynchronous & thereby less predictable? (Although I'm sure it's a
>> net win.)
> It could, but the kernel will try to reorder the outstanding block requests to 
> reduce seek.  If that is an overall win I don't know.  In addition early in 
> the boot, readahead-list or similar will tell the kernel to start reading 
> most of the files need for the complete boot so they are already in memory 
> when needed.  Ubuntu does the readahead now and all my tests where with 
> readahead.

That's interesting.  I think either parallizing or a very aggressive 
readahead will perform similarly, except in cases where you have a 
script blocking on something other than disk or CPU, like, say, network.

>>> I'd estimate my system easily spent more than 50% of its boot time
>>> not touching the disk at all before I did that.  Gentoo can do
>>> this, I'm not sure what else, as it kind of needs your init system
>>> to understand dependencies.
>> ...
> 

> The current Ubuntu boot waits for hardware probing, DHCP and other things 
> giving the disk readahead a chance to work.  I think this reallocation might 
> help a parallel boot more as the data will be needed sooner.  So I changed my 
> mind, I think parallel boot will highlight the reallocate advantage.  Now I 
> just need to test the hypothesis.

Hmm.  That's possible.  But again, even with the parallel boot, there 
was still a bit of time spent not touching the disk, so I wouldn't 
expect much more of a speedup than what you already have.  Which also 
means, by the way, that I wouldn't use it much -- my system takes more 
like 20 seconds from Grub to a login prompt, and from then on, the only 
things that take more than 5 seconds to load are games.  Since I know 
Quake 4 uses zipfiles (probably compressed) for its storage, and I 
watched the HD LED while it loads, I don't think I can speed that up at 
all short of buying a faster CPU.

Well, that and the Portage tree, but you say I shouldn't expect much 
from that.  Maybe the portage cache?

> Not sure if I would be better of trying initng or waiting for upstart (Ubuntus 
> new init) to get scripts that actually parallel boot.  The code for upstart 
> is very clean and it has the backing of a major distro, so I have high hopes.

Hmm.  That sounds kind of cool, but I wonder how it compares to Gentoo's 
init scripts?  I guess I'll have to wait till it hits the one Ubuntu box 
I have...

> Much like before, I was able to improve a 16.5s oowriter cold start to 14s 
> with this reallocate script, with a cold start of 4.8s (OO 2.0.2, was using 
> 2.0.3 before).

Wait -- cold start is 14s, but it's also 4.8s?  Did you mean warm/hot 
start for that last number?

> I think Python will be the best language for this because its become 
> relatively universal and its easy to understand for the uninitiated.  This 
> really isn't black magic so transparency is good.  I personally prefer Ruby 
> though.

Wait...  Python is more universal than Ruby of Ruby on Rails?

Python is faster, anyway...  I'm waiting for someone to do a decent 
implementation of Ruby on something like .NET before I start using it 
for anything I want to perform well.
