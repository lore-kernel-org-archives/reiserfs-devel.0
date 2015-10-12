From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Mon, 12 Oct 2015 11:10:08 +0200
Message-ID: <561B78F0.30006@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
 <561928CF.9030903@gmail.com>
 <A0E9999A-A36E-43C2-A2D9-D68B39BD032B@linuxhacker.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=BasrhCLXunjnisjhiCwCSGaTL5B/mHT9F6jOllUX+ds=;
        b=x6zHYJdwt4wAEmFO4Qtlvf0sYF4U3j3uWYE2TbPgLzGf0YEpXfkMna7L5GE+8ccKgq
         MqxTbY+S/beCMuBAmuyRPm7DJGjTfiRmztd83ejP1rkTNKNH4ybuPcnFB/o4UCHGlqcK
         P2NvxQFydNAJ3J3+NALIzYhEH3coXfPQiotxC0eKfSlTbi3t0M0HoMT1ibXctW1/QsIv
         wKPMiSxJZKsi2YnTl3pL6Sxki/dLokgeyPA3SJEGDD3UCkKVSRvFRzJrut/eVgTJZdrW
         wALmyIM7tNkXBHw+F5I6twAW8qLLg5y/Km5gRKYr8OwCiOfDV0WrNFVSYeoOunM2grIa
         fM3A==
In-Reply-To: <A0E9999A-A36E-43C2-A2D9-D68B39BD032B@linuxhacker.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@linuxhacker.ru>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org, =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>

On 10/10/2015 06:51 PM, Oleg Drokin wrote:
> On Oct 10, 2015, at 11:03 AM, Edward Shishkin wrote:
>>>> For formatted nodes we can continue to narrow down the problem
>>>> (see the attached patch).
>>> Having applied the patch, I saw loads and loads of warnings (in ~10
>>> distinct stacktraces), but no panics or oopses in the initial location.
>>> The false positives are possible, right?
>> Yes, a lot of ones and nothing interesting.
>> The same for Dushan's logs. Sorry for bad idea..
> Actually the idea might not be as bad as you think.
>
> This is because not every page that you forgot to call page_dirty on
> will cause a crash.
> Only the pages that had never ever had been set dirty.
> So in a lot of cases the crash does not happen because the page got
> dirtied by a normal path somewhere else and then cleared by normal
> means, but i_wb remains with that page forever until it's fully torn down
> from the pagecache.

I wanted something more efficient than simply code review..
However, in all paths found by Ivan I see that pages are not
obliged to become dirty in write-locking sessions..

Edward.
