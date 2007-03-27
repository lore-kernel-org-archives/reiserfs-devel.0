From: Edward Shishkin <edward@namesys.com>
Subject: Re: [Fwd: reiser4 bugs in 2.6.21-rc4]
Date: Wed, 28 Mar 2007 00:14:31 +0400
Message-ID: <46097B27.6090606@namesys.com>
References: <460974EE.8080006@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <460974EE.8080006@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ignatich <ignatich@gmail.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org, Jonathan Briggs <jbriggs@esoft.com>

Ignatich wrote:

>
>
> ------------------------------------------------------------------------
>
> Subject:
> reiser4 bugs in 2.6.21-rc4
> From:
> Ignatich <ignatich@gmail.com>
> Date:
> Tue, 27 Mar 2007 23:29:18 +0400
> To:
> linux-kernel@vger.kernel.org
>
> To:
> linux-kernel@vger.kernel.org
>
> Message-ID:
> <4609708E.5090908@gmail.com>
> User-Agent:
> Thunderbird 1.5.0.10 (Windows/20070221)
> MIME-Version:
> 1.0
> Content-Type:
> text/plain; charset=windows-1251; format=flowed
> Content-Transfer-Encoding:
> 7bit
>
>
> There are two bugs I found in current -mm reiser4 code.
>
> 1. Some files seem to be zeroed out randomly. Usually it's 
> /lib/security/pam_limits.so and /lib/security/pam_deny.so. As 
> fsck.reiser4 didn't find anything wrong I decided to create clean 
> installation in vmware and see if this bug appears on newly formatted 
> partition. It did.
>
> 2. Sometimes I get oppses in reiser4_do_readpage_extent. Assert codes 
> are vs-1426 and nikita-2688. A patch was posted on namesys list to 
> address this problem, but it didn't help.
>
> Kernel: 2.6.21-rc4 with manually applied reiser4 patches from -mm. 
> Arch: x86-64
>

We are working on this.
Thanks for reports,

Edward.

