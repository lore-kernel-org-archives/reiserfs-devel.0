From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Segfault in fsck.reiser4
Date: Wed, 24 Mar 2010 14:10:26 +0100
Message-ID: <4BAA0F42.90308@gmail.com>
References: <7880.2170.3389-28898-1298266740-1269420891@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <7880.2170.3389-28898-1298266740-1269420891@seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vidra.Jonas@seznam.cz
Cc: reiserfs-devel@vger.kernel.org

Vidra.Jonas@seznam.cz wrote:
> Dne Tue, 23 Mar 2010 23:31:48 +0100 Edward Shishkin 
> <edward.shishkin@gmail.com> napsal(a):
>
>> Segfault is caused by aux_adler32: offset (4294839597) is out of 
>> bounds..
>> Could you print and show us the structure "hint"?
>
> (gdb) print hint
> No symbol "hint" in current context.

try to jump several levels up: the function ccreg40_check_cluster
has an argument ccreg40_hint_t *hint, it shouldn't be optimized.

>
> Am I doing it right or should I set a breakpoint somewhere before the 
> crash?
