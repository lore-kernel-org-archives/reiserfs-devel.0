From: Oleg Drokin <green@namesys.com>
Subject: Re: Filesystem errors
Date: Wed, 17 Jul 2002 12:10:56 +0400
Message-ID: <20020717121056.A12081@namesys.com>
References: <200207160146.01440.cabernet@internode.on.net> <200207160222.50147.cabernet@internode.on.net> <20020717094252.C4841@namesys.com> <200207171736.44485.cabernet@internode.on.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200207171736.44485.cabernet@internode.on.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Marr <cabernet@internode.on.net>
Cc: Reiserfs list <reiserfs-list@namesys.com>

Hello!

On Wed, Jul 17, 2002 at 05:36:44PM +0930, Brian Marr wrote:

> Thanks for your comments. My system is still going under my watchful eye. I 
> tried to copy the data using tar to a spare diskl
> tar -cplf - -C /myhardrive . | tar -xpvf -
> but this did not go far. I wonder if I could boot into rescue and do  a dd ?
> I have not used this before.

use dd_rescue tool, conventional dd is not working very good with
broken hard disks.

Bye,
    Oleg
