From: Oleg Drokin <green@namesys.com>
Subject: Re: fsck problem on suse 7.2
Date: Mon, 9 Dec 2002 13:59:05 +0300
Message-ID: <20021209135905.A9669@namesys.com>
References: <80649203.1039434914@[192.168.100.101]>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <80649203.1039434914@[192.168.100.101]>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Henze <lists@mhcsoftware.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Dec 09, 2002 at 11:55:14AM +0100, Matthias Henze wrote:

> i've a system withe suse 7.2 - reiserfsck stats after a recoverd RAID crash:
> check_semantic_tree: no root directory found
> is there any hope ??

What version on reiserfsck do you have? If it is stock SuSE version, then
download reiserfsprogs-3.6.4 from ftp://ftp.namesys.com/pub/reiserfsprogs
and try reiserfsck from there. If it still does not work, let us know.
Also what options have you given to reiserfsck this time?

Bye,
    Oleg
