From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Tue, 07 May 2002 21:35:18 +0200
Message-ID: <3CD82C76.2080706@netscape.net>
References: <3CD72AB1.6010607@netscape.net> <20020507092207.A6678@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi!

On 05/07/2002 07:22 AM, Oleg Drokin wrote:

> Hello!
> 
> On Tue, May 07, 2002 at 03:15:29AM +0200, Manuel Krause wrote:
> 
> 
>>1.) the deleted/truncated/completed-files-on-mount at least
>>    printed in the kernel logs, at best with the real filename
>>
> 
> Huh??
> 
>>    -- as afterwards they are not retrievable --
>>
> 
> Sure. Files are deleted already. How do you plan to retrieve deleted files?
> (not using backups, that's it).
> 


Mmh. I meant to restore the affected files from existing backups. When
they are  removed by reiserfs on mount I know they are really corrupted
during crash. It often looks like:
  Removing [5523 5570 0x0 SD]..done
  Removing [5523 5569 0x0 SD]..done
  Removing [5523 5566 0x0 SD]..done
  There were 3 uncompleted unlinks/truncates. Completed

I have an overview what files may be meant but... See the context below.
I don't find this information very explicative. And I really don't know
enough about reiserfs code to interprete these lines. BTW, can we have a
"ReiserFS: " in front of these messages?

> 
>>    That's a security reason -- whoever can trigger a crash
>>    with various methods (I know the admin should take care
>>    against this case... but on my home sytem I'd like to know
>>    that info, too) but to get back the file from backups in
>>    case... who knows it before a
>>    crash... ? Am I missing something?
>>
> 
> This is unclear to me. You mean to crash a system to get a copy of deleted file,
> or to crash a system to delete a file? Both things sound very unlikely.
> 


Yes, no doubt, I really don't know what is usual in these cases. I
should explain what happened to make me write this comment. I had
recompiled one DRI module for X recently when my system decided to
crash. After rebooot I had some truncates-to-complete. So far "normal"
or at least "o.k.".

But due to anti-aliasing configured in KDE it loaded everything but
didn't show anything else than my desktops background color and the
mouse arrow. It took me some time to figure out how to get things back
into previous order. It finally seems like I just needed to reinstall
the DRI component. But until now I don't know what files had
disappeared/corrupted to get exactly and only these ones from my backup.
You see? Yes, not usual, but...

> 
[disk distinction]
>>3.) a hint on how to turn on/off data-journaling for "some"
>>    of our existing reiserfs partitions if it exists at all
>>    for now and why it could be needed in some cases?!.
>>
> 
> Data journaling is available only in form of a separate patch from Chris for
> now.
> 


Yes, thanks, Chris gave that info, too. Thank you! I mostly (only)
wondered about Hans' & Chris' discussion about not yet implemented and
not released-on-Namesys-ftp-for-testing reiserfs options that seem to be
useful in some cases...

> 
>>4.) a hint why there is iicache code in the latest
>>    speedup-compound-patch (so that the latest iicache patch
>>    would not apply)
>>
> 
> Hm? What do you mean by latest speedup-compound-patch? I know Chris does not
> believe iicache should be good to use, because similar functionality (with
> less overhead) can be achieved by pagecache.
> 


Pagecache? How can I adjust this? Where did I read this before...?

Yura explained what patch I meant. Hey, that's on Namesys ftp for one
week already!

 >

> Bye,
>     Oleg
> 

Bye,

Manuel

