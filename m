From: Ookhoi <ookhoi@humilis.net>
Subject: Re: rfs4, 2.5.53: jnode_flush failed with err = -12
Date: Mon, 6 Jan 2003 15:52:43 +0100
Message-ID: <20030106155242.C19841@humilis>
References: <20030106122217.A19841@humilis> <20030106143058.A9262@namesys.com> <20030106125500.B19841@humilis> <20030106150310.A10661@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030106150310.A10661@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, reiserfs-list@namesys.com

Oleg Drokin wrote (ao):
> On Mon, Jan 06, 2003 at 12:55:01PM +0100, Ookhoi wrote:
> > I don't have swap space. Could that be a problem?
> 
> Not likely. We were able (in fact we do that quite often) to untar
> compiled kernel source that is bigger than your tar file both
> compressed and uncompressed on 240M system. I guess we need to release
> another snapshot with current code and see if it will break for you
> again.
> I am now merging our kernel bits to see how 2.5.54 will live with
> reiser4.

Would love to try. I pulled reiser4 and 2.5 from bk (and plain 2.5.54).
It gives me this error:

ookhoi $ make > /dev/null
fs/reiser4/flush.c:772: macro `write_syscall_trace' used with just one arg
fs/reiser4/flush.c:1087: macro `write_syscall_trace' used with just one arg
make[2]: *** [fs/reiser4/flush.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

Unfortunately source code is almost like Russian (or Chinese) to me, so
I guess I'll just wait for a new snapshot :-)
