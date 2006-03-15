From: Yoanis Gil Delgado <fred@uh.cu>
Subject: Permission denied while accessing pseudos
Date: Wed, 15 Mar 2006 14:53:10 -0500
Message-ID: <200603151453.10697.fred@uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi there. I've been playing around with pseudos and whenever i try to access a 
pseudo dir or file i get a Permission denied error. For example:
	$ ls hello.txt/..../rwx
	Permission denied
I also tried 
	$ ls hello.txt/..plugins/rwx
	 Permission denied
I also tried to list a missing plugin and i get the same error. For example
	$ ls hello.txt/..../pepito
	Permission denied

Thanks.........


