From: "Vitezslav T. Se'm" <travis@inway.cz>
Subject: Strange message in log
Date: Tue, 19 Nov 2002 15:17:41 +0100
Message-ID: <3DDA4805.5080700@inway.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi.

        Last Friday I installed my new workstation (RH7.3/redhat kernel 
2.4.18-18.7.x) and everytime I use mkreiserfs -h r5 /dev/partition it 
writes a bit strange message into syslog.

*******
Nov 19 15:10:30 biker kernel: attempt to access beyond end of device
Nov 19 15:10:30 biker kernel: 16:41: rw=0, want=80413328, limit=80413326
*******

        Partition is formated, mounted, used - everything OK. Is there 
any problem with that syslog message?

Thanx

Vitezlav T. Se'm

