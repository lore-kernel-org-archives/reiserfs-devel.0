From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: data logging and quota updated for 2.4.23
Date: Thu, 4 Dec 2003 17:51:31 +0100
Message-ID: <20031204165131.GB24470@mfa.kfki.hu>
References: <1070553889.27611.147.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16229-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1070553889.27611.147.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Hi,

 > 
 > ftp.suse.com/pub/people/mason/patches/data-logging/2.4.23
 > 
 > Will have a new version of the data logging and quota code as soon as
 > the suse mirror system copies it over.
 > 

lftp ftp.suse.com:/pub/people/mason/patches/data-logging/2.4.23> ls
-rw-r--r--    1 suse     susewww       996 Dec 04 15:46 01-reiserfs-free-blocks.diff.gz
-rw-r--r--    1 suse     susewww      1010 Dec 04 15:46 02-akpm-b_journal_head-1.diff.gz
-rw-------    1 suse     susewww      5137 Dec 04 15:46 03-reiserfs-sync_fs-5.diff.gz
-rw-------    1 suse     susewww     39797 Dec 04 15:46 04-data-logging-40.diff.gz
-rw-------    1 suse     susewww     11680 Dec 04 15:46 05-reiserfs-quota-28.diff.gz
-rw-------    1 suse     susewww      1608 Dec 04 15:46 06-kinoded-9.diff.gz
-rw-r--r--    1 suse     susewww       396 Dec 04 15:49 06-write_times.diff.gz
-rw-r--r--    1 suse     susewww       792 Dec 04 15:50 README

Cannot access 03,04,05,06 ...

Thanks,
Gergely
