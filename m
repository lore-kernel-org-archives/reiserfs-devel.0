From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Which journal relocation+datalogging patches?
Date: Thu, 14 Nov 2002 14:30:46 +1100
Message-ID: <20021114033046.9A82D496DAB@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Chris Mason <mason@suse.com>

I'm trying to build a 2.4.20pre1 kernel with data logging patches,
journal relocation, and and important performance/reliability patches.

I see from
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20/README
that these patches are against the journal relocation patches. But where
are they? I've found a patch against 2.5.3, but that doesn't apply
cleanly to 2.4.20pre1.

If this patch doesn't yet exist against 2.4.20, could you please upload
it someplace Chris, and let me know what order to apply the patches?
(Since you obviously have made it, to create the data logging patch
against it! :-)

I looks to me like all other important patches are already in
2.4.20pre1--is that right?

What are the steps then required to move the journal to an external
device (we're using Umem NVRAM, FWIW)? How stable are the journal
relocation patches? If they're not recommended for production as yet,
would we be able to move the journal to an external device later, without
rebooting (or at least without recreating the filesystem)?

I'm really looking forward to trying this out--I plan to set aside an
identical server for testing and benchmarking, so hopefully we'll be able
to provide some interesting benchmarks of IMAP server performance with
external journals.

TIA,
  Jeremy
  http://fastmail.fm
