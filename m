From: Oleg Drokin <green@namesys.com>
Subject: Re: rfs4, 2.5.53: jnode_flush failed with err = -12
Date: Mon, 6 Jan 2003 14:30:58 +0300
Message-ID: <20030106143058.A9262@namesys.com>
References: <20030106122217.A19841@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030106122217.A19841@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jan 06, 2003 at 12:22:17PM +0100, Ookhoi wrote:

> With kernel 2.5.53 and reiserfs4 snapshot of 24 Dec 2002 I get the
> following error when I try to untar a file on it.
> jnode_flush failed with err = -12

Errno 12 means "Out of Memory".
How much RAM do you have on your test box?
Currently reiser4 is somewhat memory-hungry and the logic that deals
with sort-memory situations is not implemented nicely yet.

Thank you for trying out reiser4 (and for reporting problems of course).

Bye,
    Oleg
