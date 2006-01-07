From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser disc hosed?
Date: Sat, 07 Jan 2006 03:52:36 -0600
Message-ID: <43BF8F64.10004@slaphack.com>
References: <43BF3983.8010004@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43BF3983.8010004@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric P <eric.maillist@gmail.com>
Cc: reiserfs-list@namesys.com

Eric P wrote:
[...]
> Anyway, after reaching 100%, the folder I was working in became
[...]
> NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE.

eek!  Does this happen every time a Reiser4 disk hits 100%?

I can't reproduce it with a 50 meg FS on a loop device, but it still
scares me.
