From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel loop with lseek + LFS on reiser partition.
Date: Mon, 22 Apr 2002 16:10:07 +0400
Message-ID: <20020422161007.A885@namesys.com>
References: <OF6E1F14ED.2ACEFBDE-ONC1256BA3.003EF743@ev-i.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF6E1F14ED.2ACEFBDE-ONC1256BA3.003EF743@ev-i.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolfgang.glas@ev-i.at
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 22, 2002 at 01:30:58PM +0200, wolfgang.glas@ev-i.at wrote:

> OK, The program terminates.

Good.

> Seems to scale linear with CPU power......

As expected. I am experimenting in 2 directions currently:
One is to speed up the lenghtly operation itself ( got cpu time spent down
to 8 seconds already, but some problems still persists).
Another one is to simply allow for this process to be terminated.

Bye,
    Oleg
