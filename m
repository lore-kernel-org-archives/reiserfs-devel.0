From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: resier4 performance with dbt-2
Date: Fri, 13 Feb 2004 20:55:35 +0300
Message-ID: <16429.3991.17822.750211@laputa.namesys.com>
References: <200402131731.i1DHVaE22114@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402131731.i1DHVaE22114@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: markw@osdl.org
Cc: reiserfs-list@namesys.com

markw@osdl.org writes:
 > http://developer.osdl.org/markw/fs/dbt2_stp_results.html
 > 
 > I have some data (at the link above) with the reiser4 2004.02.06
 > snapshot applied to linux-2.6.2 with our DBT-2 (OLTP) workload on 4-way
 > and 8-way systems.  On the 4-way systems, the results of the workload
 > seem comparable to other filesystems.  On the 8-way systems, the results
 > of the workload drop about 28%.
 > 
 > I have readprofile and oprofile (w/ annotated assembly) data with the
 > results.  If there's anything else I can provide let me know.

That's very impressive. Thank you for data.

Do I understand correctly that you have applied the same reiser4 patch
(from 2004.02.06 snapshot) to the 2.6.2, 2.6.1-mm2, 2.6.1, and
2.6.0-mm2?

Also note strange results for ext2 on 4-way 2.6.1-mm2: it's like order
of magnitude slower than other contestants. Are test results averaged
over multiple runs?

 > 
 > -- 
 > Mark Wong - - markw@osdl.org

Nikita.
