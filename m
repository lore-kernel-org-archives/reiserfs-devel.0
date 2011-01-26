From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Quick & dirty r4 for 2.6.37
Date: Wed, 26 Jan 2011 21:51:51 +0100
Message-ID: <4D408967.3060004@gmail.com>
References: <AANLkTi=Mi1QEC+Wjr5ka4uMZH72WytvsszC+yycRKaqq@mail.gmail.com> <AANLkTi=trDJKzq5x4ic0qzkzCseDMgzci29NnTqDbzco@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=trDJKzq5x4ic0qzkzCseDMgzci29NnTqDbzco@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kaelyn Uhrain <Kaelyn.Alexi+reiserfs@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Kaelyn Uhrain wrote:
> Ack! Just realized I'd created the patch based on the
> reiser4-for-2.6.36.path.bz2 from November and not the latest r4 patch.
>  Here is an amended version of my patch that removes the export of
> generic_writeback_sb_inodes and the definition & export of
> writeback_skip_sb_inodes from fs/fs-writeback.c as they're already in
> vanilla 2.6.37.
>   

writeback_skip_sb_inodes() in vanilla? With whose blessing? :)
You are confused :)


> On Wed, Jan 26, 2011 at 12:14 PM, Kaelyn Uhrain
> <Kaelyn.Alexi+reiserfs@gmail.com> wrote:
>   
>> Here's a quick patch I just made for the resier4-for-2.6.36 patch to
>> compile against the 2.6.37 sources.  To use, apply
>> resier4-for-2.6.36.patch to the 2.6.37 kernel sources (ignoring the
>> one rejected chunk which just adds a comment at the end of
>> fs/fs-writeback.c) then apply this patch.  My patch is a revert of
>> 766f9164193f6dda1497bbf3861060198421fb92 along with three very small
>> one-liner changes to fix compilation issues; I haven't had a chance to
>> test it beyond building the kernel itself, and won't until after I'm
>> off work tonight.  I also make no claims as to the correctness of my
>> patch since it is my first venture into the reiser4 and linux fs code.
>>
>> Cheers,
>> Kaelyn
>>
>>     

