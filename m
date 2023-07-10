From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [syzbot] [mm?] [reiserfs?] kernel panic: stack is corrupted in
 ___slab_alloc
Date: Mon, 10 Jul 2023 09:48:32 +0200
Message-ID: <81008a82-1012-0b3e-134d-cd4a6502482c@suse.cz>
References: <0000000000002373f005ff843b58@google.com>
 <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com>
 <CACT4Y+akPvTGG0WdPdSuUFU6ZuQkRbVZByiROzqwyPVd8Pz8fQ@mail.gmail.com>
 <61032955-4200-662b-ace8-bad47d337cdc@os.amperecomputing.com>
 <CACT4Y+YAyK02ORyzS79ub+XOK6x5LV8_2k4aztwzjP=0dm--RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1688975313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fRpvaHVraWSmHTGJgS9clU+E/bcwnLOg/tYUV1kAHRE=;
        b=ufZzycZCEkPD2nrQoG4+dtHe8kA8EW77H029j9Xq3LHluFcZYhXXA7ej//80aRMG8s9xKl
        NQ1upAr5rQTL8Mza6HMyNujpPhCn8pLdHposlI6TZvTMthdpcIhqAzEOOkxH61AJ+h3sNu
        Kw6b1/rjRjtmOFTogWqqzowAK3o/Ht0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1688975313;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fRpvaHVraWSmHTGJgS9clU+E/bcwnLOg/tYUV1kAHRE=;
        b=Mwyd/jn03BMgejZI9arRq+bB0/xugZ61s1kGZVIDlAfkprKpO+1ahjdebxiVMlKSBY/WwJ
        LZWt8mKxiz9C2AAQ==
Content-Language: en-US
In-Reply-To: <CACT4Y+YAyK02ORyzS79ub+XOK6x5LV8_2k4aztwzjP=0dm--RQ@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dmitry Vyukov <dvyukov@google.com>, "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc: David Rientjes <rientjes@google.com>, syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>, 42.hyeyoo@gmail.com, Andrew Morton <akpm@linux-foundation.org>, iamjoonsoo.kim@lge.com, keescook@chromium.org, linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, penberg@kernel.org, reiserfs-devel@vger.kernel.org, roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com, Jan Kara <jack@suse.cz>

On 7/10/23 09:43, Dmitry Vyukov wrote:
> On Thu, 6 Jul 2023 at 20:33, Lameter, Christopher
> <cl@os.amperecomputing.com> wrote:
>>
>> On Mon, 3 Jul 2023, Dmitry Vyukov wrote:
>>
>> >> This is happening during while mounting reiserfs, so I'm inclined to think
>> >> it's more of a reisterfs issue than a slab allocator issue :/
>>
>> Have you tried to run with the "slub_debug" kernel option to figure out
>> what got corrupted?
> 
> Can slub_debug detect anything that KASAN can't?

Probably not, KASAN will find out a bad write at the moment it happens,
while slub_debug only later from corrupted red zone/poison.

> I would assume KASAN can detect more bugs (e.g. stack/globals) and
> report way better. And it was already enabled in the config.

Anyway this is a stack corruption, not slab layout corruption. It's probably
hard to distinguish a legitimate stack write from an overrun so even KASAN
could not catch it immediately?
