From: Jens Axboe <axboe@kernel.dk>
Subject: Re: cleanup the partitioning code v2
Date: Tue, 24 Mar 2020 07:58:29 -0600
Message-ID: <bafcc626-16bc-baeb-a0fe-2c2fe4cda14b@kernel.dk>
References: <20200324072530.544483-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x5fXAGIMuTapier1gsbREHE5uidSK9jkxwBjZYaSvro=;
        b=GuHVyfLtEaQS6ua0IdE6tBWddbpDehK1t8pnI71T5sIFDkffsobUKQ4A4ckdACJlzi
         PerQQX9Qo6BJLQXl5vXmyumu2j+Oo/6WJgUeRrWlcScm6FdOlDNkXyueSmJJW7WrQY7X
         ZgkNC/Ym/lLm264Jbgd1w3jrXs/Sjbv+FeVrpPu8GQziZ+l2HH/bAuwdBIMts78UKzu2
         PgLG8T99SXdT7U7Ea6n9HF/10Yfbcw3mSga8g2/gdmzOcr5YJs5Rw/kHSGUnPGIm0M3i
         0Ft6bu+IiOn2ReSIc1tPlou6GSLa/FdCbHTrWDNLhJMPg2455K1qJihwbRXTKnklQn4e
         Njqw==
In-Reply-To: <20200324072530.544483-1-hch@lst.de>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org

On 3/24/20 1:25 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series cleans up the partitioning code.
> 
> Changes sinve v1:
>  - rebased to for-5.7/block

Applied, thanks.

-- 
Jens Axboe

