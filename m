From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] reiserfs: avoid objtool warning after panic
Date: Fri, 16 Dec 2022 09:00:16 +0100
Message-ID: <9355f758-9d06-4de8-85f7-e6ad870e784b@app.fastmail.com>
References: <20221215162759.3883282-1-arnd@kernel.org>
 <202212160636.H31oByti-lkp@intel.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1671177636; x=1671264036; bh=5gJEzTEVlD
        vy8Tq4Os1u/SyKmtOlFe98ZaBLVtWSjLo=; b=mpPkOVZpl8rf1pwDwWPS4bqcU0
        VndnE7TSqW4XXlPbyMN44J+1DRleuFK3oNGVJ/cFtbOWbyyPtlJZaGanI5CK7jdL
        Jci/x9KgM20GTcHGynN7GCCdYfpf82wus43jLCkMGDqXiKbdImyukuo+P7EwtuBi
        XWUhFjwXbxzggkRA+wfHitPY4/A8lw+dZFZuN2HHD8JVBxKa3949pb89p3aDbprw
        HB7EYcf1IGbm+HTp7XJhzgOx5TfTWA+EfBH9AqYfB7PPqAZ3vJ5jnKkstW2taB+V
        PgPdQ0rhGXqVIj3ASh2qqhMTGgb26AUA8RayfuF/lMfkjYRuTDpM4U4kTetQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1671177636; x=1671264036; bh=5gJEzTEVlDvy8Tq4Os1u/SyKmtOl
        Fe98ZaBLVtWSjLo=; b=cQyLeyayy261CDcbjVHQ+p4UD5lwwMTO22x2L90jU/n4
        lyFK0Y9RMZb6CtTPoiweojIUfogCrY6hhbiduYD1efsvnZpa2rrL93JuRApuXnKE
        7wiq4/2z+mlc70LkIyIE08rNdqsZSAwUGsaeUGRerJ0Fhv64CFiNoasBUlrkcUR8
        pQw6MPnQNL8N3EE+KDOUofR+vSqHLnNuidyfrUU8jMY5BSZiunsf6wPhCyssDl6I
        tcBvgDSiE5FUMuhJQ/UgdeEubHDlg3JAi3ws0scPifQjoB/doolLipqndn80kkx/
        yDlLcFRRD8YEA0ZbA2RyYL3YrwQGAGRt9JxhrhKxnw==
In-Reply-To: <202212160636.H31oByti-lkp@intel.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@kernel.org>, reiserfs-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org

On Thu, Dec 15, 2022, at 23:31, kernel test robot wrote:
> Hi Arnd,
>
> I love your patch! Perhaps something to improve:
>
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> fs/reiserfs/namei.o: warning: objtool: reiserfs_rename+0x212: unreachable instruction
> --
>>> fs/reiserfs/ibalance.o: warning: objtool: balance_internal_when_delete+0x44c: unreachable instruction
> --
>>> fs/reiserfs/stree.o: warning: objtool: reiserfs_cut_from_item+0x17a: unreachable instruction
> --
>>> fs/reiserfs/journal.o: warning: objtool: do_journal_end+0x4af: unreachable instruction
> --
>>> fs/reiserfs/item_ops.o: warning: objtool: direntry_check_left+0x65: unreachable instruction

Ok, I'll have to revisit this one. I think I tried something similar
before and ran into the same problem but I though I had figured
it out this time.

The problem apparently is that the patch to shut up the objtool
warning with clang in turn adds a different objtool warning with
gcc...

    Arnd
