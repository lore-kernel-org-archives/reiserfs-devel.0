From: Isaac Chanin <chanin@WPI.EDU>
Subject: Re: AMD64/Reiser4 testing and problems
Date: Wed, 22 Dec 2004 00:45:02 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0412220034020.22465-100000@ccc2.wpi.edu>
References: <Pine.LNX.4.44.0412210016220.20178-100000@ccc9.wpi.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0412210016220.20178-100000@ccc9.wpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi everybody,
I have a few updates.  The second bug that i mentioned 
earlier has been dismissed, it is definitely possible to boot into a 
reiser4 system on AMD64.  The first bug is very hard to replicate, I've 
tried everything that caused it the first time without any luck - I'm 
starting to think that it must be caused by some race condition (and hence 
comes up randomly) or one of the debug options prevents it from happening 
(however unlikely that may be.)

However, it may have shown it's face again - after successfully compiling 
everything from glibc to xfce4 I finally got another reiser4 failure.  It 
happened pretty much like so:

---------------------------------------------------------
root /etc/X11 # /etc/init.d/gpm stop
reiser4 panicked cowardly: assertion failed: 
reiser4_find_next_zero_bit(bnode_working_data(bnode), end_offset, 
start_offset) >= end_offset
----------- [cut here ] --------- [please bite here ] ---------
Kernel BUG at debug:131
invalid operand: 0000 [1]
CPU 0
Modules linked in:
Pid: 6648, comm: runscript.sh Tainted: G   M  2.6.10-rc2-mm4
RIP: 0010:[<ffffffff801a0070>] <ffffffff801a0070>{reiser4_do_panic+768}
RSP: 0018:ffff81003d5497c8  EFLAGS: 00010246
RAX: ffffffff80564ac0 RBX: ffff81003d549da8 RCX: ffffffff80564ac0
RDX: ffff81003d549e78 RSI: ffffffff80564ac0 RDI: ffff81003f1e9400
RBP: ffff81003f1e9400 R08: 0000000000000000 R09: 0000000000000005
R10: 00000000ffffffff R11: 0000000000000000 R12: 00000000000009e4
R13: 00000000000009e4 R14: 0000000000000001 R15: 00000000000009c3
FS:  00002aaaaaeb8700(0000) GS:ffffffff805a2080(0000) 
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 00005555556729c0 CR3: 000000003d844000 CR4: 00000000000006e0
Process runscript.sh (pid: 6648, threadinfo ffff81003d548000, task 
ffff81003e8ee860)
Stack: 0000003000000010 ffff81003d5498a8 ffff81003d5497e8 00000000000019f8
       ffffffff804081b0 ffffffff80441d90 0000000000000000 0000000000000000
       0000000000000000 0000000000000003
Call Trace:<ffffffff801a0348>{get_current_log_flags+8} 
<ffffffff801eda78>{reiser4_block_count+72}
        <ffffffff801a00a9>{schedulable+9} 
<ffffffff802617a0>{load_and_lock_bnode+96}
        <ffffffff80260ff6>{parse_blocknr+326} 
<ffffffff8019fd55>{reiser4_print_prefix+133}
        <ffffffff8019fc29>{report_err+9} 
<ffffffff802627a2>{check_blocks_bitmap+1042}
        <ffffffff801c62b6>{reiser4_check_block+22} 
<ffffffff801a7df0>{zget+1088}
        <ffffffff80200c27>{do_reiser4_file_readahead+999} 
<ffffffff8015dd63>{handle_mm_fault+1107}
        <ffffffff80201090>{reiser4_file_readahead+240} 
<ffffffff8026b627>{read_unix_file+775}
        <ffffffff80235d20>{read_tail+0} 
<ffffffff8026911c>{unix_file_filemap_nopage+236}
        <ffffffff801bea75>{done_context+741} 
<ffffffff801fb1f1>{reiser4_read+689}
        <ffffffff8015cb79>{do_wp_page+153} 
<ffffffff8016cc27>{vfs_read+199}
        <ffffffff8016cf13>{sys_read+83} 
<ffffffff8010e16a>{system_call+126}

Code: 0f 0b aa 1a 42 80 ff ff ff ff 83 00 48 c7 c6 40 46 56 80 48
RIP <ffffffff801a0070>{reiser4_do_panic+768} RSP <ffff81003d5497c8>
Segmentation fault
--------------------------------------------------------

A few things to note about the circumstance would be that
 - I had restarted without properly umounting the drives a few times 
before the bug occured (i'm not so sure how much fsck checking is 
happening at boot-time, it doesn't seem like much.)
 - Everything worked fine after the bug until...
 - Once I tried to stop gpm again, it went into an infinite loop of 
outputting errors (the syslogger died, so I couldn't get them) much like 
the previous error.

Also, if anyone has any suggestions, based upon either of my past two 
e-mails about anything to try (to either fix, or cause the bug to occur 
again) please feel free to suggest it - the output from these really tells 
me next to nothing so I'm kind of working blind here.

Anyways, I hope that output is a bit more helpful,

Isaac


Also, sorry about responding to myself three times now - it's just that it 
took me so long to get another bug that I figured an update was in order 
(not like it's so bad compared to the real spam on the list).

