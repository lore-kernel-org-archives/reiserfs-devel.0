From: "Alec H. Peterson" <ahp@hilander.com>
Subject: Reiser4 unlink performance
Date: Wed, 22 Feb 2006 07:33:22 -0700
Message-ID: <EE7B7176-15E7-43E9-937B-B084879E62A9@hilander.com>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: reiserfs-list@namesys.com

Hi all,

I have a scenario where large numbers of unlinks spread across 256  
directories with 20,000 files in each directory results in these  
kernel messages:

Feb 22 09:00:19 ecbuild-10 kernel: <4>reiser4[umount(13646)]:  
commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
Feb 22 09:00:19 ecbuild-10 kernel: WARNING: Flushing like mad: 16384

When this happens the filesystem blocks for a rather long period of  
time.

Interestingly, when I reduce the number of directories to 120 and  
increase the number of files in each directory to 40,000 the  
performance improves remarkably, although I do still get some of  
those kernel messages, albeit fewer of them.

I am curious if there are tunable parameters (either compile-time or  
mount-time) that I can modify to help alleviate this problem, or if  
there are any other suggestions.

Thanks!

Alec

