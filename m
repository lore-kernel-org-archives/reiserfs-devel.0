From: Jens Axboe <axboe@kernel.dk>
Subject: Re: cleanup the partitioning code
Date: Mon, 23 Mar 2020 10:55:29 -0600
Message-ID: <7b7eb188-441a-b503-d526-f5bc029891fc@kernel.dk>
References: <20200312151939.645254-1-hch@lst.de>
 <20200323165234.GA29925@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-raid-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mFFLdkROuGzrX7CaN7iaKQtgyU9352EW9LOMMGLduh0=;
        b=xvQuDWUK4rppNtIXMkhgKlBEq7tXEVsdIK0ASlHSgXnCp63TynMj/BSxfgxNatZGE4
         hqYSR8fD0EMOESlN7IaxTzPFTksKxokG9SR+skwxywHSZSuczsAAnV9ob47XTgd++pDm
         /JyN115oAoDDmdme+LwUAy8/etuWG2uvIhXxt0qK5D2VurNIC1XZnoQK0+5wSwb3gOP8
         BIyoMiadjG/BKoMmdzCTbOQdSx7xXyZDkopdjvsZTf6tGlMmaG3meWzY3ERya7eDqkZ2
         6hpCIcQ+yWWyT/Zh6uGtaxTy5Sgqvt6gbv+s4gHCHIwqwfKkt5O5oucDfb3CwmEvrMJP
         DPYw==
In-Reply-To: <20200323165234.GA29925@lst.de>
Content-Language: en-US
Sender: linux-raid-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org

On 3/23/20 10:52 AM, Christoph Hellwig wrote:
> ping?
> 
> On Thu, Mar 12, 2020 at 04:19:18PM +0100, Christoph Hellwig wrote:
>> Hi Jens,
>>
>> this series cleans up the partitioning code.
> ---end quoted text---

I did take a look, looks fine to me. Doesn't apply to the 5.7/block
branch though, I'll take a look in a bit, probably an easy reject.

-- 
Jens Axboe

