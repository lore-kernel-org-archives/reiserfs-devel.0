From: Ragnar Hojland Espinosa <ragnar@linalco.com>
Subject: Re: problem with a bad block in bitmap table
Date: Wed, 27 Aug 2003 17:10:20 +0200
Message-ID: <20030827151020.GA14852@linalco.com>
References: <20030827132052.GA13552@linalco.com> <200308271828.45686.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15460-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308271828.45686.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Wed, Aug 27, 2003 at 06:28:45PM +0400, Vitaly Fertman wrote:
> this is unfortunatelly the block the reiserfs keeps its system info in,
> and there is no way to relocate it or just mark as bad.

Ugh.  May I suggest the obvious, adding this into reiserfss new versions..

> Have you tried to write into this block? If the internal harddrive's list of badblocks 
> is not full, it may get remapped and block may become readable again. In the

I tried, didn't do anything.  I'm also getting a few AddrMarkNotFound
errors, so its quite well headed onto the dead pile.

> case this succeeds you will need to run reiserfsck --fix-fixable after. But if it 
> does not, that means that you have a lot of bad blocks and there is no space 
> in the harddrive internal list of bad blocks -- you really need to replace the 
> harddrive. While replacing you can run 
>         dd if=/dev/hdb2 of=somewhere conv=sync,noerror
> (or even better to use dd_rescue). 
> Am I right that hdb2 is the fauly one? 

Yeah.  I attempted to dd if=/dev/hdb2 conv=sync,noerror |gzip to see
if i could make it fit somewhere and still have a backup, but even if
the HD has 50 GB free it doesn't compress well.. I could had tried to
clean the unused blocks with 0s, but it doesn't look too
straightforward with that bitmap in the middle.. so I'm gonna take it
to work, backup it there, pray, and try your --fix-fixable suggestion.

> the tree inself is ok (I hope), but reiserfs has some system info in the block
> that is not readable anymore. If you really want to continue with this broken 
> harddrive and need our assistance, visit please our support page 
> (www.namesys.com/support.html) -- we deal with hardware problems in term 
> of this page.

I actually would love to get rid of it ;)  Thanks.
-- 
Ragnar Hojland - Project Manager
Linalco "Specialists in Linux and Free Software"
http://www.linalco.com Tel: +34-91-5970074 Fax: +34-91-5970083
