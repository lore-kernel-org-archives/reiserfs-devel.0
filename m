From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Date: Thu, 6 Aug 2020 02:37:22 +0200
Message-ID: <3dbeff43-0905-3421-4652-41b7a935f3c1@gmail.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
 <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
 <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
 <20200805200129.0ce62f36@Phenom-II-x6.niklas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q437G4wSOATln/xMsM+PNrrp8wCttyK7eIPhtP2hGbI=;
        b=CSXrsdzjMinZODnr1IBV+RwU9sqtKNnURzpmlqNyJ57hjWKkdUlGuacNZWYr8hzfGw
         WaHcmEaeusY/CjIupTqLFqVAntNpms4xbZgDNQiyM5BscyEbmTh6Bl5tL6nmmvJbi7jP
         AE+aRpKO/aAwfudat47CZrUNNpE9cJI/ZKpGpooHq3ZcItpCGKPm8IclQadvCFJmgnvQ
         shrVQeQ3fjrTkxUN5mg+T9JqgUEeEXRwQjuj7yITMxVihRnfXIPu93MN7yC0O8v4tjtE
         TIrZmEjetLcJmLHxfBrYw5rdD4SmJm1UAIIMWVNkKIo+h1DHiX3BAVyPG8nwoL87BZp4
         cCMw==
In-Reply-To: <20200805200129.0ce62f36@Phenom-II-x6.niklas.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hgntkwis@vfemail.net, torvalds@linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On 08/06/2020 02:01 AM, Hgntkwis@vfemail.net wrote:
> On Wed, 5 Aug 2020 12:51:41 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>> On Wed, Aug 5, 2020 at 9:53 AM <Hgntkwis@vfemail.net> wrote:
>>>
>>> It's been over 1 week since I sent this into the reiserfs-devel
>>> mailing list. I'm escalating this as the kernel docs recommend.
>>> I'm still willing to help debug and test a fix for this problem.
>>
>> The thing is, you're using an ancient 4.14 kernel,
> 
> Sorry, I didn't realize kernel development went that fast.
> I did try to go to the 5.X series, but the AMDGPU drivers don't work on
> my SI card anymore (I need to bisect which takes time and many re-boots
> to find the problematic commit).
> I'll try the Radeon-SI driver and see if I can reproduce this reliably.
> 
>> and a filesystem
>> that isn't really maintained any more. You'll find very few people
>> interested in trying to debug that combination.
>>
>> You *might* have more luck with a more modern kernel, but even then
>> ... reiserfs?
>>
>>                Linus
>>
> 
> Why does no one (I've met others who share a similar sentiment), like
> reiserfs? I'm not looking for fight, I'm incredulous. It's a great FS
> that survives oops-es, power failures, and random crashes very very well.
> It's the only FLOSS FS with tail packing.
> 
> Thanks,
> David
> 

Hi David,

The feature of "tail packing", that you need, is brought to perfection
in Reiser4 file system. Other file systems either don't provide tight
packing of records in the storage tree, or they are read-only. You just
need to manually patch (*) the kernel and install a pair of user-space
packages (**).

The latest stuff (against Linux-5.7) is stable. For older kernels you
will need a backport for some fixups (***). We can prepare it for you.

Reiser4 is fully supported. If any problems (including partition
check/repair) - send a message to reiserfs-devel mailing list.

(*)   https://reiser4.wiki.kernel.org/index.php/Reiser4_Howto
       https://sourceforge.net/projects/reiser4/files/
(**)  https://sourceforge.net/projects/reiser4/files/reiser4-utils/
(***) https://marc.info/?l=reiserfs-devel&m=158086248927420&w=2

Thanks,
Edward.
