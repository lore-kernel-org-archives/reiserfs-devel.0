From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: vs-7000: search_by_entry_key: search_by_key returned item position == 0<4>zam-7001: io error in reiserfs_find_entry
Date: Mon, 6 Oct 2003 13:22:37 +0400
Message-ID: <20031006092237.GJ1382@backtop.namesys.com>
References: <hh8ynzktc2.fsf@blah.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15798-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <hh8ynzktc2.fsf@blah.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Oct 06, 2003 at 04:12:13AM +0200, Maciej Matysiak wrote:
> 
> i've just started to see such messages in my logs. are they symptoms of fs
> corruption due to software error (ie. bug in reiserfs) or hardware failure?

Those messages mean fs corruption (directory entry has format which was not
expected), the reason could be hardware failure or rare software bug (because,
as i remember, only you hit it last year).

> what should i do now? my first thought was: reboot in single mode and run
> reiserfsck, 

yes

> but after a while i'm not so sure. hints?

run fsck.reiserfs and follow instructions which it prints, 
backup partition before --rebuild-tree.

"fsck.reiserfs --fix-fixable" should repaire damaged dir entries, but i am not
sure.

-- 
Alex.

