From: Joe Feise <jfeise@feise.com>
Subject: Re: Bug (?) with 2.6.15-mm4
Date: Mon, 16 Jan 2006 13:00:01 -0800
Message-ID: <43CC0951.5090808@feise.com>
References: <20060116182241.GA5121@gelma.net> <43CBF44C.60106@feise.com> <43CC023F.2080809@web.de>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CC023F.2080809@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Heiko Przybyl wrote on 01/16/06 12:29:

> just a quick dirty and possible bad thought:
> 
> 
> -mm4:
> 
> +i386-enable-4k-stacks-by-default.patch
> 
>  Test 4k stacks some more
> 
> 
> reiser4:
> 
> Note: please make sure that you have checked in
> 
>     Code maturity level options
>     ---> Prompt for development and/or incomplete code/drivers
> 
> and NOT checked in
> 
>     Kernel hacking ---> Use 4Kb for kernel stacks instead of 8Kb
> 
> 
> 
> maybe the default config option of 4k stacks kills reiser4? so i won't test
> it for now :-)


Well, for my configuration, the "use 4kb+4kb for kernel stacks instead of 8kb"
option is turned off.
I followed some of the 4kb stack posts on LKML, so I made sure to stick to 8kb
for the time being.
Thanks for the suggestion, though.

-Joe

