From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Nikita 19891
Date: Tue, 10 Jul 2007 23:35:37 -0500
Message-ID: <1184128537.10438.16.camel@gentoo>
References: <20070711044617.GA12129@efil.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070711044617.GA12129@efil.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Bormuth <ibormuth@efil.de>
Cc: reiserfs-devel@vger.kernel.org

I've hit the same panic looping kernel builds (while true ; do make
mrproper ; make allmodconfig ; make -j4 ; done) on 2.6.21.1 with the
Namesys patch and reiser4 debug enabled. I've seen it on my amd64
desktop and x86 laptop.

Another one I've seen is:
        reiser4 panicked cowardly: reiser4[fixdep(16043)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]

In both cases the fsck didn't find anything, as you observed.

On Wed, 2007-07-11 at 06:46 +0200, Ingo Bormuth wrote:
> Hmm, whenever I try to build busybox (1.4.2) I get nikita-191 panics:
> 
> [...]
> cc	console_tools/clear.o
> reiser4 panicked cowardly: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
> kernel panic - not syncing: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
> 
> Running fsck.reiser4 before and after the panic doesn't show any complaints.
> The partition is heavily used. I'm not aware of any other problem.
> 
> Vanilla-2.6.21.6 (kernel.org) with reiser4-2.6.21-path (namesys.com).
> 
> Not that I understood the code, but why is it an assertion at all?
> Couldn't one just use an empty hint if the current one is invalid?
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

