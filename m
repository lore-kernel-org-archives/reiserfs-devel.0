From: Oleg Drokin <green@namesys.com>
Subject: Re: When is a defragmenting tool expected to be released?
Date: Sat, 26 Apr 2003 11:30:20 +0400
Message-ID: <20030426073020.GA2283@namesys.com>
References: <569438017.20030425213516@tnonline.net> <200304261414.00860._nasturtium@bigpond.com> <000e01c30bbb$23ca3470$0200a8c0@xpstation>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <000e01c30bbb$23ca3470$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Apr 26, 2003 at 08:14:47AM +0200, Fred -- Speed Up -- wrote:

> Hans said Reiser4 would use data preallocate blocks as ext2 does, and the
> Reiser4 feature paper is speaking about a "repacker" that should be fully
> functionnal at 4.1 release. How do you feel about that ?

reiser4 has delaying allocation implemented.
The "preallocate blocks as ext2 does" reference is reiserfs (v3) thing
(there is no 2.4 version of reiser4)

Bye,
    Oleg
