From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 00:51:15 +0200
Message-ID: <20040825225115.GA19808@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <112698263.20040826005146@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

>   This last sentence makes me wonder. Where is Linux heading? The idea
>   that   a  FS  cannot  contain  features that no other FS has is very
>   scary.
> 
>   I  am  all  for  uniformity, but not at the expense of shutting down
>   advanced progress that Linux is so badly needing.
> 
>   This talk about old UNIX seems like people want to still live in the
>   70'ies and not look forward. Please wake up!

Just because semantics are at the VFS layer doesn't mean every
filesystem has to implement them.

