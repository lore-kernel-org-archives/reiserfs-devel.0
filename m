From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruptions on every filesystem with 02-reiserfs_file_write.diff.gz
Date: Wed, 21 Aug 2002 10:13:43 +0400
Message-ID: <20020821101343.B10765@namesys.com>
References: <20020820151701.GA15499@jerry.boludo.cjb.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11262-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020820151701.GA15499@jerry.boludo.cjb.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Marcet <jmarcet@pobox.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Aug 20, 2002 at 05:17:01PM +0200, Javier Marcet wrote:

> When applying the second of the patches available under
> reiserfs-for-2.4/2.4.19.pending/testing I get corruptions on any write
> comitted to ANY filesystem, including ram.

This is very strange, I cannot reproduce anything even remotely similar to this.
The only difference I see now is that I compile with gcc 2.95.3

> I cannot give more specifics than adding that patch, doing a simple test
> like creating a tar.bz2 out of a folder on my HD (be it SCSI or IDE),
> produces a corrupt archive; i.e. testing it with 'bzip2 -t' gives a CRC
> error on the archive.

Just tried copying several kernel trees, archiving kernel trees and stuff
and have not seen any corruption.

> This behaviour was the same with either 2.4.19-pre5-aa1 (aka 2.4.19-aa),
> 2.4.19 barebone, 2.4.20-pre2, 2.4.20-pre-ac2 ac3 and ac4.
> In each of them I had applied the corresponding patches of the main
> 2.4.19.pending dir which had not been previously merged on the kernel.

You said XFS, does that mean you had XFS patched in too in all cases?

> Let me reinforce the fact that without that I have no problems at all,
> and reiserfs is working better than ever :)

We do not create patches to corrupt user's data, we try to enhance what we have
now, instead.

BTW, have anyone else tried these (or other slightly different patches I
uploaded yesterday) patches and observed any data corruptions?

Thank you for feedback.

Bye,
    Oleg
