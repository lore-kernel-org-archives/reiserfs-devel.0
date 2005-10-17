From: Sinitsyn Valentine <Valentine.Sinitsyn@usu.ru>
Subject: reiser4 and laptop_mode
Date: Mon, 17 Oct 2005 16:24:29 +0600
Message-ID: <19812996093.20051017162429@usu.ru>
Reply-To: Sinitsyn Valentine <Valentine.Sinitsyn@usu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

I'm considering installing Reiser4 on my laptop, but I also want to
use laptop_mode (http://www.xs4all.nl/~bsamwel/laptop_mode/index.html)
to save battery power. So I'm wondering wether these two products are
compatible with each other? I know that Reiser3 and ext3 did require
special patches (now included in mainstream kernels) which schedule
commits in a way which allows hard drive to spin down. I've looked
through Google and this mailing list but didn't find any references to
similar patches for Reiser4. Are they needed but nobody wrote them yet
or is Reiser4 spindown-friendly just out of the box? The main point of
spindown-friendliness is an ability to tune a period between two
commits (like "commit=N" mount option in Reiser3, AFAIU), but the only
suitable parameter I found glancing through Reiser4 sources is
"atom_max_age".

Thanks in advance.

Best regards,
Valentine Sinitsyn.

