From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Nikita 19891
Date: Mon, 23 Jul 2007 18:09:38 -0500
Message-ID: <1185232178.10128.11.camel@gentoo>
References: <20070711044617.GA12129@efil.de>
	 <1184128537.10438.16.camel@gentoo>  <4695341B.3000303@namesys.com>
	 <1184303576.8861.12.camel@gentoo>  <46979B83.2040809@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <46979B83.2040809@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: Ingo Bormuth <ibormuth@efil.de>, reiserfs-devel@vger.kernel.org, "Vladimir V. Saveliev" <vs@namesys.com>

On Fri, 2007-07-13 at 19:34 +0400, Edward Shishkin wrote:
> Jake Maciejewski wrote:
> 
> >On Wed, 2007-07-11 at 23:48 +0400, Edward Shishkin wrote:
> >  
> >
> >>Jake Maciejewski wrote:
> >>
> >>    
> >>
> >>>I've hit the same panic looping kernel builds (while true ; do make
> >>>mrproper ; make allmodconfig ; make -j4 ; done) on 2.6.21.1 with the
> >>>Namesys patch and reiser4 debug enabled. I've seen it on my amd64
> >>>desktop and x86 laptop.
> >>>
> >>>Another one I've seen is:
> >>>       reiser4 panicked cowardly: reiser4[fixdep(16043)]: sibling_list_remove (fs/reiser4/tree_walk.c:814)[zam-32245]
> >>>
> >>>In both cases the fsck didn't find anything, as you observed.
> >>>
> >>>On Wed, 2007-07-11 at 06:46 +0200, Ingo Bormuth wrote:
> >>> 
> >>>
> >>>      
> >>>
> >>>>Hmm, whenever I try to build busybox (1.4.2) I get nikita-191 panics:
> >>>>
> >>>>[...]
> >>>>cc	console_tools/clear.o
> >>>>reiser4 panicked cowardly: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
> >>>>kernel panic - not syncing: reiser4[cc1(13066)]: save_file_hint (fs/reiser4/plugin/file.c:705) [nikity-1991]:
> >>>>   
> >>>>
> >>>>        
> >>>>
> >>Somebody missed set_file_hint(), which synchronizes the coords.
> >>    
> >>
> err, sorry, its name is reiser4_set_hint
> 
> >>Unfortunately I can not reproduce it. Would you please (if possible)
> >>catch the stack with the attached patch?
> >>    
> >>
> >
> >[<ffffffff88186b5e>] :reiser4:save_file_hint+0xee/0x3c0
> >[<ffffffff88189c60>] :reiser4:read_unix_file+0x940/0xa10
> >[<ffffffff80276bbb>] vfs_read+0xdb/0x180
> >[<ffffffff80277083>] sys_read+0x53/0x90
> >[<ffffffff8020993e>] system_call+0x7e/0x83
> >  
> >
> 
> Thanks!
> Indeed, the coords are not synchronized when reading tails. However,
> it is not a fatal bug: we are victims of brain damaged and unreadable
> hint interface.
> 
> The possible fix is attached. Would you please test it?
> Also don't forget to apply this patch: 
> http://lkml.org/lkml/diff/2007/7/11/396/1
> as it also can be related to the problem.
> 
> Edward.

Sorry for being so late to reply. Yes, the fix works, but it took some
time to test because I'm still seeing the previously mentioned panic in
sibling_list_remove, except now it takes an hour or two to panic. I'm
reasonably sure I'm not seeing the save_file_hint panic anymore, though.

> 
> >As for reproducing it, I think I should mention that:
> >
> >1. I'm using distcc to speed things up. Without offloading the compiling
> >work, my laptop has lasted ~3.5hrs before a panic. My desktop with
> >distcc configured usually only lasts a few minutes.
> >
> >2. My local storage is encrypted through dm-crypt, but I've also tried
> >over open-iscsi and got the same results.
> >
> >  
> >
> >>>>Running fsck.reiser4 before and after the panic doesn't show any complaints.
> >>>>The partition is heavily used. I'm not aware of any other problem.
> >>>>
> >>>>Vanilla-2.6.21.6 (kernel.org) with reiser4-2.6.21-path (namesys.com).
> >>>>
> >>>>Not that I understood the code, but why is it an assertion at all?
> >>>>Couldn't one just use an empty hint if the current one is invalid?
> >>>>   
> >>>>
> >>>>        
> >>>>
> >>Sure, it is possible to not use it at all. But if the current one is valid,
> >>it would be nice to use it to avoid tree traversal with waiting for 
> >>possible locks, etc..
> >>
> >>Thanks,
> >>Edward.
> >>
> >>    
> >>
> 
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

