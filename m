From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck question - session results
Date: Mon, 29 Jul 2002 15:25:56 +0400
Message-ID: <20020729152556.A1131@namesys.com>
References: <20020729100033.A13890@namesys.com> <IMELKMOINBOOFMGACNMDOEFHCLAA.dbergstein@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <IMELKMOINBOOFMGACNMDOEFHCLAA.dbergstein@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David R. Bergstein" <dbergstein@comcast.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Jul 29, 2002 at 07:20:45AM -0400, David R. Bergstein wrote:

> Thanks very much for this information.  I sounds like what I did overall
> suppressed several harnless messages, i.e., by mounting the root reiserfs
> read-write, and skipping fsck in the initscripts.  From what you are saying,
> journal replay can also work safely when even a reiserfs fs is mounted
> read-only.  Is the warning message about journal replay on read-only
> filesystems outdated and if so, will it be removed sometime in the near
> future?

Yes, the warning will be removed. Actually it is just informational message,
just badly phrased.

Bye,
    Oleg
