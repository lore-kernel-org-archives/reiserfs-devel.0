From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:56:05 -0700
Message-ID: <412E7895.7020508@namesys.com>
References: <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net> <20040825163225.4441cfdd.akpm@osdl.org> <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <1939276887.20040826114028@tnonline.net> <20040826024956.08b66b46.akpm@osdl.org> <839984491.20040826122025@tnonline.net> <m3llg2m9o0.fsf@zoo.weinigel.se> <1906433242.20040826133511@tnonline.net> <20040826113332.GL2612@wiggy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20855-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826113332.GL2612@wiggy.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Wichert Akkerman <wichert@wiggy.net>
Cc: Spam <spam@tnonline.net>, Christer Weinigel <christer@weinigel.se>, Andrew Morton <akpm@osdl.org>, jra@samba.org, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Wichert Akkerman wrote:

>Previously Spam wrote:
>  
>
>>  How  so?  The whole idea is that the underlaying OS that handles the
>>  copying  should  also  know  to  copy  everything, otherwise you can
>>  implement  everything  into  applications  and  just  skip the whole
>>  filesystem part.
>>    
>>
>
>UNIX doesn't have a copy systemcall, applications copy the data
>manually.
>
>Wichert.
>
>  
>
See sys_reiser4()..... ;-)  you can go "A<-B".  I have hopes of getting 
drive vendors to support us in doing single disk copies without even 
leaving the disk drive.....
