From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Tue, 31 Aug 2004 21:38:08 +0200
Message-ID: <111617109.20040831213808@tnonline.net>
References: <41323AD8.7040103@namesys.com> <200408312055.56335.v13@priest.com>
 <36793180.20040831201736@tnonline.net> <20040831190814.GA15493@thundrix.ch>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-21172-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040831190814.GA15493@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tonnerre <tonnerre@thundrix.ch>
Cc: V13 <v13@priest.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@digeo.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, reiserfs-list@namesys.com


  

> Salut,

> On Tue, Aug 31, 2004 at 08:17:36PM +0200, Spam wrote:
>>   How  are  things  done on Windows platforms when there are files and
>>   directories  with the same name? In Unix that is imposible. How does
>>   it  work  for  environments  like  Cygwin  etc? What happen to tools
>>   that run in them?

> In  NTFS it's  illegal  IIRC.  At least  the  fs correction  utilities
> complain about a block being assigned to two files.

  I  meant  a  file  and a directory with the same name, not two files
  with the same name :) subtle but important difference.

  ie,  you can have a file named "foo" and a directory named "foo" and
  they won't collide.
  

> Same with HFS+.

> Sometimes  there seem to  be several  things with  the same  name. But
> that's because of hidden extensions (.lnk for example).

> I'm talking out of the book here, maybe the real-world implementations
> of Windows  are different. I can't  tell, I only used  Windows once to
> ssh into a screwed-up router.

> 				Tonnerre


