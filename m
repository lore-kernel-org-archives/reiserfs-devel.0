From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [syzbot] [mm?] [reiserfs?] kernel panic: stack is corrupted in ___slab_alloc
Date: Mon, 10 Jul 2023 09:43:36 +0200
Message-ID: <CACT4Y+YAyK02ORyzS79ub+XOK6x5LV8_2k4aztwzjP=0dm--RQ@mail.gmail.com>
References: <0000000000002373f005ff843b58@google.com> <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com>
 <CACT4Y+akPvTGG0WdPdSuUFU6ZuQkRbVZByiROzqwyPVd8Pz8fQ@mail.gmail.com> <61032955-4200-662b-ace8-bad47d337cdc@os.amperecomputing.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688975029; x=1691567029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nS9m98kU7hDON5ryRvZOg6LMxfmYBsr98C/Sd1A13CI=;
        b=RRqBnnb//nW6t3nRLasnJxQx/GuIxdAwXp2wOP+BcyAvcthgWgkd+sTtfie/kr9sAd
         GEA+ScniPM6o+JkXSqNJOQPrsNrlUwGtSErq4Ck12+nVA1sryxW0D9j2QH2+W0Osm37g
         wWZ41cJxErNPAQerVielB8/hlK1eqCAna5mAUYY1dO3atmeeNXzMNhTCbb2V12JU+rhO
         VXztVnfWWTLxZRc43VtumJ69UvXhYIeU4FvO62r+Qk7YG3h679bl3vSofsRls4sGjdhb
         hQ9Nbyuq5rvLS3xQB2FtQOB4lM9k+CkCX9t940ApquPV0ZZfzq+i5NLGjwJvT9hbo8jm
         TpyA==
In-Reply-To: <61032955-4200-662b-ace8-bad47d337cdc@os.amperecomputing.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc: David Rientjes <rientjes@google.com>, syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>, 42.hyeyoo@gmail.com, Andrew Morton <akpm@linux-foundation.org>, iamjoonsoo.kim@lge.com, keescook@chromium.org, linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, penberg@kernel.org, reiserfs-devel@vger.kernel.org, roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com, Vlastimil Babka <vbabka@suse.cz>, Jan Kara <jack@suse.cz>

On Thu, 6 Jul 2023 at 20:33, Lameter, Christopher
<cl@os.amperecomputing.com> wrote:
>
> On Mon, 3 Jul 2023, Dmitry Vyukov wrote:
>
> >> This is happening during while mounting reiserfs, so I'm inclined to think
> >> it's more of a reisterfs issue than a slab allocator issue :/
>
> Have you tried to run with the "slub_debug" kernel option to figure out
> what got corrupted?

Can slub_debug detect anything that KASAN can't?
I would assume KASAN can detect more bugs (e.g. stack/globals) and
report way better. And it was already enabled in the config.
