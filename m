From: Oleg Drokin <green@namesys.com>
Subject: Re: Bug in reiserfsck 3.6.1-pre1
Date: Mon, 16 Sep 2002 09:19:43 +0400
Message-ID: <20020916091943.A5459@namesys.com>
References: <20020916025655.E22362@noris.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020916025655.E22362@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: smurf@noris.de
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 16, 2002 at 02:56:55AM +0200, reiserfs-list-return-11456-green=namesys.com@namesys.com wrote:

> delete_N_items_after_key: No directory item of [32340 32341] are expected
> Aborted
> I needed the rebuid because I had a multiple RAID disk death.

We are interested in metadata from that volume if possible.
Please run debugreiserfs -p /dev/md0 | gzip -9c >/somewhere/metadata_md0.gz

Then make this file available for us to download.

Thank you.

Bye,
    Oleg
