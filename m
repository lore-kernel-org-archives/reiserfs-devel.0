From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bugreport: rebuild-sb not behaving as expected
Date: Mon, 7 Apr 2003 10:26:36 +0400
Message-ID: <20030407102636.A1295@namesys.com>
References: <Pine.LNX.4.53.0304062012510.23286@phogen.xs4all.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0304062012510.23286@phogen.xs4all.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Costyn van Dongen <costyn@xs4all.nl>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 06, 2003 at 08:42:30PM +0200, Costyn van Dongen wrote:

> 1. resize_reiserfs -s -5G /dev/hdb3
> 2. using fdisk I deleted the partition /dev/hdb3 and recreated it only
> smaller, leaving an extra margin of about 500MB. I started it at the same
> cylinder as the partition I deleted.

Well, from what I see, it looks like your new partition starts on different
border than old one and also the difference is not multiple of 4096,
hence the "no reiserfs metadata found".
We saw in the past this happens with some installers( probably their fdisk
implementations) that they convert geometry for some reason.
If you have backup of your old partition table, try using it, everything should appear
back.

Bye,
    Oleg
