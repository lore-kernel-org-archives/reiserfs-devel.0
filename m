From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCH 0/2] libaal: add device "discard" operation.
Date: Fri, 09 May 2014 00:03:08 +0200
Message-ID: <536BFF1C.5040103@gmail.com>
References: <1399576404-5527-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=fBGTjkL5mIzi980qbYz8Ak6xFjiloPxCWb9BdFkpUR8=;
        b=xxk3/YIjVNuJskAfkDucJOIOUiBuhLso7d8tGmFrfW81+RegLXoBrvWofD7rCFauf4
         HGVbzn1lML0VhDm+u1eaOhwbjVUx3n9K/cG0uWwNU9eBrsTyuLZ9LRXxbTdzVpDayaN3
         0Zur55UAkGOOZi9LRhvFE7kt9nWF5YK7aZJ1yr7TyUivdFG7ileQ9qiBnBDjJI1jnINx
         o+85IW7lmZs/VCZgVOCxBV5YPfqmnMlvcTvISiLEjonbaZ5UxRV47UA3C4Of1gYL2NL8
         0ej3K4jQmHYzdj8Rc7M6NukmwHK2NZaOU86XHHj0cqc7btS4/By6lXAawG/o6RZmltRe
         TLSg==
In-Reply-To: <1399576404-5527-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Great, thank you!

To our shame, reiser4 neither preallocates, nor punches holes.
TBH, too lazy ;) I prefer to concentrate on features, which are
either unique, or perform better in reiser4 (like discard)...

Thanks,
Edward.


On 05/08/2014 09:13 PM, Ivan Shapovalov wrote:
> This implements device discard functionality in libaal to be used
> by mkfs and friends.
>
> Note that the build system is _not_ regenerated, so the direct result of
> applying these patches won't build.
>
> Ivan Shapovalov (2):
>    configure.in: check for fallocate() and related headers.
>    Add aal_device_discard() function and implement it for file-based
>      device.
>
>   configure.in         |  4 +--
>   include/aal/device.h |  4 +++
>   include/aal/types.h  |  3 +++
>   src/device.c         | 15 +++++++++++
>   src/file.c           | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 98 insertions(+), 2 deletions(-)
>

