From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Tue, 10 Aug 2004 22:37:22 +0400
Message-ID: <411915E2.8020800@namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408101948.29202.frbiscani@jumpy.it> <200408102156.00690.vitaly@namesys.com> <200408102009.39695.frbiscani@jumpy.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408102009.39695.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francesco Biscani <frbiscani@jumpy.it>
Cc: reiserfs-list@namesys.com

Hello

Francesco Biscani wrote:
> Hi,
> 
> 
>>are messages about 'wrong size' or about 'wrong bytes' or both?
> 
> 
> I'm _almost_ sure it's about "wrong bytes". I'll confirm ASAP. Are they 
> potentially harmful?
>

wrong bytes is harmless. There was a bug recently which counted each byte twice. It is fixed already.
fsck --fix will fix this kind of corruptions.


> Oh, BTW, "debugfs -C" worked ok here.
> 
> Regards,
> 
>   Francesco
> 
> 


