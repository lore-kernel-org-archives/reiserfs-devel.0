From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: port for linux-4.6
Date: Thu, 31 Mar 2016 22:18:23 +0200
Message-ID: <56FD860F.3000004@gmail.com>
References: <S1755885AbcCaQ3L/20160331162911Z+322@vger.kernel.org> <20160331104445.27365523be0b145177dd6863@korinar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=WELvx48RucLWOE59V0serl+B1Yw2qjf1eeVU7OvHq8U=;
        b=U5x8lbTBlrlx50me1ZuUhG1hVs7aCLqAy2rZMzVZd7HqOv/hwkw3T8I5J+s1gYWssk
         Iwu7pf4ObRYm7okrmERfeFX6E1cvb92yAa6q/KRLIt6FNQwsTRkmmMOUXV+P6ACZB/8I
         r4mObft9RBfbAi6xmdxDbMm9nW6uuS8kPwfQQSyYODyE5s6L+Vpi7FagJTg+KZYxNFv3
         jZkGPjvl/7InBeEBX8kfyXeDI6P5K7a10WyEVLx28uRUohLZGCxcpi7NDuOyAp2096tw
         n2H2gsPu4i1Mm08irJ6aLawOC14jdE2hUEu8DGbyMmKxRg9lDiJujwKKkgW3QlC9NpMU
         7eJA==
In-Reply-To: <20160331104445.27365523be0b145177dd6863@korinar.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mathieu Belanger <admin@korinar.com>, reiserfs-devel@vger.kernel.org

Thanks a lot!

Edward.

On 03/31/2016 06:44 PM, Mathieu Belanger wrote:
> * New kernel use tmp_wb instead of wb for that part of generic_writeback_sb_inodes
>
> * Migration doesn't clear page->mem_cgroup of live pages
> anymore and so account_page_dirtied do not take a mem_cgroup third argument anymore.

