From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Snapshot against 2.6.1 released.
Date: Mon, 19 Jan 2004 08:28:27 -0800
Sender: Mike Fedyk <mfedyk@srv-lnx2600.matchmail.com>
Message-ID: <20040119162827.GQ1748@srv-lnx2600.matchmail.com>
References: <16395.60465.989777.981597@laputa.namesys.com> <16396.1113.203997.785571@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16396.1113.203997.785571@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Mon, Jan 19, 2004 at 07:22:49PM +0300, Nikita Danilov wrote:
> last-minute-fix.diff should be applied from fs/reiser4:

Took a look at the patch, and noticed you guys are using assert().

I'm sure you're going to have to rename that before it will be integrated
upstream, so you might as well start before then...

Mike
