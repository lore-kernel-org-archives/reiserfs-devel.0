From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 07:42:48 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com>
References: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20642-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Cc: Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Denis Vlasenko wrote:

> > I like cat < a > b. You can keep your progress.
> 
> cat <a >b does not preserve following file properties even on standard
> UNIX filesystems: name,owner,group,permissions.

Losing permissions is one thing.  Annoying, mostly.

However, actual losing file data during such a copy is
nothing short of a disaster, IMHO.  

In my opinion we shouldn't merge file-as-a-directory
semantics into the kernel until we figure out how to
fix the backup/restore problem and keep standard unix
utilities work.

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

