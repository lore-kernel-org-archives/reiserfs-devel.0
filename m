From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: discard support: perform discard before
 all deallocations.
Date: Mon, 28 Jul 2014 13:46:01 +0200
Message-ID: <53D637F9.2010304@gmail.com>
References: <1405966771-12575-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=E34GwNgXVfRhd2hWA/UMnWZmexLQraFfwEClVIgAE8Y=;
        b=SBsEEo6qsUB2S1PVZxAMmN0SGnchGsTPN+xOcZiZPh2Ofaklei6YSZNW3k76/9OgbQ
         A9Uwt10ZgyU+J3CkgG0pmK5XVam7BeZDkl79J3liU36k0W5VJikiLz/vi2rCZp47LXhV
         TuKkct4zHjICBTaP3Qq5u9XWnQ6+9hmM53RekoSBlvsUB6qO/kK13Qt51Uhwrr6CCxdc
         zpsQy/jDjutDf+cvwa7QNTpd1sUXwFcAAkh/OHAG5SpF02ePZ6H29JHBCyKlQhJOnHCV
         KFfZfw4u8Wp5328V+77yyVgQedFnz9BOQuLGCpfum0vtUDloDmF0b3VDsLxTmVYOoCBO
         CAzw==
In-Reply-To: <1405966771-12575-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Thanks, looks OK (I haven't tested it yet though..)

I suggest to release a version without garbage collection for now
(just pass the sorted and merged extents to blkdev_issue_discard).

Thanks,
Edward.

On 07/21/2014 08:19 PM, Ivan Shapovalov wrote:
> This applies on top of PATCHv6 of "initial implementation".
> The first patch has been already sent some time ago, but I've included it
> here for sake of clarity.
>
> v2: fix disk space leak in error path, fix comments and commit messages, etc.
>
> Ivan Shapovalov (3):
>    reiser4: fix reiser4_post_{commit,write_back}_hook() and their invocations.
>    reiser4: discard support: use reiser4_post_write_back_hook() for discarding and completing deferred deallocations.
>    reiser4: discard support: perform discard before all deallocations.
>

