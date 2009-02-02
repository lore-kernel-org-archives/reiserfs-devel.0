From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [git-pull -tip] fix headers_check warnings
Date: Mon, 02 Feb 2009 09:49:14 -0800
Message-ID: <4987321A.1020404@zytor.com>
References: <1233593765.3244.14.camel@localhost.localdomain>	 <20090202172159.GA7479@localhost> <1233595855.28370.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1233595855.28370.1.camel@localhost.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Cc: Cyrill Gorcunov <gorcunov@gmail.com>, Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

Jaswinder Singh Rajput wrote:
>>
>> Hi Jaswinder,
>>
>> it seems we have a clash here :) I thought this part
>> was just dropped out
>>
>> 	http://lkml.org/lkml/2009/1/14/461
>>
>> and Peter had been applying it on tip:x86/header-fixes
>>
>> 	http://lkml.org/lkml/2009/1/14/549
>>
>> but maybe it's just lost...
> 
> No, you cannot remove sys_arch_prctl otherwise you will get sparse
> warning like this:
> 
>   CHECK   arch/x86/kernel/process_64.c
> arch/x86/kernel/process_64.c:833:6: warning: symbol 'sys_arch_prctl' was not declared. Should it be static?
> 

Perhaps we can just move this prototype to <asm/syscalls.h>.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

