From: Brian Tinsley <btinsley@emageon.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Sun, 18 Aug 2002 16:08:28 -0500
Message-ID: <3D600CCC.9010007@emageon.com>
References: <200208152007.42370.degerrit@web.de>	<200208152253.40413.vitaly@namesys.com>	<200208152329.40707.degerrit@web.de>	<200208161205.00550.vitaly@namesys.com> <3D5CBF08.4010308@web.de>	<m3ptwjw00q.fsf@merlin.emma.line.org> <3D5CFA0B.3030107@web.de> <m3wuqqq4dg.fsf@merlin.emma.line.org> <3D5D0B24.2030806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Although it could take quite some time to do this with large RAID 
devices like we use, I believe this option definitely has some value. I 
would make this part of our standard build process if it were available.


Hans Reiser wrote:

> A colleague of mine back when I was part of a sysadmin department used 
> to write to every block on the drive before installing the OS on it.  
> I think he was right to do so.  I have considered having mkreiserfs 
> ask the user if he wants to do that.
>

-- 
Brian Tinsley
Chief Systems Engineer
Emageon
http://www.emageon.com/



