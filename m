From: Oleg Drokin <green@namesys.com>
Subject: Re: "get_cnode failed" error
Date: Wed, 11 Dec 2002 10:26:47 +0300
Message-ID: <20021211102647.A6065@namesys.com>
References: <4.3.2.7.2.20021210125742.00b96f60@mail.poulpe.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4.3.2.7.2.20021210125742.00b96f60@mail.poulpe.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Ratti <alex@gabuzomeu.net>
Cc: reiserfs-list@namesys.com, mason@namesys.com

Hello!

On Tue, Dec 10, 2002 at 08:55:08PM +0100, Alexandre Ratti wrote:

> The FS looks OK, but I'm curious. What does this error mean? It is serious?

This error means there was some journaling code screwup. So FS panicked
before it could do any harm to on-disk data.
What does your script does with cp? Do you have at least some aproximate ideas
on what it copied and from where to where?

> Dec 10 00:18:39 p120 kernel:  <0>get_cnode failed!
> Dec 10 00:18:40 p120 kernel: invalid operand: 0000
> Dec 10 00:18:40 p120 kernel: CPU:    0
> Dec 10 00:18:40 p120 kernel: EIP:    0010:[reiserfs_panic+41/88]    Not 
> tainted
> Dec 10 00:18:40 p120 kernel: EFLAGS: 00010282
> Dec 10 00:18:40 p120 kernel: eax: 00000015   ebx: c0215ada   ecx: 
> c087e000   edx: c118da80
> Dec 10 00:18:40 p120 kernel: esi: c13be000   edi: 00000000   ebp: 
> c13be000   esp: c087fe30
> Dec 10 00:18:40 p120 kernel: ds: 0018   es: 0018   ss: 0018
> Dec 10 00:18:40 p120 kernel: Process cp (pid: 7360, stackpage=c087f000)
> Dec 10 00:18:40 p120 kernel: Stack: c0212f5a c02909e0 c0215ada c087fe54 
> c087ff2c c20d7140 c01813d9 c13be000
> Dec 10 00:18:40 p120 kernel:        c0215ada 0141411a c20d7140 c087fe98 
> c087ff08 c016cfb0 ffffffff 00000000
> Dec 10 00:18:40 p120 kernel:        c016d11b c087ff2c c13be000 c20d7140 
> c087feb0 c0392460 c0392460 c087ff2c
> Dec 10 00:18:40 p120 kernel: Call Trace: [journal_mark_dirty+501/772] 
> [update_st at_data+224/232] [reiserfs_update_sd+355/380] 
> [reiserfs_link+199/256] [vfs_link+137/188]
> Dec 10 00:18:41 p120 kernel:    [sys_link+212/308] [sys_lstat64+100/112] 
> [system_call+51/64]
> Dec 10 00:18:41 p120 kernel:
> Dec 10 00:18:41 p120 kernel: Code: 0f 0b 68 e0 09 29 c0 85 f6 74 11 31 c0 
> 66 8b 46 08 50 e8 88

Bye,
    Oleg
