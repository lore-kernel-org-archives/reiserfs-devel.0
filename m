From: Job Bob <yzhang2004@yahoo.com>
Subject: Reiser4 and ZFS
Date: Tue, 14 Dec 2004 22:46:08 -0800 (PST)
Message-ID: <20041215064608.66493.qmail@web50901.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

     Hello all. I just read
http://www.sun.com/2004-0914/feature/ about
ZFS, Sun's new file system for Solaris 10 and want to
know how does it compare to reiser4 as well as future
versions of reiserfs.

  Anything said by Sun or Microsoft has to be taken
with a bag of salt, so when they say breakthrough, do
they really mean it is that advanced? From
my understanding, ZFS just improves on the file system
internals such as the maximum limits and easing
administration. I think this is pretty much similar to
SGI's XFS which was mostly for in house use. It's very
robust and scalable (to a limited degree). Reiser fs
on the other hand (correct me if I'm wrong) is about a
creating a much more general file system (name space)
with limitless extendibility/scalability (not just for
size/performance).

  So if ZFS is not the vaporware that WinFS is, what
new features of ZFS are worth incorporating into
Reiser fs? Will Reiser fs continue to stay ahead of
ZFS?

                                      Yale


	
		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - You care about security. So do we. 
http://promotions.yahoo.com/new_mail
