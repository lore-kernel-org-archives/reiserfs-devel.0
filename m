From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 00:51:46 +0200
Message-ID: <112698263.20040826005146@tnonline.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825152805.45a1ce64.akpm@osdl.org>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825152805.45a1ce64.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Hans Reiser <reiser@namesys.com>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com


> And as I see it, there are two big issues:

> a) reiser4 extends the Linux API in ways which POSIX/Unix/etc do not
>    anticipate and 

> b) it does this within the context of just a single filesystem.

> I see three possible responses:

> a) accept the reiser4-only extensions as-is (possibly with post-review
>    modifications, of course) or

> b) accept the reiser4-only extensions with a view to turning them into
>    kernel-wide extensions at some time in the future, so all filesystems
>    will offer the extensions (as much as poss) or

> c) reject the extensions.


> My own order of preference is b) c) a).  The fact that one filesystem will
> offer features which other filesystems do not and cannot offer makes me
> queasy for some reason.

  This last sentence makes me wonder. Where is Linux heading? The idea
  that   a  FS  cannot  contain  features that no other FS has is very
  scary.

  I  am  all  for  uniformity, but not at the expense of shutting down
  advanced progress that Linux is so badly needing.

  This talk about old UNIX seems like people want to still live in the
  70'ies and not look forward. Please wake up!

  ~S


