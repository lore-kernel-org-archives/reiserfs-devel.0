From: Hans Reiser <reiser@namesys.com>
Subject: Re: Bug (?) with 2.6.15-mm4
Date: Mon, 16 Jan 2006 19:21:27 -0800
Message-ID: <43CC62B7.50901@namesys.com>
References: <20060116182241.GA5121@gelma.net> <43CBF44C.60106@feise.com> <43CC023F.2080809@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CC023F.2080809@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heiko Przybyl <lil_tux@web.de>
Cc: reiserfs-list@namesys.com, Adrian Bunk <bunk@fs.tum.de>

  vs, can you comment and if it is a problem send a patch?

Hans

Heiko Przybyl wrote:

>just a quick dirty and possible bad thought:
>
>
>-mm4:
>
>+i386-enable-4k-stacks-by-default.patch
>
> Test 4k stacks some more
>
>
>reiser4:
>
>Note: please make sure that you have checked in
>
>    Code maturity level options
>    ---> Prompt for development and/or incomplete code/drivers
>
>and NOT checked in
>
>    Kernel hacking ---> Use 4Kb for kernel stacks instead of 8Kb
>
>
>
>maybe the default config option of 4k stacks kills reiser4? so i won't test
>it for now :-)
>
>
>cya Heiko
>
>  
>

