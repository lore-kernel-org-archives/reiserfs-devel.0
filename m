From: David Masover <ninja@slaphack.com>
Subject: Re: where are reiser4 sources
Date: Mon, 21 Feb 2005 20:08:27 -0600
Message-ID: <421A941B.5030708@slaphack.com>
References: <421A096F.5040603@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421A096F.5040603@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mark Junker <mjscod@gmx.de>
Cc: reiserfs-list@namesys.com

Mark Junker wrote:
> Hi,
> 
> where are the Reiser4 sources? I just want to use Reiser4 in a separate 
> application and don't like the idea of extracting the sources from the 
> linux 2.6 patch.

Out of curiosity, why?

$ cd linux-2.6
$ patch [...]
$ cp -a fs/reiser4 ..
$ cd ..
$ rm -rf linux-2.6

Or, I think there may be instructions somewhere for how to get that tree
from BitKeeper.

AFAIK, you will still have to adapt it a good deal.  There has been some
(minimal) discussion of porting, but it doesn't seem easy.

