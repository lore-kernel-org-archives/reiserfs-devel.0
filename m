From: Felipe Alfaro Solana <lkml@felipe-alfaro.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:39:45 +0200
Message-ID: <200408261639.46951.lkml@felipe-alfaro.com>
References: <1453776111.20040826131547@tnonline.net> <Pine.LNX.4.44.0408260938340.26316-100000@chimarrao.boston.redhat.com> <1714037053.20040826155924@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1714037053.20040826155924@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: Rik van Riel <riel@redhat.com>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thursday 26 August 2004 15:59, Spam wrote:

>   Backup to me is a special case, not simply a copy of files, but also
>   retaining all the extra data, info, attributes, etc, that comes with
>   the file.
>
>   Enabling  support  to  have  all  of  this  extra  stuff  below  the
>   application  level  it  will  be  possible to retain everything even
>   though applications do not support them.
>
>   Backup tools, however, must know about these new features to be able
>   to  backup  them.  And so will every tool that directly accesses the
>   filesystem instead of using the OS API for it.

Thus, this kind of metadata API must be made accessible through the VFS layer, 
if we want to make it FS-independent (not tied to Reiser4). If the real FS 
does not support metadata operations, just ignore them (much like in ISO9660 
ignoring write operations).

>   And  from  I  learned  in an earlier message, tools like cp actually
>   work  on  the  fs level and themselves move the data to the new file
>   instead   of  letting  the OS handle it. This seem to me as it could
>   be  dangerous and could also prevent any kind of enhancements to the
>   FS unless every tool like cp is patched.

I still don't understand why a copy_file() syscall is still missing.
