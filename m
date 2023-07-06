From: "Lameter, Christopher" <cl@os.amperecomputing.com>
Subject: Re: [syzbot] [mm?] [reiserfs?] kernel panic: stack is corrupted in
 ___slab_alloc
Date: Thu, 6 Jul 2023 11:33:00 -0700 (PDT)
Message-ID: <61032955-4200-662b-ace8-bad47d337cdc@os.amperecomputing.com>
References: <0000000000002373f005ff843b58@google.com> <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com> <CACT4Y+akPvTGG0WdPdSuUFU6ZuQkRbVZByiROzqwyPVd8Pz8fQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itrPSoeDsLJol9w/4FSUKciz+u6gsXsPKPZT36bXWFg=;
 b=PIShxFydmxud9cf+pMurDEqcuJe+aIR6DgsT0zknrgxeSaxd/f6zHt7KxZ3bj5EhULC1bJ7JvYBMASR5bNuRrHBV9EN41D83F24hWfsVxpU2aUw4jRE+jvSA1Fcax2CsJ0wW4nozC0E5bX4xohMAj4NTFQQcLCtpttOQC7XPhEo=
In-Reply-To: <CACT4Y+akPvTGG0WdPdSuUFU6ZuQkRbVZByiROzqwyPVd8Pz8fQ@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Dmitry Vyukov <dvyukov@google.com>
Cc: David Rientjes <rientjes@google.com>, syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>, 42.hyeyoo@gmail.com, Andrew Morton <akpm@linux-foundation.org>, iamjoonsoo.kim@lge.com, keescook@chromium.org, linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, penberg@kernel.org, reiserfs-devel@vger.kernel.org, roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com, Vlastimil Babka <vbabka@suse.cz>, Jan Kara <jack@suse.cz>

On Mon, 3 Jul 2023, Dmitry Vyukov wrote:

>> This is happening during while mounting reiserfs, so I'm inclined to think
>> it's more of a reisterfs issue than a slab allocator issue :/

Have you tried to run with the "slub_debug" kernel option to figure out 
what got corrupted?
