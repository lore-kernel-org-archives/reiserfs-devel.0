From: Sander <sander@humilis.net>
Subject: Re: immutability
Date: Sat, 5 Jun 2004 16:31:16 +0200
Message-ID: <20040605143116.GA7142@favonius>
References: <20040529152153.GA20663%alexy.khrabrov@setup.org> <20040530201616.5ba654ba.turtle.power@wanadoo.es>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040530201616.5ba654ba.turtle.power@wanadoo.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miguel <turtle.power@wanadoo.es>
Cc: Alexy Khrabrov <list+reiserfs@setup.org>, ReiserFS List <reiserfs-list@namesys.com>

Miguel wrote (ao):
> Yes but backup is a bit annoyning when you need to recover just a few
> files, I'm using a procedure on my machines to restore recently
> deleted files (24h).

How can backups be annoying if you need to recover (just a few) files?

Btw, I would not consider the immutable bit a safetybit for important
files. It wont protect you against hardware failure for example.
