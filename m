From: Oleg Drokin <green@namesys.com>
Subject: Re: Desaster Reiser
Date: Thu, 5 Sep 2002 14:09:42 +0400
Message-ID: <20020905140942.B19752@namesys.com>
References: <3D776FEF.F34E655B@tridentemonigotes.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D776FEF.F34E655B@tridentemonigotes.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jose@tridentemonigotes.com
Cc: reiser <reiserfs-list@namesys.com>

Hello!

On Thu, Sep 05, 2002 at 10:53:35AM -0400, jose@tridentemonigotes.com wrote:
>         -I have a server 2.4.3 and something HD reiserfs. Yesterday one
> of this
> HD started to give me problems this is the message.

2.4.3 kernel is very old ad is filled with known bugs both in reiserfs and other
parts of code. You should consider upgrading.

> After this with reiserfs --check /dev/hdb2 this is the message that gave
> me

What reiserfsprogs version do you have?
If that's not the last one (3.6.3), you should download reiserfsprogs-3.6.3 from
our ftp site.

> I probed with badblocks and reiserfsck --rebuild -sd but was not
> anithing problem and my fear is I wrote that somebody have lose their HD
> with reiserfsck --rebuild -tree because after can't mount their units.I

That was possible because of reiserfsck crash for example, data are still not
lost though partition cannot be mounted.

> think that this is the last option if I have another
> Have another options before my HD is totally crash and all information
> is missing?

Well, if you want to be on safe side, you can create metadata snapshot
(debugreiserfs -p /dev/device | gzip -9c >metadata.gz) and make it available for
us to download. and we can verify that reiserfsprogs will work as expected.
Make sure you use reiserfsprogs 3.6.3 version for that operation.
Or you can download reiserfsprogs 3.6.3 and run reiserfsck --rebuild-tree
from there and only contact us if it will crash. (with metaadta, too).

Also after your problems are over you will need to upgrade the kernel to avoid
future corruptions.

Bye,
    Oleg
