From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [git-pull -tip] fix headers_check warnings
Date: Mon, 2 Feb 2009 20:53:12 +0300
Message-ID: <20090202175312.GB7479@localhost>
References: <1233593765.3244.14.camel@localhost.localdomain> <20090202172159.GA7479@localhost> <1233595855.28370.1.camel@localhost.localdomain> <4987321A.1020404@zytor.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=OzG5fc/Hq9OGkTPOp0Pu1YTtU1FWuI55/NdZVK3ct9c=;
        b=dyJcc6+TVFCz76iKlT9pvvigTbkdXcY92qFLIBKg1NGlomRQ3zkzXU/NFuPVKTLQca
         MzQ6bNev0p9uANSAeqf0un7sCbY77qGtPU032ZytNDfnxLaZ/DFZ46KcIEeuIGu0WsZQ
         WqsGH2R0mRnIm/GYvgtYr2LO+LQyixoIIOsnE=
Content-Disposition: inline
In-Reply-To: <4987321A.1020404@zytor.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jaswinder Singh Rajput <jaswinder@kernel.org>, Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

[H. Peter Anvin - Mon, Feb 02, 2009 at 09:49:14AM -0800]
| Jaswinder Singh Rajput wrote:
| >>
| >> Hi Jaswinder,
| >>
| >> it seems we have a clash here :) I thought this part
| >> was just dropped out
| >>
| >> 	http://lkml.org/lkml/2009/1/14/461
| >>
| >> and Peter had been applying it on tip:x86/header-fixes
| >>
| >> 	http://lkml.org/lkml/2009/1/14/549
| >>
| >> but maybe it's just lost...
| > 
| > No, you cannot remove sys_arch_prctl otherwise you will get sparse
| > warning like this:
| > 
| >   CHECK   arch/x86/kernel/process_64.c
| > arch/x86/kernel/process_64.c:833:6: warning: symbol 'sys_arch_prctl' was not declared. Should it be static?
| > 
| 
| Perhaps we can just move this prototype to <asm/syscalls.h>.
| 
| 	-hpa
| 
| -- 
| H. Peter Anvin, Intel Open Source Technology Center
| I work for Intel.  I don't speak on their behalf.
| 

Hmm...

For internal use we refer to do_arch_prctl and
sys_arch_prctl supposed to be syscall wrapper.

Yes, Peter, you're right! It seems this call
was missed there.

		-Cyrill-
