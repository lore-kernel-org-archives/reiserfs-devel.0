From: Oliver Korpilla <okorpil@fh-landshut.de>
Subject: Re: Reiser4 and NFS
Date: Tue, 07 Sep 2004 10:05:48 +0200
Message-ID: <413D6BDC.80006@fh-landshut.de>
References: <413C5DBA.1070207@fh-landshut.de> <1094543842.1340.61.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094543842.1340.61.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hello Vladimir,

I guess not.

Both my clients are embedded systems, and both didn't work.

Client/Target one is a Motorola MVME2100 board with an MPC8240 PowerPC CPU @ 200
MHz.

Client/Target two is a Motorola MVME5500 board with an MPC7455 PowerPC CPU @ 1GHz.

Both failed to mount their root filesystem via NFS from a Reiser4 on the
server/host, but worked fine with an ext3 over NFS.

Either this is a NFSv3/Reiser4/2.6.8.1 server vs. NFSv3/2.4.21 client problem,
or it has something to do with endianness (PowerPC is big-endian, Intel P4 box
is little-endian). I know ext* has absolutely no issues with endianness, neither
as RAM disk nor over NFS, but perhaps Reiser4 has?

Do both your client and your server have kernel 2.6.x? Are both Reiser4 patched?

Maybe Linux 2.6.x has new LOOKUP operation semantics in order to support Reiser4
that Linux 2.4.2x hasn't?

On a side note:

It would be nice if we could reproduce the error, since I like Reiser4. I did a
large egrep over the whole /usr subtree, and didn't hear a sound from my hard
drive because accesses seemed to be well-ordered (no superfluous head
movements). I first thought the operation failed. ;)

With kind regards,
Oliver Korpilla

Vladimir Saveliev wrote:
> I have no problems with exporting reiser4 via NFS. Could it be that you
> have problem because your client is embedded?

