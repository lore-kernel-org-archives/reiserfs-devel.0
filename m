From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 12:59:50 +0300
Message-ID: <20040723095950.GM4990@nysv.org>
References: <40FE0B47.3010600@slaphack.com> <40FF3DAD.6020100@slaphack.com> <200407221410.25043.vitaly@namesys.com> <200407231159.23162.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200407231159.23162.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Fri, Jul 23, 2004 at 11:59:23AM +0200, Christian Mayrhuber wrote:
>It would be a good idea if the meta filesystem interface always auto 
>terminates strings (add + '\0') issued by echo. procfs does it that way.

Or add a small parser that allows \n so that cat output would look
better...

-- 
mjt

