From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree bug (loops forever)
Date: Fri, 21 Mar 2003 12:40:34 +0300
Message-ID: <20030321124034.A23203@namesys.com>
References: <1048239084.9237.9.camel@dawn.clansoft.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1048239084.9237.9.camel@dawn.clansoft.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Baldur Norddahl <bbn@clansoft.dk>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Mar 21, 2003 at 10:31:24AM +0100, Baldur Norddahl wrote:
> ####### Pass 2 #######
> do_pass_2: The block (18767039) is in the tree already. Should not
> happen.
> do_pass_2: The block (18767039) is in the tree already. Should not
> happen.
> do_pass_2: The block (18767039) is in the tree already. Should not
> happen.
> It loops forever at this point, using up 100% cpu time.

Hm, all previous reports of this problem boiled down to a situation where people
build their reiserfsprogs on one box, but used it on another.
Perhaps try to build reiserfsck statically? (and use 3.6.5 of course).

Bye,
    Oleg
