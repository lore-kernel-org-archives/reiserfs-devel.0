From: Mark F <mfaine@knology.net>
Subject: create very large file system
Date: Wed, 19 Jul 2006 07:10:56 -0500
Message-ID: <e9l7bh$134$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Ext3-users@redhat.com

Suse Linux Enterprise Server 9 SP3

I've tried to create a large 5TB file system using both reiserfs and ext3 and both have failed.

I end up with only a 1.5TB file system.  Does anyone know why this doesn't work, what to do to fix it?

Others have suggested that  only XFS or JFS will work.  Is this so?

Thanks,
-Mark

