From: Oleg Drokin <green@namesys.com>
Subject: Re: weird symlink problem persists...
Date: Tue, 17 Sep 2002 10:18:25 +0400
Message-ID: <20020917101825.B30035@namesys.com>
References: <Pine.LNX.4.44L1.0209162228450.13963-100000@sequence.stanford.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11488-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L1.0209162228450.13963-100000@sequence.stanford.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Troy Wu <troy@sequence.stanford.edu>
Cc: ReiserFS at NameSys <reiserfs-list@namesys.com>, NFS at SourceForge <NFS@lists.sourceforge.net>

Hello!

On Mon, Sep 16, 2002 at 11:07:51PM -0700, Troy Wu wrote:
> I'm using the nfs-utils-1.0.1 tools on a 2.4.10 kernel (relatively stock
> SuSE-7.3 kernel) with ReiserFS 3.6.25 (but using the 3.5.x disk format).

Linux kernel version 2.4.10 (even patched by SuSE) is way out of date and
should not be used.
There are updated kernels available from SuSE right now to which yo should
upgrade. Pick at least 2.4.16 from SuSE updates or 2.4.18 if you choose to
switch to vanilla kernels.

Also right after kernel switch check your reiserfs filesystems with updated
reiserfsprogs to make sure there is no corruptions left from old kernels.

Bye,
    Oleg
