From: "E. Gryaznova" <grev@namesys.com>
Subject: Re: Too many links error
Date: Mon, 06 Sep 2004 18:49:04 +0400
Message-ID: <413C78E0.7070109@namesys.com>
References: <20040903192121.39231.qmail@web51308.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040903192121.39231.qmail@web51308.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "[Izomorfix {metal}]" <izohacker@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello.

Thank you for the report.
Is this easy reproducible for you? If yes -- would you please set 
CONFIG_REISER4_DEBUG and CONFIG_REISER4_DEBUG_OUTPUT  turned "on" and 
send us  the dmesg?

Thanks,
Lena.

[Izomorfix {metal}] wrote:

>Hello, I'm fairly new to the list.
>Here's my problem (from dmesg):
>
>reiser4[emerge(7829)]: create_child_common
>(fs/reiser4/plugin/dir/dir.c:534)[nikita-2219]:
>WARNING: Failed to initialize dir for 1304053: -31
>
>I get a lot of these whenever I try to emerge (gentoo)
>2 times:
>emerge vixie-cron. (works)
>emerge vixie-cron (spits this error)
>repeat.
>Could you tell me how to fix it (what to post.)
>
>Almost forgot: here's the output of emerge:Traceback
>(most recent call last):
>  File "/usr/bin/emerge", line 2605, in ?
>    unmerge("clean", ["world"])
>  File "/usr/bin/emerge", line 1852, in unmerge
>   
>retval=portage.unmerge(mysplit[0],mysplit[1],portage.root,mysettings,unmerge_action
>not in ["clean","prune"])
>  File "/usr/lib/portage/pym/portage.py", line 2494,
>in unmerge
>    mylink.unmerge(trimworld=mytrimworld,cleanup=1)
>  File "/usr/lib/portage/pym/portage.py", line 5261,
>in unmerge
>   
>a=doebuild(myebuildpath,"prerm",self.myroot,self.settings,cleanup=cleanup,use_cache=0)
>  File "/usr/lib/portage/pym/portage.py", line 2155,
>in doebuild
>    os.makedirs(mysettings["T"])
>  File "/usr/lib/python2.3/os.py", line 153, in
>makedirs
>    makedirs(head, mode)
>  File "/usr/lib/python2.3/os.py", line 154, in
>makedirs
>    mkdir(name, mode)
>OSError: [Errno 31] Too many links:
>'/var/tmp/portage/aterm-0.4.2-r8'
>
>Please bear with me, cause I'm a newbie (15 years and
>counting :) )
>
>
>		
>_______________________________
>Do you Yahoo!?
>Win 1 of 4,000 free domain names from Yahoo! Enter now.
>http://promotions.yahoo.com/goldrush
>
>
>  
>


