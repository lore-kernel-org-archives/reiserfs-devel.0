From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 6/6] vfs: change inode times to use struct timespec64
Date: Mon, 14 May 2018 09:30:34 -0700
Message-ID: <CAGXu5jJpO+z8k_=UuVY9WAeiEgABQg4gWE6nz82BX0_UhaPUWw@mail.gmail.com>
References: <20180512045921.18311-1-deepa.kernel@gmail.com>
 <20180512045921.18311-7-deepa.kernel@gmail.com> <CAGXu5jLFHSE12La25QEvZawdBm84cLavtTD5LAA6MqeqBmbYuw@mail.gmail.com>
 <CABeXuvpi_dm6TE3pH_KGehgNwW177hJFBmR8u29w6KJH1aA1Kg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=093kTC61tUBMYiI/AigrShBLYsigXOOyh5t03UWc1Pc=;
        b=pMiSsaj/V+Erl6zoK02simASnbXj98fHk0Vth2rmmV1h4vST0aTCEgsl0FjTPr0s8I
         +6tvRza/VAHy+CvbGAvaKjBHLN5RdB/nvV3jRXfdJneBuuNAlniY7IOAQzxNdaH0H85F
         vFldAhcWb5ROCYQB0Rp5Qejeot1Ufx0MaNUxlA79ILqSVSPrG1OEfl+g/ihGEXxKY/x+
         s/tuR2UPrKBUNqgWWKgbg3gD5+9H35fSiY0Uq0qF+4yEo7FAuA60xVzvdLU/WXb4KgjN
         q4vo+LW5Gp+YXdJ0U4hQ/4a1nguyKpQaU+GB+bJuuxO1uePTAanD3ayd/XrJRO6b758f
         ngMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=093kTC61tUBMYiI/AigrShBLYsigXOOyh5t03UWc1Pc=;
        b=dhBhhQEBomQSa6uzc4GdnIe3MKMaGFv9/8IY4bQQoTeRJ3PQkt0GpGM4wd/J5E6kR5
         lZc+HayN1JxTdqzF6E507i8k5+y4NfZHv2JPDWWJOZSx8QPPv6Hc5ywDnMwHHf0X9wKT
         +QZ9BjzEmmNumvBWWAeBzZRhNwzy78WegiLAs=
In-Reply-To: <CABeXuvpi_dm6TE3pH_KGehgNwW177hJFBmR8u29w6KJH1aA1Kg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, anton@tuxera.com, Felipe Balbi <balbi@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, "Darrick J. Wong" <darrick.wong@oracle.com>, David Howells <dhowells@redhat.com>, David Sterba <dsterba@suse.com>, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mike Marshall <hubcap@omnibond.com>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, Jiri Slaby <jslaby@suse.com>, Mark Fasheh <mark@fashe>

On Sun, May 13, 2018 at 9:05 PM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> Kees mentioned that he wants to merge a patch to pstore that changes
> it to use timespec64 internally for 4.17:
> https://lkml.org/lkml/2018/5/13/3

I'm still working on a v2 for pstore. What is the correct
cross-architecture format string for timespec64's tv_sec? In your
other patches, you're using %lld and a (long long) cast. I'd really
like to avoid the need for casts.

-Kees

-- 
Kees Cook
Pixel Security
