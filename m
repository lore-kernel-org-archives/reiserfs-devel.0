From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: Overwritten files
Date: 17 Apr 2002 07:27:37 +0200
Sender: hjclaes@web.de
Message-ID: <1018978845.1035.5.camel@lappix>
References: <20020416105325.2a854a19.ikkeswar@dds.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020416105325.2a854a19.ikkeswar@dds.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rutger Swarts <ikkeswar@dds.nl>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Am Die, 2002-04-16 um 10.53 schrieb Rutger Swarts:
> 
> Hi all, 
> 
> I do not know if this is the right place to post this, but I can't think of any better place, so here goes:
> 
> I recently discovered that one of my files was overwritten somehow. It resides on a reiserfs partition which is mounted read-only. The contents of the file where overwritten with parts of other files on seemingly random places and bits of ASCII text.
> 
> Looking over it now I see it contains parts of win32 applications (strings like "This program can not be run in dos mode") and XML files. I do not know if there are any other files affected by this (quite a lot of files on that partition) but I will check each file before I backup. 
> 
> Now my question:
> 
> Is this a known issue? if yes: what can I do about it? if no: what information do you need to reproduce/solve this problem? (stop it from happening again, that is)
> 
> Rutger Swarts

Hi,

do you boot the box sometimes with windows? I had a similar problem on a
laptop with windows 98 and linux (with ext2). Sometimes, windows seem to
overwrite the first partition and write onto the next one. This happend
two times in half a year. In my case, the linux installation was no
bootable any more.

Hope this helps,
Heinz-Josef Claes

PS:
No Microsoft products were used in any way for the creation of this
message. If you are using a Microsoft product to view it, BEWARE! - I'm
not responsible for any harm you might encounter as a result. :-)


