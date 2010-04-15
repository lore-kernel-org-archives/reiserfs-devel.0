From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [PATCH] reiserfs: Fix corruption during shrinking of xattrs
Date: Thu, 15 Apr 2010 16:49:15 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1004151632110.4069@bogon.housecafe.de>
References: <4BC4C888.9040104@suse.com> <alpine.DEB.2.01.1004140127090.29272@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1004140127090.29272@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>, stable@kernel.org, kernel@jbeekman.nl, gregsurbey@hotmail.com, Marco Gatti <marco.gatti@gmail.com>

On Wed, 14 Apr 2010 at 01:32, Christian Kujau wrote:
> On Tue, 13 Apr 2010 at 15:39, Jeff Mahoney wrote:
> >  This patch fixes it to use new_size.
> 
> Tested-by: Christian Kujau <lists@nerdbynature.de>

Dang. While this *does* seem to fix the "Input/output error after a large 
amount of files have their xattrs removed", it does not fix the initial 
issue in #14826, where occasionally this jdm-20002 message shows up.

I just tested this: I still have this calendarserver (caldavd) and it's 
heavily using xattr. I have removed everything under /var/spool/caldavd, 
started caldavd and am now importing a calendar. caldavd will now create 
files under /var/spool/caldavd, wil assign xattrs and read them. And just 
after a few operations, this happens again:

[138794.184926] REISERFS warning (device xvda3): jdm-20002 
reiserfs_xattr_get: Invalid hash for xattr 
(user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2Fprivate%2F}quota-used) 
associated with [765 3282 0x0 SD]

[139238.740552] REISERFS warning (device xvda3): jdm-20002 
reiserfs_xattr_get: Invalid hash for xattr (user.{DAV:}displayname) 
associated with [765 3402 0x0 SD]

Inodes 3282, 3402, aka

./calendars/__uids__/afebe2f1-f51a-5859-af15-f22312ad6634
./calendars/__uids__/afebe2f1-f51a-5859-af15-f22312ad6634/2CC21268-C87E-4AE6-AFD4-33946D5621AB

....under /var/spool/caldavd. So it does happen for new files 
(directories in this case) indeed.

However, there's no file corruption, no I/O errors - I can still access 
the directory and its contents. The xattr information might be lost 
though. Bug #14826 somehow transformed into "my filesystem is corrupt", as 
the bug with the large amount of files/xattr seems to generate the same 
message in the syslog. But that's a different issue, methinks.

Christian.

[0] https://bugzilla.kernel.org/show_bug.cgi?id=14826
-- 
BOFH excuse #124:


user to computer ration too low.
