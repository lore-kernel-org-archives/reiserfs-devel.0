From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Kernel panic when using repacker with reverse order
Date: Mon, 20 Sep 2004 11:24:19 +0400
Message-ID: <20040920072419.GU5137@backtop.namesys.com>
References: <1986966896.20040918020309@tnonline.net> <20040918152442.GS5137@backtop.namesys.com> <7810725217.20040918174019@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <7810725217.20040918174019@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Sat, Sep 18, 2004 at 05:40:19PM +0200, Spam wrote:
> 
>   Debug options were not turned on. Shall I recompile the kernel with
>   these on?

yes. it gives much more info usually.

>   I have upgraded to rc2-mm1. I will try the repacker again later
>   today and see if there is any change.
> 
>   ~S
>   
> > Hi,
> 
> > On Sat, Sep 18, 2004 at 02:03:09AM +0200, Spam wrote:
> >> 
> >>   I got a severe crash when tried the repacker using reverse (1)
> >>   order. I did first a normal run:
> 
> > Thanks for the resport.
> 
> > Whether reiser4 debug options (assertions) were turned on or off?
>  
> >> 
> >>   echo 0 > direction
> >>   echo 1 > start
> >> 
> >>   Then I did the reverse:
> >> 
> >>   echo 1 > direction
> >>   echo 1 > start
> >> 
> >>   It crashed rather quickly.
> >>   Unfortunately I could not capture the whole debug output:
> >> 
> >> EFLAGS: 00010246   (2.6.9-rc1-mm4)
> >> EIP is at jnode_build_key+0x76/0xc0
> >> eax: c3b3bae0   ebx: 00000000   ecx: 00000000   edx: 0028e000
> >> esi: 0028e000   edi: 00000000   ebp: c3b3bae0   esp: d7581c1c
> >> ds: 007b   es: 007b   ss: 0068
> >> Process ent:loop0! (pid: 27667, threadinfo=d7580000 task=d758c000)
> >> Stack: d7581c58 d7581c58 00000000 c0c77380 d7581dbc 00000002 c01cb943 d7581e00
> >> c0389ce8 00000000 c01cc401 00000002 c05a7da0 00000000 d7581dd8 c0b25120
> >> 00000000 00000105 0000001c 00000000 00000000 00000000 d7581c74 d7581d80
> >> Call Trace:
> >> [<c01cb943>] jnode_lock_parent_coord+0x1b3/0x310
> >> [<c01cc401>] scan_by_coord+0x281/0x320
> >> [<c01cbf7d>] scan_unformatted+0xcd/0x1d0
> >> [<c0138323>] buffered_rmqueue+0x103/0x210
> >> [<c01cbe7f>] scan_common+0x3f/0x50
> >> [<c01cbdd9>] scan_left+0x59/0x90
> >> [<c01c934d>] jnode_flush+0xed/0x3d0
> >> [<c011e047>] tasklet_action+0x37/0x60
> >> [<c01c5bba>] find_first_dirty_jnode+0x2a/0x50
> >> [<c01c9870>] flush_current_atom+0x220/0x2b0
> >> [<c01c640c>] flush_some_atom+0x19c/0x2a0
> >> [<c01da6c9>] entd_flush+0x69/0xf0
> >> [<c0336b77>] schedule+0x237/0x4e0
> >> [<c01da3cc>] entd+0x13c/0x2a0
> >> [<c01da290>] entd+0x0/0x2a0
> >> [<c0101f7d>] kernel_thread_helper+0x5/0x18
> >> Code: 14 8b 83 84 00 00 00 85 c0 75 3b 8d 76 00 8d bc 27 00 00
> >> 00 00 89 e8 e8 b9 b5 01 00 89 c3 8b 44 24 04 89 f2 89 f9 89 04 24
> >> 89 e8 <ff> 53 54 8b 44 24 04 8b 5c 24 08 8b 74 24 0c 8b 7c 24 10 8b
> >> 6c
> >> <6>note: ent:loop0![27667] exited with preempt_count 1
> >>   
> >>   
> >> 
> 
> 

-- 
Alex.
