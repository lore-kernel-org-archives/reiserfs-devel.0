From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 - Non-removable files in lost+found
Date: Mon, 18 Oct 2004 18:41:41 +0200
Message-ID: <20041018184141.2e24e1fe.reiser4@blinkenlights.ch>
References: <40FC740900080188@mail13.jumpyint.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22094-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FC740900080188@mail13.jumpyint.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Also, can this be done when the partition is mounted read-only? 

I did this some months ago and my kernel gave me a nice Oops ;-)

Nikita told me on #reiser4 that it isn't possible to fsck a (ro)-mounted
Filesystem..

Maybe this changed and it's possible now..

bye
