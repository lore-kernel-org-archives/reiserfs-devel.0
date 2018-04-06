From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH?] reiserfs: prevent panic: don't allow %-char in journal
 dev. name
Date: Fri, 6 Apr 2018 15:45:14 +0200
Message-ID: <f1b08095-c4dc-61f4-0c96-d98a510fb36f@rasmusvillemoes.dk>
References: <d9b518a5-287a-72b3-05f1-ea89e25563ba@infradead.org>
 <20180404184517.9f2b91b856a56f71464f5f7f@linux-foundation.org>
 <6b575956-6498-43c8-dc2c-9e2a0d5564a9@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hCL3BVDTKGOjMi1pnqrd8YVGmtcyGXVMXL8j+J2VSTI=;
        b=Zvd46TCvi73vEgqfLS1CCnmEtHPGzfCrNZg1z4Ba9P4duttkqpx3DjiRK5wIYbSpk5
         +iG04X61EfRWQK4LfGT8HUhX69hXuqCa2bibMkdv9SIUO9iMCiSykmAWQkxMHZQdxU6O
         xPcrKWbb1JRczNtAyCs6OIsp5re5V7RAquQuU=
In-Reply-To: <6b575956-6498-43c8-dc2c-9e2a0d5564a9@rasmusvillemoes.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.com>, Frederic Weisbecker <fweisbec@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>

On 2018-04-05 11:04, Rasmus Villemoes wrote:
> On 2018-04-05 03:45, Andrew Morton wrote:
>>
>> Isn't the bug in journal_init_dev()?
> 
> Urgh. At first I was about to reply that the real bug was in reiserfs.h
> for failing to annotate __reiserfs_warning with __printf(). But digging
> into it, it turns out that it implements its own printf extensions, so
> that's obviously a non-starter. Now, one thing is that some of those
> extension clash with existing standard modifiers (%z and %h, so if
> someone adds a correct %zu thing to print a size_t in reiserfs things
> will break). But, and I hope I'm wrong about this and just hasn't had
> enough coffee, this seems completely broken:
> 
>         while ((k = is_there_reiserfs_struct(fmt1, &what)) != NULL) {
>                 *k = 0;
> 
>                 p += vsprintf(p, fmt1, args);
> 
>                 switch (what) {
>                 case 'k':
>                         sprintf_le_key(p, va_arg(args, struct
> reiserfs_key *));
>                         break;
> 
> On architectures where va_list is a typedef for a one-element array of
> some struct (x86-64), that works ok, because the vsprintf call can and
> does update the args metadata. But when args is just a pointer into the
> stack (i386), we don't know how much vsprintf consumed, and end up
> consuming the same arguments again - only this time we may interpret
> some random integer as a struct pointer...

OK, so maybe -mregparm=3 would be the thing making i386 behave like
x86-64 wrt. varargs, but no, when calling a variadic function, gcc
pushes all arguments on the stack, and va_list is still just a pointer
(passed by value to vsprintf) into the stack.

It is only a problem when the format string contains ordinary specifiers
before a reiserfs-specific one, and such calls happen to be rare, but
not non-existing. One example would be reiserfs_warning(tb->tb_sb,
"vs-12339", "%s (%b)", which, bh);. Ok, treating which as a buffer_head
would probably just give some garbage numbers. But

  "reiserfs-16100", "STATDATA, index %d, type 0x%x, %h",		 vi->vi_index,
vi->vi_type, vi->vi_ih

ends up treating vi->vi_index as a struct item_head*, no?

Rasmus
