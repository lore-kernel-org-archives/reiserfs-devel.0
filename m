From: Jeffrey Mahoney <jeffm@suse.com>
Subject: [PATCH 00/05] reiserfs: enhanced error reporting
Date: Fri, 16 Jun 2006 00:16:50 -0400
Message-ID: <449230B2.3030406@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

One of the long-term shortcomings of reiserfs has been the lack of 
extended error handling. There are many conditions where the file system 
is obviously corrupted, yet writing is still allowed. This only serves 
to potentially introduce even more corruption. There are other cases
where reiserfs_panic() is called directly when there is really no need
to take down the system.

The following patches lay some of the groundwork to enhance the error 
handling capabilities of reiserfs:

* reiserfs-01-consistent-messages:
   Currently, the output format for infos/warnings/errors/panics varies
   depending on which one is used. This patch makes them more consistent
   internally and with other Linux file systems. The third patch in the
   series builds on this to make more consistent warnings/errors/etc.

* reiserfs-02-reiserfs_info.diff:
   In several places, reiserfs_warning() is used to inform the user of
   something that would be better qualified as a notice. This patch adds
   a reiserfs_info() routine for use in such cases.

* reiserfs-03-reiserfs-warning.diff:
   Hans has stated on multiple occasions that he wants unique identifiers
   associated with all warnings. These identifiers aren't always used.
   In some cases, function names are included. In other cases, not.
   Sometimes the device is included explicitly, in others, not. This
   patch adds identifiers where they're missing (or "" in the rare case
   where the message is routine enough to not warrant one), removes
   function names and device names when they're provided, since patch 1
   added them to every warning.

* reiserfs-04-add-reiserfs_error.diff:
   This adds a reiserfs_error() function akin to ext3_error() that takes
   the file system to a read only state when an error occurs where the
   file system is corrupted. In such cases, more damage would be done by
   allowing writes to continue.

* reiserfs-05-use-reiserfs_error.diff:
   This patch modifies some error paths to use reiserfs_error() instead
   of reiserfs_warning() or reiserfs_panic(). This is to be viewed as
   the first in a series of patches. I just chose the ones that seemed
   obvious as a first step.


I'm not putting these up for inclusion until I'm satisfied they're 
stable, but I'd like some feedback. I know there's been a lot of 
interest in enhancing the error handling capabilities, so hopefully
these will be welcome. :)


-Jeff

--
Jeff Mahoney
SUSE Labs
