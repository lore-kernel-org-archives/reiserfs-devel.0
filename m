From: Rik van Riel <riel@redhat.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 09:39:35 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0408260938340.26316-100000@chimarrao.boston.redhat.com>
References: <1453776111.20040826131547@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1453776111.20040826131547@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 26 Aug 2004, Spam wrote:

>   Yes, JPEG, TIFF and PNG files for example. But, if you modify any of
>   these  with  an application that doesn't support the extensions then
>   you will loose them.

OK, so we've got a choice.

Either we will lose the extensions when modifying the file
with an unaware program, or you lose the extensions when
copying (or restoring from backup) using an unaware program.

Personally I'd prefer to keep the file intact when not
modifying it...

-- 
"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan

