From: Brett Russ <icycle@charter.net>
Subject: Re: % of filesystem using tails/tail unpacking (shred
 related)
Date: Mon, 28 Oct 2002 17:38:57 -0500
Message-ID: <3DBDBC81.4040703@charter.net>
References: <HDEFILEPHCPLCAGPLCEMKEMFDFAA.icycle@charter.net>            <15805.2440.413201.310382@laputa.namesys.com> <200210282120.g9SLKvgn005200@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs-List <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu wrote:
> On Mon, 28 Oct 2002 12:55:20 +0300, Nikita Danilov said:
> 
>>Brett Russ writes:
> 
> 
>> > 1) as mentioned first, an impact study should be done to determine if
>> > unpacking will overflow the available space on the device
>>
>>Why cannot you do unpacking just before shredding particular file?
> 
> 
> Unpacking before shredding has a subtle hole in it - since you will unpack
> into *different* disk blocks and then shred *those* blocks, you will be
> leaving unshredded data in the blocks the file occupied before unpacking.

Exactly, that was item #3 on my list.  So given what has been said thus 
far, the following seems to be true:

a) shred will work reliably on all new files created on a filesystem 
mounted with tail packing disabled

b) to deal with filesystems already tail packed, shredding knowledge 
would need to be added to the unpack ioctl BUT there is no way to 
determine where else the tails have lived on disk prior to any rebalancing.

Which leads to:

c) there is no reliable way to shred anything that has been tail packed.

Please affirm or correct my conclusions, and thank you all for your help 
thus far.

-Brett

