From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: Reiser4 needs more testers
Date: Fri, 26 Mar 2004 20:32:21 +0100
Message-ID: <40648545.2040004@futuretg.com>
References: <16484.24086.167505.94478@laputa.namesys.com> <406462C1.5020507@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406462C1.5020507@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>

Hans Reiser wrote:

Hi Hans,

    We will test the last snapshot.

Thanks,
Giovanni

> We have one NFS related bug remaining, and one mmap all of memory 
> related bug (and performance issue) that you can hit using iozone.  We 
> will fix both of these in next week's snapshot, they were both 
> multi-day bug fixes.  When they are fixed, unless users/distros find 
> bugs next week we will submit it for inclusion in the -mm and then the 
> official kernel.
>
> We hope it is now fairly stable for average users if you avoid those 
> two issues (we need to get rid of those dire warnings about its 
> stability...., we will remember that next snapshot....;-) )
>
> We need a lot more real user testers, because we have run out of 
> scripts that can crash it, and there are distros that would like to 
> ship it soon.  Please also complain to vitaly@namesys.com and 
> ramon@namesys.com about poor documentation, etc., ....
>
> The new reiser4 snapshot (against 2.6.5-rc2) is available at
>
> http://www.namesys.com/snapshots/2004.03.26/
>
>


-- 

-- 

--
Check FT Websites ... 
http://www.futuretg.com  - ftp://ftp.futuretg.com
http://www.FTLinuxCourse.com
                            /Certification
http://www.rpmparadaise.org
http://GNULinuxUtilities.com
http://www.YourPersonalOperatingSystem.com


--

       Europe:                          USA:
	Future Technologies             Future Technologies
	Viale Grigoletti, 20            1158 26th Street #592
	33170 - Pordenone (PN)          Santa Monica, CA 90403
	Italy.                          USA.



