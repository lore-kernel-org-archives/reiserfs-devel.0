From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] reiserfs: Fix locking in reiserfs_quota_on()
Date: Thu, 28 Oct 2010 01:47:06 +0100
Message-ID: <20101028004706.GK19804@ZenIV.linux.org.uk>
References: <1288225703-8170-1-git-send-email-jack@suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1288225703-8170-1-git-send-email-jack@suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Frederic Weisbecker <fweisbec@gmail.com>

	BTW, why does reiserfs flips MS_ACTIVE on for a while during
mount around the quota work?
