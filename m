From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 05 Jun 2002 17:32:13 -0400
Message-ID: <1023312733.31475.735.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CFE8234.7010006@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2002-06-05 at 17:27, Manuel Krause wrote:

> 
> BTW, what is this "only" diff good for (is it worth to recompile, I mean):
> # diff '03-beta-data-logging-6.diff' '03-beta-data-logging-5.diff'
> 2777c2777
> < +  if (SB_JOURNAL(p_s_sb)->j_num_lists > 512) {
> ---
>  > +  if (SB_JOURNAL(p_s_sb)->j_num_lists > 256) {

It is a performance tweak, my next patch removes that bit entirely. 
Thanks to some hints from Andrew Morton I've been able to do many more
optimizations for high load fsync heavy applications.  The new patch
will be out later tonight.

-chris




