From: "B. J. Zolp" <bjzolp@wisc.edu>
Subject: Re: reiaserfsck core dumps
Date: Mon, 12 Jan 2004 16:27:40 -0600
Message-ID: <40031F5C.7080005@wisc.edu>
References: <4001D0BA.5020604@wisc.edu> <200401121315.09707.vitaly@namesys.com>
 <4002E765.3070201@wisc.edu> <200401130059.28689.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-16467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <200401130059.28689.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Cc: reiserfs-list@namesys.com

The site suggests doing this:

reiserfsck --badblocks file device

but as far as I can tell "--badblocks" is no longer supported.



Vitaly Fertman wrote:

>>Jan 12 11:07:45 orion kernel: hdb: dma_intr: status=0x51 { DriveReady
>>SeekComplete Error }
>>Jan 12 11:07:45 orion kernel: hdb: dma_intr: error=0x40 {
>>UncorrectableError }, LBAsect=10158456, high=0, low=10158456,
>>sector=10158456
>>Jan 12 11:07:45 orion kernel: end_request: I/O error, dev 03:40 (hdb),
>>sector 10158456
>>    
>>
>
>So your harddrive has bad blocks, have a look at 
>	http://www.namesys.com/bad-block-handling.html
>to get the info how to handle them. 
>If you need our further assistance visit please our support 
>page in terms of which we deal with hardware problems:
>	http://www.namesys.com/support.html
>
>  
>

