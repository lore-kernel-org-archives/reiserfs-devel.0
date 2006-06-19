From: Tom Vier <tmv@comcast.net>
Subject: Re: Backup solution
Date: Mon, 19 Jun 2006 14:49:21 -0400
Message-ID: <20060619184921.GB3895@zero>
References: <d94c5e090606181312w23860bx459e78677b976254@mail.gmail.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <d94c5e090606181312w23860bx459e78677b976254@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gert <gwcheck@gmail.com>
Cc: Reiserfs-List@namesys.com

On Sun, Jun 18, 2006 at 10:12:14PM +0200, Gert wrote:
> Dunno if this is the right place to ask but does anyone know of any Open
> Source solutions that can back up Reiser/Ext3 on OES Linux and NSS on OES
> NW?

I use the standard gnu tar -g (incremental mode). Works well for me. Search
freshmeat.net for "backup".

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
