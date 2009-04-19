From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 inclusion?
Date: Sun, 19 Apr 2009 14:51:11 +0200
Message-ID: <49EB1E3F.1020905@gmail.com>
References: <alpine.DEB.2.01.0904181302440.6162@bogon.housecafe.de> <49EAFBBB.5050400@ontolab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49EAFBBB.5050400@ontolab.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Stroetmann OntoLab <stroetmann@ontolab.com>
Cc: Christian Kujau <lists@nerdbynature.de>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Please,
don't flood in this mailing list.
Go away!

Edward.

Christian Stroetmann OntoLab wrote:
> Dear Christian;
> You wrote:
>> With still no project page in sight,
> Under the label of my company and taking the full risk of losing
> reputation, in contrast to other well known Linux distributions and
> former supporters of R....4 fs which (partly) jumped off the train, I
> made the following offers in the past:
> 1. Support the R4 fs under the name R4.
> 2. Set up a project page or, on the wish of the developement
> community, a wiki.
> 3. Under an other name, which I've choosen and I'm not allowed to name
> in this mailinglist, I've have even developed another kind of file
> system.
>
> The results were:
> To 1.: No echo.
> To 2.: No replay.
> To 3.: I got a kindly "Go away" advice.
> And to give it the rest: I do have alternatives and if some persons
> think, that they can gain something by their destructive attitude,
> than I have to say: Okay, have a nice day.
>
> Being constructive, I think we need a new projcet management, maybe a
> new maintainer, or some bytes for archiving the digital waste.
>>  I find it hard to track[0] the progress of the work being towards an
>> inclusion of reiser4 into mainline. Unable to help out with real
>> code, I look at the reiser4-for-2.6.29 diffstat (sans the fs/reiser4
>> parts!) and see:
>>
>>  Documentation/Changes                         |   12
>>  Documentation/filesystems/reiser4.txt         |   75
>>  fs/Kconfig                                    |    1
>>  fs/Makefile                                   |    1
>>  fs/buffer.c                                   |    9
>>  fs/fs-writeback.c                             |    5
>>  include/linux/fs.h                            |    3
>>  include/linux/mm.h                            |    2
>>  mm/filemap.c                                  |    4
>>  mm/page-writeback.c                           |   48
>> So, with 4 of them being "just" documentation and build magic, I take
>> it that we're 6 files and less than 100 lines of code away from at
>> least putting this file system into the new staging/ tree perhaps?
>>
>> Thoughts?
>>   
> I found it more and more jokeless, what is going on around this fs.
> Btw.: I can't and I won't follow the claims and resitances made by Al
> Viro and other hard core coders against R4 and HFS+, especially the
> arguments in the hardlink subject.
>> Thanks,
>> Christian.
>>
>> [0] http://tinyurl.com/dexfq9
>>   
> Sincerely
> Christian *<:o)
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

