From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Fri, 16 Aug 2002 18:24:36 +0400
Message-ID: <3D5D0B24.2030806@namesys.com>
References: <200208152007.42370.degerrit@web.de>	<200208152253.40413.vitaly@namesys.com>	<200208152329.40707.degerrit@web.de>	<200208161205.00550.vitaly@namesys.com> <3D5CBF08.4010308@web.de>	<m3ptwjw00q.fsf@merlin.emma.line.org> <3D5CFA0B.3030107@web.de> <m3wuqqq4dg.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

A colleague of mine back when I was part of a sysadmin department used 
to write to every block on the drive before installing the OS on it.  I 
think he was right to do so.  I have considered having mkreiserfs ask 
the user if he wants to do that.

-- 
Hans



