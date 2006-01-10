From: Louis-David Mitterrand <vindex+lists-reiserfs-list@apartia.org>
Subject: reiser4 warning?
Date: Tue, 10 Jan 2006 22:18:02 +0100
Message-ID: <20060110211802.GA16793@apartia.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

When rebooting a server I catched this in the logs:

	Jan 10 18:13:55 zenon kernel: <4>reiser4[apache-perl(6359)]: disable_write_barrier (fs/reiser4/wander.c:233)[zam-1055]:
	Jan 10 18:13:55 zenon kernel: WARNING: disabling write barrier

Is it bad?

(using 2.6.14 patch)
