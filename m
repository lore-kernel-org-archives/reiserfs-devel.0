From: "D.A.M. Revok" <marvin@synapse.net>
Subject: bug report: attributes ( chattr +a ) not respected by reiserfs 3,6, but this isn't listed in man mkreiserfs
Date: Sat, 12 Jul 2003 10:10:07 -0400
Message-ID: <200307121010.07215.marvin@synapse.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: info@suse.com, reiserfs-list@namesys.com

Please declare this in man .*reiser.*
( and also in the --help listings for 'em ), since it is kind of 
important to know *when* one is setting-up a filesystem
( rather than after the system's been built... )
so that no others will try setting 
chattr +a logfile
to make it append-only, as part of system-security, because the attribute 
set is non-meaningful.  ext3 respects this attribute.
This on SuSE 8.1 Pro and 8.2 Pro's kernel, maybe the stock kernel has it 
working, but I figure it'd be better to tell you people and let youse 
sort-it-out.

Thanks for a delightfully fast filesystem, though, eh?

   : )

-- 
http://www.drawright.com/
 - "The New Drawing on the Right Side of the Brain" ( Betty Edwards, 
check "Theory", "Gallery", and "Exercises" )
http://www.ldonline.org/ld_indepth/iep/seven_habits.html
 - "The 7 Habits of Highly Effective People" ( this site is same 
principles as Covey's book )
http://www.eiconsortium.org/research/ei_theory_performance.htm
 - "Working With Emotional Intelligence" ( Goleman: this link is 
/revised/ theory, "Working. . . " is practical )
http://www.leadershipnow.com/leadershop/1978-5.html
 - Corps Business: The 30 /Management Principles/ of the U.S. Marines ( 
David Freedman )
