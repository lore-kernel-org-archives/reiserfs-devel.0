From: root@macp.eti.br (root)
Subject: Re: undelete open file
Date: Wed, 10 Mar 2004 11:30:08 -0300 (BRT)
Message-ID: <20040310143008.41DA1187569@macp.eti.br>
Return-path: <reiserfs-list-return-17163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reichelt@gbf.de, reiserfs-list@namesys.com

I believe you can copy the file by performing a cp /proc/<pid>/fd/<fd> <newfile>
