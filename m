From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiserfs3, rsync and hardlinks
Date: Tue, 8 Feb 2005 11:42:57 +0200
Message-ID: <20050208094257.GX26192@nysv.org>
References: <20050206034102.3956432d@polo.concept-micro.com> <42066D9C.8030908@slaphack.com> <20050206225539.0c2d0c10@polo.concept-micro.com> <4206FDC4.1060401@slaphack.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4206FDC4.1060401@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Pierre Etchemaite <petchema@concept-micro.com>, reiserfs-list@namesys.com

On Sun, Feb 06, 2005 at 11:33:56PM -0600, David Masover wrote:
>There was a debian package which caused a hash collision.  Every time.
>Not even something obscure; I think it was some piece of X.

Which, btw, has been around for a looong time and a LOT of people have
it installed. Without a hash collision. Not once.

Now I haven't been reading these messages as carefully as I should have,
after some time of being away, but seems to me no-one could explain
why that hash collision came to be for that one guy.

>Think I remember some other filesystem being really lightweight CPU.
>UFS or something.  But XFS shouldn't be too bad.  Where does your
>"probably" come from?

UFS as in Unix File System? Eww..

Dunno about CPU usage, but I tested XFS once and it was painfully slow.
Fortunately it got better, so maybe my test was somewhat flawed.

Maybe the Namesys guys would want to release some new and up-to-date
benchmarks now that the AMD64 panic bug is fixed?

-- 
mjt

