From: Felipe Monteiro de Carvalho <felipemonteiro.carvalho@gmail.com>
Subject: Re: Reiser 3.6: Recover partition start position & Journal
Date: Thu, 1 Jan 2015 11:15:25 +0100
Message-ID: <CACyNnZNqaSiV_ejW93LW-RPS0NSHfq4Mdmooc+xVqZ4mpNt2tg@mail.gmail.com>
References: <CACyNnZP36ZsPJix48p9kAozdK0CFG+e_2z-xXH=mC2YwPnwBFw@mail.gmail.com>
	<54A42F22.90505@telegraphics.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=IvAcrLgBIP0VA6VA8bgh4QlGM+5U0VeNqGK/bOIdxlw=;
        b=dzO4MVkmZRP5EpuRqIGs2DOyJCM390lXxBz40Vqxl4lIIbjXnrHvwMuk7JscLKoBgh
         6hNe7yJUHbj+jqIkJQv8wJfMgIUdur4POmtPa9jBAZp6Y9erlEEjsil51ykizGjdJaNy
         CKC+Q08YLISPfpX3QFEhbahKgnGQQgf9jWtF8/hjAt3ubAPPeAflXv6Is0yR4xpexfp2
         8pI9l9Copz5sC41aJe7gfIg2S8tA9dQZw0KB/B/cyWZ4KyZF0XR25pGRdtINICUK7Oyd
         oXYgugU2u7oJdJr+j239r64V3wF3Sqt4WABL16+5QXmredKFHpRt1dx4asznzvVjM5ei
         nqVw==
In-Reply-To: <54A42F22.90505@telegraphics.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toby Thain <toby@telegraphics.com.au>
Cc: reiserfs-devel@vger.kernel.org

On Wed, Dec 31, 2014 at 6:15 PM, Toby Thain <toby@telegraphics.com.au> wrote:
> I've done this for Reiser 3. I blogged about it here:
> http://slashdot.org/journal/110587

Thanks,

Indeed, supposing that the first found superblock is located at
REISERFS_DISK_OFFSET_IN_BYTES (0x10000) is a possibility. I was just
wondering if there is anything more reliable, but it looks like that
there isnt. The problem with this approach for an automated program is
that it will fail if the first superblock was overwritten somehow.

thanks,
-- 
Felipe Monteiro de Carvalho
