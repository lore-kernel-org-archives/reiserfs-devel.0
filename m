From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 todo list
Date: Tue, 05 Aug 2008 03:31:08 +0400
Message-ID: <4897913C.5060901@gmail.com>
References: <48f7fe350808041430y5fa8e87ch9e7f7e2f76a6fce0@mail.gmail.com> <a08621850808041506i2e73ee26k1ef41f99ec5e9b25@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a08621850808041506i2e73ee26k1ef41f99ec5e9b25@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: Ryan Hope <rmh3093@gmail.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Dushan Tcholich wrote:
> Well there's some answers to your questions in the archives:
>
> "You have a TODO list for inclusion if you're interested at
> http://marc.info/?l=reiserfs-devel&m=120173123713322&w=2
>   

The stuff above is out of date

> Also some review/comments of code would be nice. PPC64 testing too.
> Gentoo has a vibrant reiser4 users community, you can try to solve
> theirs reiser4 problems in bugzilla and on forums.
> Benchmarking of various reiser4 versions from old kernels till current
> should be usefull."
> http://marc.info/?l=reiserfs-devel&m=121390468324634&w=2
>   

ditto

> "Ok, let's start with #14
> Since google dropped the cache, pull it as the first item of this list:
> http://lkml.org/lkml/2006/8/3/38 (about set_page_dirty_internal).
>
> Also there is a small, but nasty leak of free disk space when process
> runs in
> no-space-left-on-device mode. It can be reproduced by the following way:
>
> 1) format a small partition by mkfs.reiser4 with no options;
> 2) mount it and look at "df" output;
> 3) run stress.sh -n 20; let it to work some time with complaints about
> no space left on device;
> 4) terminate stress benchmark and remove everything on the partition;
> 5) sync and look at "df" output: it can show more used space, then it
> was reported at (2).
>
> It would be great to fix this leak.
> There is a hint: this leak is related to tail conversion (if you format
> a partition with "extents only" policy, then it doesn't take place)."
> http://marc.info/?l=reiserfs-devel&m=121391256004694&w=2
>
> Hope this helps
> On Mon, Aug 4, 2008 at 11:30 PM, Ryan Hope <rmh3093@gmail.com> wrote:
>   
>> Is there a todo list, roadmap or bugtracker for what needs to get done
>> on reiser4?
>>
>> -Ryan
>> --
>>     
> Dushan
>
>   
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>     
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

