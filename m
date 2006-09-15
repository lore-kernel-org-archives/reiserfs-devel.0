From: Toby Thain <toby@smartgames.ca>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Fri, 15 Sep 2006 01:15:35 -0400
Message-ID: <54E99998-88D2-4E0D-8970-1C3DA365DBE0@smartgames.ca>
References: <200609131451.42474.lists@qutek.net> <200609132110.45703.lists@qutek.net> <4509B3CD.3010903@slaphack.com> <200609141609.06713.lists@qutek.net> <4509D65D.7040908@slaphack.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4509D65D.7040908@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


On 14-Sep-06, at 6:23 PM, David Masover wrote:

> Quinn Harris wrote:
>> On Thursday 14 September 2006 13:55, David Masover wrote:
>>> ...
>> That is a good point.  Recording the disk layout before and after  
>> to compare relative fragmentation would be a good idea.  As well  
>> as randomizing the sequence as a sanity check.
>> Also note that during boot I was using readahead on all 3885  
>> files.  So the kernel has a good opportunity to rearrange the  
>> reads.  And the read sequence doesn't necessary match the order  
>> its needed (though I tried to get that).
>
> Speaking of which, did you parallize the boot process at all?

Just off the top of my head, wouldn't that make the access sequence  
asynchronous & thereby less predictable? (Although I'm sure it's a  
net win.)

> I'd estimate my system easily spent more than 50% of its boot time  
> not touching the disk at all before I did that.  Gentoo can do  
> this, I'm not sure what else, as it kind of needs your init system  
> to understand dependencies.
...
