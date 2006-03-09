From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH 00/11] reiserfs: xattr rework
Date: Thu, 09 Mar 2006 10:26:46 -0800
Message-ID: <44107366.5090407@namesys.com>
References: <20060301123406.GA20367@atrey.karlin.mff.cuni.cz> <44076975.70609@suse.com> <20060303002917.GD4261@atrey.karlin.mff.cuni.cz> <4407944F.5030206@suse.com> <20060303100407.GF2855@atrey.karlin.mff.cuni.cz> <4408C080.4070600@suse.com> <20060306115926.GL1175@atrey.karlin.mff.cuni.cz> <440DFD7A.9040000@suse.com> <20060308182014.GC14184@atrey.karlin.mff.cuni.cz> <440F2C81.3@suse.com> <20060308231426.GI14934@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060308231426.GI14934@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.cz>, ReiserFS List <reiserfs-list@namesys.com>, "E. Gryaznova" <grev@namesys.com>

All of this is why xattrs should not be implemented without first
implementing plugins.:-/

Really guys, there was a reason for my not wanting xattrs to go into
V3.  Do you see it now?  This is what happens when marketing determines
feature ship schedules.  You could implement this xattr stuff in V4 in
1/5th the time, 5 times the performance, and twice the elegance.   Of
course, implementing them as pseudo files would be far more elegant
still....

Hans
