From: Jens Axboe <axboe@kernel.dk>
Subject: Re: cleanup the partitioning code
Date: Mon, 23 Mar 2020 10:57:07 -0600
Message-ID: <7bb040b9-41c5-9e11-c74d-fec7912e0e3c@kernel.dk>
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
        bh=9vQISIidvx2HC6I208asLL9LQG5D5c4JBYTE7WN0yIM=;
        b=g6ZHAhjo9gbL92ftJyIXUjnrl8Gkjl1lMi6ROa0hw8Rrq9gsvWPKeLL02f6LOMY1ED
         kn8Y1GhddqicGyeUxNhB1LlLhk9UBEAyT+BHzC3rj4YrlJzi921312R3L6Z1Em1UvsN0
         NT2nOO2sN2PLDSEA5O8WG83DsbFVTApVNvNh7aStwgtTMkC75URLlnrfievp/4gVTnNj
         Nx5KU1QmAonSTXu6EV9x/xm6W7MgnG29s2qzwZB41bABAWjY1NkEeGKSDCh6HiaaNrn6
         K8OQwIOOUkkrBVXKYhrqDfkvdlEcigOhf02mS6bYmeG6U4YP9BrXkmY0wUSpBkJ01UiN
         5hKg==
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

Yeah, looks like a trivial conflict with:

commit e598a72faeb543599bdf0d930df3a71906404e6f
Author: Balbir Singh <sblbir@amazon.com>
Date:   Fri Mar 13 05:30:05 2020 +0000

    block/genhd: Notify udev about capacity change

-- 
Jens Axboe

