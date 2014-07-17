From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [veryRFC] [PATCH 0/2] reiser4: discard before dealloc: first
 approximation.
Date: Thu, 17 Jul 2014 13:14:06 +0200
Message-ID: <53C7AFFE.3050905@gmail.com>
References: <53C652BE.4010203@gmail.com> <1405509844-30070-1-git-send-email-intelfx100@gmail.com> <53C70C38.3080002@gmail.com> <1921159.vPDThm1Mru@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=5JdlCD5F0nK0sKMUHWnES954kL1qioRrcssmstw822M=;
        b=zg7LR9PGWvk1nxvbccQJD6iGrbUF9EU+wCHkDTTbp5JsFb6TxHDF3I73E8s+hrAODS
         EmfAP6ZJJ3uWYlZsMwrDFwp6PjSpB0Ion4zrLlRgey2I4anLvlUZMGDhApmzDW8pqHv4
         xD8dBtKxR7+B82g7dj3Dw7m+DiI+FQ/ZXt2tcU4Xd/M9K27E2BE3X7froRK9yArdHwY5
         Zk+GW7dPAa4h04/8ql1OKRSMqvpYDwzwoLl1BiD68e+aTWA2McZw4A8d9vGmjJnaNOdW
         9wsjXo+jgfX9rZRauIrcY81gujNOby8DhhAlGeT4j31Lqw7UY04dQudpSbrQYwRXW7sg
         nJjw==
In-Reply-To: <1921159.vPDThm1Mru@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 07/17/2014 11:46 AM, Ivan Shapovalov wrote:
> On Thursday 17 July 2014 at 01:35:20, Edward Shishkin wrote:	
>> On 07/16/2014 01:24 PM, Ivan Shapovalov wrote:
>>> This needs your version of discard algorithm, because blocks inside extents of
>>> discard set are now marked as allocated.
>>
>> OK, I'll try to finish it in weekends..
>>
>>
>>> BTW, have you dropped the case with erase unit size < block size?
>>
>> In my version all erase units are supported except ones which are
>> not a power of 2. We can support all erase units without exceptions,
>> if needed.
> I mean, when erase unit size < block size, erase unit size is forced to be
> exactly one block. Again, this is OK, but in this case any alignment (by
> definition less than one block then) will be dropped and represented as zero,
> and _this_ deserves a warning :)


The case of alignment % block_size != 0 deserves to disable discard
support, because in this case all this science with heads and tails
simply doesn't work.


>
> // btw, as you probably guess, these two patches are completely untested.
>
> Thanks,

