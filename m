From: PFC <lists@peufeu.com>
Subject: Re: RAID-1 and Reiser4 issue: umount hangs
Date: Wed, 31 May 2006 12:41:18 +0200
Message-ID: <op.taevy4f3cigqcu@apollo13>
References: <447B56C1.80608@inn.nl> <200605301553.34815.zam@namesys.com> <447C9AFA.90400@inn.nl> <200605311113.48131.zam@namesys.com> <447D5CA9.3080707@inn.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <447D5CA9.3080707@inn.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


> If write-barrier support is a known problem, wouldn't it be better to
> disable it in the Reiser4 driver by default, as in the ext3-driver ?

	Hum ; it's essential for maintaining data integrity with IDE disks which  
have a write cache... because most of them lie about fsync() but have a  
working write barrier...
