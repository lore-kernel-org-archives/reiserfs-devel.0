From: Oleg Drokin <green@namesys.com>
Subject: Re: Fwd: Re: Segmentation Fault when mounting ataraid
Date: Thu, 30 Jan 2003 09:42:26 +0300
Message-ID: <20030130094225.A17582@namesys.com>
References: <3E36E3EB.4040305@mb.tu-ilmenau.de> <3E381188.8080701@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E381188.8080701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Wed, Jan 29, 2003 at 08:38:16PM +0300, Hans Reiser wrote:

> Well, that certainly looks like a bug in mount options parsing code.  
> Edward and Oleg, please review and fix.

There is another decoded output that makes much more sence to me.
And it suggest something gone wrong within block layer.
(And in the one you are referring to parse_options's address is only
stored in registers, not in bactrace. Also starting from 2.4.20,
there is no function named parse_optinos in reiserfs code).

Bye,
    Oleg
