From: Vince <fuzzy77@free.fr>
Subject: Re: status of grub reiser4 support ?
Date: Tue, 16 Mar 2004 11:57:08 +0100
Message-ID: <4056DD84.2010107@free.fr>
References: <405597B6.1000906@free.fr> <40561487.5070503@free.fr> <40561583.8050705@free.fr> <200403161237.44869.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17241-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403161237.44869.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Hi,

with your latest patches, grub can now read reiser4 partitions (both 
from linux and from the bios) but:
1) any attempt to load a kernel image sitting on a reiser4 partition 
just hangs
2) attempting to install grub on a reiser4 partition results in a 
segmentation fault (no backtrace yet, I have to recompile...).

Vitaly Fertman wrote:
> 
> yes, thank you, I have found a few other bugs also, so attached are 
> the fixed grub patch and fixes for the reiser4progs. You probably
> do not have fibration plugins yet, so just through away the last diff
> in the reiser4progs patch.
> 
