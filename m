From: Jan Kara <jack@suse.cz>
Subject: Does Reiser3 really support data=journal mode?
Date: Tue, 22 Apr 2008 16:17:56 +0200
Message-ID: <20080422141756.GC22899@duck.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

  Hello,

  I've just looked into the Reiserfs code in 2.6.25 kernel and from the code
it seems as data=journal mode isn't really handled any specially from
data=writeback mode. So does Reiserfs really support journaling of data?
If no, then we should remove the mount option. If yes, then I really wonder
where is the distinction from data=writeback mode... Thanks for an answer in
advance.

									Honza

PS: I'm looking into this because I'm fixing some problems with quota when
journaling data so I'd like to fix Reiserfs as well in case it's affected.

--
Jan Kara <jack@suse.cz>
SUSE Labs, CR
