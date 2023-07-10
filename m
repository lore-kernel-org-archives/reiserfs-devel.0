From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [syzbot] [mm?] [reiserfs?] kernel panic: stack is corrupted in ___slab_alloc
Date: Mon, 10 Jul 2023 09:52:58 +0200
Message-ID: <CACT4Y+YKhrpWJcngv3ux_gKeFOY2DEGK9qBJ4RZs-QdPr8Embg@mail.gmail.com>
References: <0000000000002373f005ff843b58@google.com> <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com>
 <CACT4Y+akPvTGG0WdPdSuUFU6ZuQkRbVZByiROzqwyPVd8Pz8fQ@mail.gmail.com>
 <61032955-4200-662b-ace8-bad47d337cdc@os.amperecomputing.com>
 <CACT4Y+YAyK02ORyzS79ub+XOK6x5LV8_2k4aztwzjP=0dm--RQ@mail.gmail.com> <81008a82-1012-0b3e-134d-cd4a6502482c@suse.cz>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688975591; x=1691567591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5oH0pdHc/AD7BbguQ+ExRoTK+qQ+GGDnFEytO7M0Ysg=;
        b=D/b8pVSiZ0dxeIVyTNBG/kXk5BuAoTTUhvLuB8mewl8H3Xq/H1raK18eutRDR3ZLTT
         2ntFe0SCXuQDGkNmx8Th/yZFBz0Ncgi5k9RMwVP0aunBHGTmrW5FZ73NsbdzUkqGQchO
         ZE0sp9JySeX+IHneqt8dYNTE6WVOy1bhCkl/jgtUsZlrtwspSztvrgG10dnPpnCeMdwk
         c4VyJCj2TzQA9E53yFqFX9N75F84D+cWSJ0cHypW2o1cvQ9LyYyHbYwxgVmrOBt2cNF8
         E0pUwaWqsTL2u7YJP7Wdw6p8bCfxlASGWqAZiJEXTkZhIGHlIP/W9hCY7ZazgPnXJH08
         o7Vw==
In-Reply-To: <81008a82-1012-0b3e-134d-cd4a6502482c@suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Lameter, Christopher" <cl@os.amperecomputing.com>, David Rientjes <rientjes@google.com>, syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>, 42.hyeyoo@gmail.com, Andrew Morton <akpm@linux-foundation.org>, iamjoonsoo.kim@lge.com, keescook@chromium.org, linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, penberg@kernel.org, reiserfs-devel@vger.kernel.org, roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com, Jan Kara <jack@suse.cz>

On Mon, 10 Jul 2023 at 09:48, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 7/10/23 09:43, Dmitry Vyukov wrote:
> > On Thu, 6 Jul 2023 at 20:33, Lameter, Christopher
> > <cl@os.amperecomputing.com> wrote:
> >>
> >> On Mon, 3 Jul 2023, Dmitry Vyukov wrote:
> >>
> >> >> This is happening during while mounting reiserfs, so I'm inclined to think
> >> >> it's more of a reisterfs issue than a slab allocator issue :/
> >>
> >> Have you tried to run with the "slub_debug" kernel option to figure out
> >> what got corrupted?
> >
> > Can slub_debug detect anything that KASAN can't?
>
> Probably not, KASAN will find out a bad write at the moment it happens,
> while slub_debug only later from corrupted red zone/poison.
>
> > I would assume KASAN can detect more bugs (e.g. stack/globals) and
> > report way better. And it was already enabled in the config.
>
> Anyway this is a stack corruption, not slab layout corruption. It's probably
> hard to distinguish a legitimate stack write from an overrun so even KASAN
> could not catch it immediately?

KASAN can detect stack out-of-bounds writes.
However, use-after-return detection support was never implemented in
KASAN (user-space ASAN can detect them as well).
User-space MSAN can also detect use-after-scope, I think it's not
implemented in KMSAN as well.

If we ever get to the root cause of this bug, it may be useful to
analyze why it wasn't detected and if it's possible to make such bugs
detected.
