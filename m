From: Matthew Wilcox <willy@infradead.org>
Subject: Re: Is it time to remove reiserfs?
Date: Thu, 24 Feb 2022 21:06:25 +0000
Message-ID: <YhfzUc8afuoQkx/U@casper.infradead.org>
References: <YhIwUEpymVzmytdp@casper.infradead.org>
 <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
 <20220222221614.GC3061737@dread.disaster.area>
 <3ce45c23-2721-af6e-6cd7-648dc399597@winds.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gqwsfxNL/6u6rNbdgXApLMLgt2yxqOUUOtWYMHIjK/s=; b=TIctb2fI/Th0lTWb0MsVMD/mze
        ygDbG+qwvvYChpgzeugUgvWAh1UnWeb+BBL4nWUOLBYTLF1WDKe4XaRG+RZGIH0gFFGxo6L/JClJa
        W9mwKicf+pRvoyYIJRjMJ9WwEvCr8yxmoKVlb6mtFvGHqlF4Qof/J+JJuna1JWC1wUHIQAXacYgRe
        Z+3OjnWf/3pC1oAJXDqzTpfvRMF9n1o/LqiyljVjemJYY5d5stQe9rJFFHkjWHAl2Bfwp4i+rUpfE
        PM5zdL1+Gs7HXhVFVDvA6MFrXjw0o7szFHgmJxI52cUFFdKBtjzigj2IEaEY8SfBHUBGOJ/2ImjHw
        viPH3q1w==;
Content-Disposition: inline
In-Reply-To: <3ce45c23-2721-af6e-6cd7-648dc399597@winds.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Byron Stanoszek <gandalf@winds.org>
Cc: Dave Chinner <david@fromorbit.com>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, Feb 23, 2022 at 09:48:26AM -0500, Byron Stanoszek wrote:
> For what it's worth, I have a number of production servers still using
> Reiserfs, which I regularly maintain by upgrading to the latest Linux kernel
> annually (mostly to apply security patches). I figured this filesystem would
> still be available for several more years, since it's not quite y2038k yet.

Hey Byron, thanks for sharing your usage.

It's not entirely clear to me from your message whether you're aware
that our annual LTS release actually puts out new kernels every week (or
sometimes twice a week), and upgrades to the latest version are always
recommended.  Those LTS kernels typically get five years of support in
total; indeed we just retired the v4.4 series earlier this month which
was originally released in January 2016, so it got six years of support.

If we dropped reiserfs from the kernel today (and thanks to Edward, we
don't have to), you'd still be able to use a v5.15 based kernel with
regular updates until 2028.  If we drop it in two years, that should
take you through to 2030.  Is that enough for your usage?
