From: Matt Stegman <matts@ksu.edu>
Subject: Re: bug report: attributes ( chattr +a ) not respected by reiserfs
 3.6, but this isn't listed in man mkreiserfs
Date: Fri, 18 Jul 2003 13:03:36 -0500 (CDT)
Message-ID: <200307181803.h6II3aR3002711@elijah.imse.ksu.edu>
References: <20030718160654.GI2268@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030718160654.GI2268@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, marvin@synapse.net

On 18 Jul, Oleg Drokin wrote:
>>   t : do not merge tails on this file
>>       I don't know if this is supported or not.
> 
> Hm, my "chattr" documentation does not have this flag.

My chattr(1) man page comes from e2fsprogs 1.33.  The relevant text is:

A file with the 't' attribute will not have a partial block fragment at
the  of  the  file merged with other files (for those filesystems which
support tail-merging).  This is necessary for applications such as LILO
which  read  the  filesystem  directly,  and who don't understand tail-
merged files.

-- 
    -Matt Stegman
