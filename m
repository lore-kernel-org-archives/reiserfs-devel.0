From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfs3 and -o sync revisited
Date: Mon, 18 Nov 2002 11:10:11 +0300
Message-ID: <20021118111011.C3827@namesys.com>
References: <m3ptt7m6qq.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <m3ptt7m6qq.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com, mason@suse.com

Hello!

On Fri, Nov 15, 2002 at 12:07:09PM +0100, Matthias Andree wrote:
> I have reiserfs v3.6 (as of 2.4.19) with the following patches:
> A-01-relocation-4.diff.gz
> A-02-commit_super-9-relocation.diff.gz
> A-03-data-logging-25.diff.gz
> A-03-logging-export.diff.gz
> A-04-write_times.diff.gz
> A-05-search_reada-4.diff.gz

> The A and B patches are Chris Mason's and the official Namesys patches,
> possibly gzipped, the rest does not touch ReiserFS code except possibly
> rmap.
> I have run some bonnie++ 1.02c tests on an old swap partition I
> converted to reiserfs, ext3fs or ext2fs, and I gather that using the
> mount -o sync option makes virtually no difference on reiserfs, but
> brings ext3 and ext2 nearly to a halt. Is mount -o sync implemented and
> working?

-o sync is implemented by VFS.
I remember that some early implementation of data logging patches have broken
sync behaviour and reiserfs got huge boost in some tests ;) )
I do not know which version of the patches you aer using, though.

Chris, do your latest patches fix that sync problem?

Bye,
    Oleg
