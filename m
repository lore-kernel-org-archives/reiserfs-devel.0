From: Tom Lanyon <tomlanyon@gmail.com>
Subject: Apache2 problems
Date: Tue, 10 Aug 2004 02:55:55 +0930
Message-ID: <cd32a06204080910256de4cc0e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

Can someone please inform me of how to stop the dreaded sendfile
issues while using reiser4 and apache2?

I just setup reiser4 on a nice new hard drive and tried to run apache2
and ended up with many kernel panics and then the machine locked up.

I thought this issue was fixed in reiser4? If not, how can I go about
stopping this from happening?

This is reiser4-2004.07.23-19.37-linux-2.6.8-rc2-bk4.diff  on a
2.6.8-rc2 kernel.
I'm about to try the latest snapshot on a vanilla 2.6.8-rc3 and see if
it helps..


Thanks for any help,

Tom.
