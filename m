From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: OOPS-ERRORS
Date: Tue, 06 Apr 2004 16:28:44 +0400
Message-ID: <1081254524.1163.60.camel@tribesman.namesys.com>
References: <200404051400.42345.michael@corp.mercuryin.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404051400.42345.michael@corp.mercuryin.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Schwietering <michael@corp.mercuryin.es>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-04-05 at 16:00, Michael Schwietering wrote:
> I get this on reiserfs, and sync does not come back again... Anyone has ideas? 
> Or do you need more specific infos?
> 

Can you reproduce this problem?

> Unable to handle kernel paging request at virtual address 00100000
> c1a1140c
> *pde = 00000000
> Oops: 0002 2.4.21-198-default #1 Thu Mar 11 17:43:56 UTC 2004
> CPU:    0
> EIP:    0010:[<c1a1140c>]    Not tainted
> EFLAGS: 00010217
> eax: c1a113d0   ebx: c1cf0540   ecx: c1cf0560   edx: 00100000
> esi: c3399f24   edi: 00000000   ebp: c1cf0540   esp: c3399f0c
> ds: 0018   es: 0018   ss: 0018
> Process pop3d (pid: 27062, stackpage=c3399000)
> Stack: c1cf0540 c015e15b c1cf0540 c1cf05ac c1a0733e c1cf0540 ddf84800 00000001 
>        00000000 00000144 0035ddf5 00000000 00000000 ddf84800 c1cf0540 c1a07310 
>        c1a301a0 cfb938e0 c015ea87 c1cf0540 cfb938e0 c1cf0540 c3399f90 c015c57c 
> Call Trace:         [<c015e15b>] (12) [<c1a0733e>] (44) [<c1a07310>] (04)
>   [<c1a301a0>] (08) [<c015ea87>] (20) [<c015c57c>] (16) [<c015c61d>] (16)
>   [<c0154e2e>] (56) [<c0109073>] (60)
> Code: ff 0a 0f 94 c0 84 c0 75 1b c7 83 6c 01 00 00 00 00 00 00 5b 
> 
> 
> >>EIP; c1a1140c <[reiserfs]reiserfs_clear_inode+3c/80>   <=====
> 
> >>eax; c1a113d0 <[reiserfs]reiserfs_clear_inode+0/80>
> >>ebx; c1cf0540 <[sd_mod].bss.end+1452a1/814dc1>
> >>ecx; c1cf0560 <[sd_mod].bss.end+1452c1/814dc1>
> >>edx; 00100000 Before first symbol
> >>esi; c3399f24 <[st].bss.end+3c33c1/5194fd>
> >>ebp; c1cf0540 <[sd_mod].bss.end+1452a1/814dc1>
> >>esp; c3399f0c <[st].bss.end+3c33a9/5194fd>
> 
> Trace; c015e15b <clear_inode+cb/f0>
> Trace; c1a0733e <[reiserfs]reiserfs_delete_inode+2e/d0>
> Trace; c1a07310 <[reiserfs]reiserfs_delete_inode+0/d0>
> Trace; c1a301a0 <[reiserfs]reiserfs_sops+0/50>
> Trace; c015ea87 <iput+f7/220>
> Trace; c015c57c <dentry_iput+3c/70>
> Trace; c015c61d <dput+6d/140>
> Trace; c0154e2e <sys_unlink+ce/110>
> Trace; c0109073 <system_call+33/40>
> 
> Code;  c1a1140c <[reiserfs]reiserfs_clear_inode+3c/80>
> 00000000 <_EIP>:
> Code;  c1a1140c <[reiserfs]reiserfs_clear_inode+3c/80>   <=====
>    0:   ff 0a                     decl   (%edx)   <=====
> Code;  c1a1140e <[reiserfs]reiserfs_clear_inode+3e/80>
>    2:   0f 94 c0                  sete   %al
> Code;  c1a11411 <[reiserfs]reiserfs_clear_inode+41/80>
>    5:   84 c0                     test   %al,%al
> Code;  c1a11413 <[reiserfs]reiserfs_clear_inode+43/80>
>    7:   75 1b                     jne    24 <_EIP+0x24> c1a11430 
> <[reiserfs]reiserfs_clear_inode+60/80>
> Code;  c1a11415 <[reiserfs]reiserfs_clear_inode+45/80>
>    9:   c7 83 6c 01 00 00 00      movl   $0x0,0x16c(%ebx)
> Code;  c1a1141c <[reiserfs]reiserfs_clear_inode+4c/80>
>   10:   00 00 00 
> Code;  c1a1141f <[reiserfs]reiserfs_clear_inode+4f/80>
>   13:   5b                        pop    %ebx
> 
> 
> ____________________________
> Michael Schwietering
> 
> 
> 

