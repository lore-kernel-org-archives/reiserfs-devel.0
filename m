From: Hans Reiser <reiser@namesys.com>
Subject: Re: when distros do not support official Marcelo kernels they are
 not being team players (was Re: reiserfs on redhat advanced server?)
Date: Wed, 05 Feb 2003 01:57:21 +0300
Message-ID: <3E404551.6060700@namesys.com>
References: <20030131122147.GE15359@marowsky-bree.de>	 <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>	 <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com>	 <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com>	 <3E3EC7EC.8090005@namesys.com> <1044304857.15684.475.camel@tiny.suse.com>	 <3E3F0D5D.5070409@namesys.com> <20030204163609.GT19723@suse.de>	 <3E403488.9050408@namesys.com> <1044397378.15684.714.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1044397378.15684.714.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Hubert Mantel <mantel@suse.de>, =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

Chris Mason wrote:

>
>This is the key point that I seem to be failing to convey, so please
>explain how we can:
>
>A) modify a kernel because it doesn't work, and then B) help people use
>the unmodified kernel that doesn't work without C) telling them to use
>our modifications.
>
It is very rare that a stable official kernel fails at every task.  I 
encourage you to tell them to use your modified kernel when your 
modification is relevant to the bug they have, and to be proud that you 
are able to do so.

When my Dell laptop can't power on, I don't want to hear about how I 
need to install windows before I can get warranty service.

When a Redhat user's C compiler is broken, he should not hear about how 
he needs to get rid of 2.4.18 and go back to some RedHat variant of 
2.4.9 before he can get support for the broken C compiler.   He should 
be able to upgrade the kernel to an official stable kernel in which 
ReiserFS is at its most stable without worrying that he is endangering 
his ability to get C compiler support.

-- 
Hans


