From: Spam <spam@tnonline.net>
Subject: Repacker output
Date: Wed, 22 Sep 2004 02:25:27 +0200
Message-ID: <1943875361.20040922022527@tnonline.net>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21869-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


  I have a suggestion about the repacker output. Currently the
  repacker shows something like this:

Repacker: I am alive, pid = 7716
reiser4 repacker: 4395 formatted node(s) processed, 16858 unformatted node(s) processed, ret = 0

  What I'd like to see is that both lines contained which device that
  was processed. The second line should contain the pid too. This
  would make it easier to read and follow what is happening and where.

  ~S

