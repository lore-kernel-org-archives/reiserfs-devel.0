From: Oleg Drokin <green@namesys.com>
Subject: Re: bad blocks
Date: Mon, 17 Jun 2002 19:23:41 +0400
Message-ID: <20020617192341.A31733@namesys.com>
References: <20020617171628.C74247-100000@doriath.saers.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020617171628.C74247-100000@doriath.saers.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Saers <alex@saers.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 17, 2002 at 05:19:18PM +0200, Alexander Saers wrote:

> But this only makes the sectors busy and the next reiserfsck will then
> detect this and remove the bussy mark. Isnt there a way to create files on
> the bad sectors so that nobody uses them. Not even in the future after a
> reiserfsck. Like if i have a folder on the drive that says
> /badblocks/sector8004
> /badblocks/sector8010
> etc etc
> Thanx fo a good filesystem

New reiserfsck have support for lists of bad blocks, but this was not
strongly tested and therefore disabled by default.
But some work is done in this direction

Bye,
    Oleg
