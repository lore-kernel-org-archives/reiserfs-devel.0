From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: "df -i" support
Date: Thu, 13 May 2004 09:54:29 +0000
Message-ID: <40A345D5.7000705@futuretg.com>
References: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040513093432.52d3d7a3.turtle.power@wanadoo.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miguel <turtle.power@wanadoo.es>
Cc: reiserfs-list@namesys.com

Miguel wrote:

Dear Genius,

    Please adopt:

          df -hi

Thanks,
Giovanni

>Hi
>We have several machines running as MTA's using reiser for the mail
>queue, we usually check the number of files (well an approximation)
>using the output of "df -i" command on our monitorization plugins this
>may be not very acurate but is very fast and didn't affect the MTA's
>work.
>
>With reiser the output of df -i is no longer usable, we changed this to
>"find | wc -l" variations but it hurts the performance.
>
>There's a command to count the number of leafs (that's the name?) of a
>tree from a reiser partition? or other orientative value?.(we mount
>with notail)
>
>Tnx
>
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

