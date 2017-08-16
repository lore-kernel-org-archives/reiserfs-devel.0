From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] reiserfs: fix spelling mistake: "tranasction" ->
 "transaction"
Date: Wed, 16 Aug 2017 08:46:12 -0600
Message-ID: <bbdf433d-d1a5-badc-b65b-b333e0380bc9@kernel.dk>
References: <20170816080620.8440-1-colin.king@canonical.com>
 <20170816140036.GE4898@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wjHq8DWQKdTbmFS3bfrff0p6p0Nrt0uQYArqWWUayp0=;
        b=sktS9VhxEN8DD7/UhpYL90GWNJ8xDhSC2BjZipOeFIE+tC39Pjy2ir8vWCd08gI5yO
         cFm0tUoBMajTNIzZ+0Heulk3MykFBToR3/vbDz7Kx0hFGHFL8Sn9RU5EHITWUpsYEilJ
         KUvt9X60At1C+SK6OpvjkpoJa5vqXIWJw4f8/4GDGvgNJt9P6Fk6du9oiEEbv/1JOxVL
         ZUKxDZh2xXcDMDGZCAtLH3iVAw9+4K2DEPW+ba/Ny7l1eFSgBLAZZuyx49/j131TnZVr
         Kw5KHlwDvlwzFMiYdL7ePhso3BVMnNHlpT742FUVytadz36W52XswlNcpqZswNnpCeke
         ZkZA==
In-Reply-To: <20170816140036.GE4898@quack2.suse.cz>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>, Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@kernel.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/16/2017 08:00 AM, Jan Kara wrote:
> On Wed 16-08-17 09:06:20, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Trivial fix to spelling mistake in reiserfs_warning message
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks. Added to my tree. BTW, why did you CC Ingo and Jens?

I was wondering the same :-)

scripts/get_maintainer.pl -f fs/reiserfs/journal.c
Jan Kara <jack@suse.cz> (commit_signer:2/4=50%,authored:2/4=50%,added_lines:3/8=38%,removed_lines:3/6=50%)
Ingo Molnar <mingo@kernel.org> (commit_signer:1/4=25%,authored:1/4=25%,added_lines:1/8=12%,removed_lines:1/6=17%)
Jens Axboe <axboe@fb.com> (commit_signer:1/4=25%)
reiserfs-devel@vger.kernel.org (open list:REISERFS FILE SYSTEM)
linux-kernel@vger.kernel.org (open list)

So I guess it makes sense. I did commit a change to the file 8 years
ago, so I guess you could say that me and reiserfs are getting
pretty serious.

-- 
Jens Axboe

