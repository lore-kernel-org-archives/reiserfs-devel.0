From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: reiserfsck not fixing vs-5150/vs-13070
Date: Fri, 30 Aug 2002 11:57:23 +0200
Message-ID: <20020830095723.GB8772@merlin.emma.line.org>
References: <20020828203754.GA11894@merlin.emma.line.org> <200208291257.06942.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11349-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200208291257.06942.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list <reiserfs-list@namesys.com>

On Thu, 29 Aug 2002, Vitaly Fertman wrote:

> Could you try reiserfsck --fix-fixable from reiserfsprogs-3.6.4-pre1, these  
> fixable corruptions seem to be fixed there, and then reiserfsck --check.

I did this.

I don't recall if I got the dirty buffer thingy (I was sort of busy,
with ISDN PBX breakdown to fix and other stuff), but the on-disk problem
is gone after --fix-fixable of 3.6.4-pre1, and reiserfsck --check does
not report any corruptions and more, and the files there were denied
with EIO before the fsck are now accessible again. Thanks to your team
for 3.6.4-pre1.


The related message from --fix-fixable:

bad_item: vpf-10580: block 33160: Flags in the item header (1) were cleaned
bad_item: vpf-10580: block 33160: Flags in the item header (4) were cleaned
bad_item: vpf-10580: block 33160: Flags in the item header (7) were cleaned
(there were 6 more of these)

and tons (~ 450) of vpf-10680: The file [X Y] has the wrong block
count in the StatData (2) - corrected to (1)

Any clues how these flags got there? The FS was in 3.5 mode and had
those problems in 3.5 mode already, before I converted to 3.6.

Thank you!

Best regards,
Matthias
