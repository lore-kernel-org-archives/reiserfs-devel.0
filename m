From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: reiser4 - Non-removable files in lost+found
Date: Mon, 18 Oct 2004 20:33:49 +0400
Message-ID: <4173F06D.6010802@namesys.com>
References: <40FC740900080188@mail13.jumpyint.it> <20041018184141.2e24e1fe.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041018184141.2e24e1fe.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

Adrian Ulrich wrote:

>>Also, can this be done when the partition is mounted read-only? 
>>    
>>
>
>I did this some months ago and my kernel gave me a nice Oops ;-)
>
>Nikita told me on #reiser4 that it isn't possible to fsck a (ro)-mounted
>Filesystem..
>
>Maybe this changed and it's possible now..
>  
>
no, this does not work properly still.

Thanks,
Lena

>bye
>
>
>  
>


