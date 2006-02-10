From: Unknown <unknown@unknown.invalid>
Subject: reiser4 bug in 2.6.16-rc2-mm1
Date: Fri, 10 Feb 2006 15:22:15 +0100
Message-ID: <20060210142215.GA1714@deprez-aerts.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28062-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
From: at dot <maartendeprez-at-scarlet-dot-be@change-please>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

reiser4 on linux 2.6.16-rc2-mm1 bugs for me in
plugins/file/tail_conversion.c line 29, locking up a process
sometimes, when it is reading a file.

Greetings,
Maarten Deprez

