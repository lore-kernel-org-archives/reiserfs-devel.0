From: Erik Terpstra <erik@solidcode.net>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 16:26:52 +0200
Message-ID: <3EAD3A2C.4070509@solidcode.net>
References: <3EAD34D5.8030108@solidcode.net> <200304281417.h3SEHudA003449@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304281417.h3SEHudA003449@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:

>On Mon, 28 Apr 2003 16:04:05 +0200, Erik Terpstra <erik@solidcode.net>  said:
>  
>
>>Hi,
>>
>>I am looking for a solution for the following problem:
>>
>>On a legacy system for newspaper workflow, files are delivered to a 
>>certain directory (for example ~/input).
>>These files (in TIFF format) can be quite large (10 to 400 MB), they 
>>could be copied over the local filesystem, a Samba share or via FTP.
>>When large files are copied over the network these files show up in 
>>~/input while they are being copied (you can see the filesize grow).
>>
>>However TIFF files are only useful for further processing when they are 
>>complete.
>>    
>>
>
>Note that *any* solution has to deal elegantly with the case of a transfer
>that fails partway through.  No amount of 'fuser' or reiser trickery will
>fix the case where you are receiving a 400mb TIFF, and the connection is
>closed after 250M is transferred.
>
I agree, but shouldn't it be possible to see a distinction between files 
that are actually there and those that are coming in?
 From my problem domain there are three cases:

1) Files that are arriving
2) Files that have arrived and are complete (i.e. correct TIFF format)
3) Files that have arrived and are incomplete (invalid TIFFs)

I am happy to deal with case 2 and 3, but I am not interested in case 1.

If my problem domain is not related to filesystems then that's okay, but 
I appreciate your opinion (I am not a filesystem expert).

  Erik.

