From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 13:21:02 +0200
Message-ID: <1018894074.20040828132102@tnonline.net>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
 <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
 <4130562B.5020709@namesys.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-20976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4130562B.5020709@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Rik van Riel <riel@redhat.com>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>


  I  am  thinking  that  is  there  was a proper API for accessing the
  filesystem  then this problem wouldn't arise because things could be
  done  behind  the curtains inside the API, instead of having all the
  tools to be rewritten to know.

  Think of FAT32, for example, the new filenames will be retained even
  if  you use old tools on them. It is only if you mount it as a FAT16
  volume they will be lost.

  Even  if  this  is fixed for Reiser4 now. Next time someone wants to
  make  changes like this we have the exact same problem yet again.
  

> Just have a special name instead of a special boundary, or, better, have
> a filename/pseudos/backup method that outputs everything needed to 
> backup the object "filename".

> Hans

> Linus Torvalds wrote:

>>On Fri, 27 Aug 2004, Rik van Riel wrote:
>>  
>>
>>>Thing is, there is no way to distinguish between what are
>>>virtual files and what are actual streams hidden inside a
>>>file.  You don't know what should and shouldn't be backed
>>>up...
>>>    
>>>
>>
>>I think that lack of distinguishing poiwer is more serious for 
>>directories. The more I think I think about it, the more I wonder whether
>>Solaris did things right - having a special operation to "cross the 
>>boundary".
>>
>>I suspect Solaris did it that way because it's a hell of a lot easier to
>>do it like that, but regardless, it would solve the issue of real 
>>directories having both real children _and_ the "extra streams".
>>
>>		Linus
>>
>>
>>  
>>

