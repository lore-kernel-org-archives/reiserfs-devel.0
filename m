From: Jens Axboe <axboe@kernel.dk>
Subject: Re: cleanup the partitioning code
Date: Mon, 23 Mar 2020 13:32:34 -0600
Message-ID: <5144a76e-1d99-c5a0-3e16-e031e12d93ec@kernel.dk>
References: <20200312151939.645254-1-hch@lst.de>
 <20200323165234.GA29925@lst.de>
 <7b7eb188-441a-b503-d526-f5bc029891fc@kernel.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-block-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hi3EuG/Ev6bXmXxwMF/V1jsHh5EuhVttPWLzFdZA0IQ=;
        b=vLeGSpfsq1jVhwKe7kGlbB3RuNa6YAmDElpxlsUF/kzrtyDfdHxqgJmZhPcbrjBWan
         3ke0mbmoeY48ITd+sWsO2NK8NTXadJ9C2p1cRWDCrTJbWuix/ztHPjE0ypAwPWHqei4j
         bUDV8mfhgCuj/z+owEpyzoSHJ3BTyZw1QIPeJhf4uH6j6z4CH03XVYXZ6Tgc9+oVTnrX
         Te/k7QqG0OWh1N8xOM73p9dGJAqP1o6IXkqwDd09VrtfkgLUtpn9588R95kvdAwEpmkt
         KNzPv5G58gPwwTWCsdJxucJ6dyjkCBCs6inICd5eyY6UV6sRPx5QHu+z+fneH0XFQDzj
         t3ug==
In-Reply-To: <7b7eb188-441a-b503-d526-f5bc029891fc@kernel.dk>
Content-Language: en-US
Sender: linux-block-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

On 3/23/20 10:55 AM, Jens Axboe wrote:
> On 3/23/20 10:52 AM, Christoph Hellwig wrote:
>> ping?
>>
>> On Thu, Mar 12, 2020 at 04:19:18PM +0100, Christoph Hellwig wrote:
>>> Hi Jens,
>>>
>>> this series cleans up the partitioning code.
>> ---end quoted text---
> 
> I did take a look, looks fine to me. Doesn't apply to the 5.7/block
> branch though, I'll take a look in a bit, probably an easy reject.

OK, so it also assumes that the PAGE_SHIFT -> PAGE_SECTORS_SHIFT patch
is in, which I dropped.

Can you resend?


-- 
Jens Axboe

