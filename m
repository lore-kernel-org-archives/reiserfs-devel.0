From: Pierre Abbat <phma@webjockey.net>
Subject: Re: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 08:18:05 -0400
Message-ID: <200304230818.05601.phma@webjockey.net>
References: <Pine.LNX.4.21.0304231506000.3962-100000@entandikwa.ds.co.ug>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0304231506000.3962-100000@entandikwa.ds.co.ug>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 23 April 2003 08:23, Joshua Masiko wrote:
> Now when I do a:
>
>  mount -t reiser fs -o ro /dev/hdd6 /mnt/recover/
>
> I get the following output
> mount: wrong fs type, bad option, bad superblock on /dev/hdd6,
>        or too many mounted file systems

try "reiserfs" without a space, or leave it out and see if it autodetects

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
