From: Steven Cole <elenstev@mesatop.com>
Subject: Re: Results of "bk clone" tests with 2.6.2,  reiser4, reiserfs, ext3, xfs and jfs
Date: Wed, 11 Feb 2004 02:32:54 -0700
Message-ID: <200402110232.54727.elenstev@mesatop.com>
References: <1076456354.1585.36.camel@spc.esa.lanl.gov> <402A5468.3000609@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402A5468.3000609@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, nikita@namesys.com

On Wednesday 11 February 2004 09:12 am, Hans Reiser wrote:
> Steven Cole wrote:
> >I used the "-o key=key_short" option when creating the
> >reiser4 file system due to getting this message:
> >"kernel: WARNING: Key format mismatch. Only small keys are supported."
>
> This might have hurt our performance substantially.  Did you
> intentionally choose small keys?  If not, Nikita, why did this happen?

Well, intentionally _only_ because it seemed the reasonable thing to do
in the face of the above warning message.  Tomorrow, I can recompile
the reiser4-enabled kernel with the large keys option and mkfs.reiser4
again without that key_short option.  I'll let you know if there are any interesting
results.

Steven
