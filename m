From: markw@osdl.org
Subject: resier4 performance with dbt-2
Date: Fri, 13 Feb 2004 09:31:10 -0800 (PST)
Message-ID: <200402131731.i1DHVaE22114@mail.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

http://developer.osdl.org/markw/fs/dbt2_stp_results.html

I have some data (at the link above) with the reiser4 2004.02.06
snapshot applied to linux-2.6.2 with our DBT-2 (OLTP) workload on 4-way
and 8-way systems.  On the 4-way systems, the results of the workload
seem comparable to other filesystems.  On the 8-way systems, the results
of the workload drop about 28%.

I have readprofile and oprofile (w/ annotated assembly) data with the
results.  If there's anything else I can provide let me know.

-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
