From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: OT: package scripts (was Re: software packaging and ReiserFS
 v4)
Date: Fri, 05 Sep 2003 16:37:12 -0500
Message-ID: <3F590208.5060900@mrs.umn.edu>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net> <3F58D2CD.3050801@mrs.umn.edu> <20030905194413.GA19041@matchmail.com> <20030905201806.GV31864@vestdata.no> <20030905203950.GA12183@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030905203950.GA12183@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I'm excited about your packaging system.  I hope you make something very 
useful.  Here are some ideas I have had about packaging and operating 
system design; they might be interesting to you.  Comments, suggestion, 
other ideas are wanted.

Ideally, each user's home dir would mirror the system directories (i.e. 
users have their own bin, share, lib and var).  This way, users can 
install a package (and it would be local to them) and root could install 
the exact same package (and it would be global to the system).  Right 
now, on every distribution, only root can install packages; this is a 
place where a new packaging system could have huge advantages.

Ideally, users' directories would get unioned to system's directories 
(in their namespace) upon login, so / would be their "home", /bin would 
be system's bin plus user's bin, etc.  This way programs ALWAYS know the 
"right path" to everything (which has always been an annoying problem in 
Unix).

Packages contain file sets only.  This avoids side-effects of scripts. 
Well-designed programs do not need pre- and post-install scripts.  If 
you want to install apache, say as www user, root would create that 
user, switch users to www, and then install apache as www.

/sbin would go away; all sbin programs go to appropriate bin directories 
(because non-root users often need programs like fdisk, etc).

/etc, /bin, /lib and /boot all have the files only necessary for bootup.
Users can have an rc.d script directory in /etc (who gets to have rc.d 
scripts would be up to the sys admin) for launching services upon 
runlevel changes.  Perhaps it would be better to put these dirs as 
/boot/bin, /boot/lib, etc, and use /bin for system-wide bin (i.e., like 
the present /usr/bin).

/share/etc-defaults would contain default configurations, instead of 
cluttering up /etc (which is just stuff needed for booting and launching 
services).  /share/etc-defaults could be mounted below user's /etc.

(optional) /share/etc-mandatory could be mounted above user's /etc, for 
settings users should not be able to change (sometimes called "lock-down").

Environment variables are replaced by files, ala Plan 9.  Instead of 
$EDITOR have /etc/default-applications/text-editor, web-browser, etc. 
TIdeally no programs should use environment variables for configuration; 
their existence is not obvious to the user, and neither is their 
possible values. (Shell scripts of course would still use env vars.) 
Programs should watch their configuration files for changes, to achive 
that instant-apply effect.

I'm most excited for that once we have a stable Reiser4 system with 
files as dirs, it should be easy to write a universal configurator tool 
using files as keys.

