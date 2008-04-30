From: Jan Kara <jack@suse.cz>
Subject: Calling finish_unfinished() too often?
Date: Wed, 30 Apr 2008 13:23:29 +0200
Message-ID: <20080430112329.GE19688@duck.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

  Hi,

  I was just looking into reiserfs remount code and it seems it calls
finish_unfinished() whenever filesystem is remounted and isn't in read-only
mode. Isn't this unnecessary? I thought finish_unfinished() is needed only
when we remount from read-only to read-write state for the first time...
  Well, I wouldn't mind the performance impact to remount that much but it
would make my life with journaled quota a bit easier ;). Thanks for an
answer in advance.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
