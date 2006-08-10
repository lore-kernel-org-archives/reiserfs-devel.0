From: Vesa Kaihlavirta <vegai@iki.fi>
Subject: Re: The Infamous Reiser4-randomly-blocks-for-ages-and-writes-the-hd-continously-in-the-mean-while
 now with a btrace log! (hope it helps)
Date: Thu, 10 Aug 2006 19:36:16 +0300
Message-ID: <44DB6080.8070306@iki.fi>
References: <20060806162017.GB8613@rvalles.homedns.org.> <5c49b0ed0608070233p68204fd1la2630e49fb08fad7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5c49b0ed0608070233p68204fd1la2630e49fb08fad7@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Nate Diller wrote:
> On 8/6/06, rvalles <rvalles@es.gnu.org> wrote:
>> The bug is as I've explained a thousand times. (and it does only affect
>> kernels newer than 2.6.12, all of them, that's one thing I'm sure)
>>
>> Newer kernels have a nice feature called "blktrace" to trace the block
>> layer activity. I include with this mail a log of the whole block (this
>> time it was just about 30 seconds, the previous one, when I was sending
>> a mail to a maillist, it was 10 minutes or maybe more).
>>
>> How did I do it:
>> - Write a mail to myself (small mail, btw).
>> - Start the btrace.
>> - Send it. (I pressed 'y' at mutt mail sending screen)
>> - Look at the HD led.
>> - When it stopped, the crap @ btrace stopped too. I then stopped btrace.
>>
>> I hope that this log helps enlighten someone.
>>
>> Now, to add to the data about the bug:
>> - My new desktop uses reiser4. It is affected, too.
>> - Just by typing "reboot" at my old desktop, the bug triggers inmediatly
>>   after the wall message is sent, and lasts about 10 minutes.
>> - Latest reiser4 fsck was run with --build-fs on my old desktop the day
>>   before; The FS had got, before that, some corrupcion (probably a bug)
>>   that caused kernel panics, so the FS is quite clean now, yet I can
>>   reproduce the bugs.
>>
>> I will be happy to help further in any way.
>>
>> I also have many friends who use reiser4 and are experiencing it; it
>> would be a shame if reiser4 finally got merged into the kernel with
>> this bug still there.
>
> 91% of the requests are 4K in size, 77% of requests are write
> barriers.  looks like there's something that causes bitmap blocks to
> be written synchronously.
>
> there's also a LOT of duplication, blocks that are written and then
> immediately RE-written.  the 4k block at sector 23246207 is written
> 226 times over the course of this trace, each time seemingly in a pair
> (write it, rewrite it, do other stuff, write it, re-write it, etc).
> this is pathological behavior, it's a real bug even without the
> performance loss.
>
> NATE

I hope no-one says reiser4 is "2 times faster than ext3" before this
issue is cleared.
Could some developer (if Nate's one, pardon me) comment on this issue?
It seems to me
much more important than that endless thread about "official point of view".

Incidentally, I've witnessed similar behaviour in various simple tasks,
e.g. writing
entries to an sqlite database, or receiving mail from pop3 in thunderbird.

On kernel-2.6.17.7 currently.

--vk

