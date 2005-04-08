From: Nate Diller <ndiller@namesys.com>
Subject: Re: Mask moderation policy
Date: Thu, 07 Apr 2005 18:41:38 -0700
Message-ID: <4255E152.3060808@namesys.com>
References: <4254E668.40300@namesys.com> <42558937.8000906@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=------------040201070400010001030209
Return-path: <reiserfs-list-return-23803-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <42558937.8000906@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

--------------040201070400010001030209
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hans Reiser wrote:

>Nate, give them the code, and use the latest text we wrote for the
>moderation policy guidelines.
>
>  
>
Ok guys, if you want the patch (and weren't clever/motivated enough to 
find it from the security_mask page source ;), go to 
www.namesys.com/mask/linux-2.6.12-rc1-mm1/maskb6.patch.   'Course no 
warranty, buggy as hell, yada yada...

The latest version of the moderation document that Hans mentioned is 
attatched.  I call it the God version, because it basically says we 
don't need any input from people like you anyway, we just appoint a 
benevolent dictator instead.  So give us feedback as to which policy is 
better, cause if you pick this version, it's the last input you get 
<laughs maniacally>

I still haven't had a chance to document the accessed/denied logging 
feature, so here it is:  create the directory [exe].accessed to have it 
fill in the paths of everything the program tried to access that the 
mask let through, and [exe].denied for everything it tried to access 
that the mask didn't allow.

Enjoy

NATE

--------------040201070400010001030209
Content-Type: text/plain;
 name="god_moderation_policy"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="god_moderation_policy"

Since we suspect one person working full-time during Phase II could generate
masks for all significant Linux applications and all distros, the web of trust
and critical mass issues may turn out to be trivial.  This person hired for
Phase II should get a security clearance.

We propose the following mechanism:  for each distro there shall be a (not
necessarily unique) masks maintainer.   For each package maintainer there shall
be a (not necessarily unique) masks maintainer who creates at least one mask
valid for at least one distro.  There shall be a website on which all masks are
placed.

Distro masks maintainers are appointed by the distro.  Those distros who desire
to be accepted by the Department of Defense should use persons trusted by the
Department of Defense, or alternatively, the Department of Defense should use
its own personnel for that purpose.  Distro masks maintainers shall convert
masks from those created by the package mask maintainer to one effective for
their distro.  Scripts will be developed to suggest conversions.

It seems likely that in Phase II we could hire one person to create a mask for
every major package in Linux.  It just is not that much work when you have a
tool for doing it, and of course, if one person can do the job, the web of
trust and initial critical mass issues become pleasantly trivialized. 
Integrating those masks with individual distros should be done by those distros
other than Debian because usually only they can participate in their last
minute QA process.  We are likely to offer to provide a masks expert consultant
to each distro for a modest fee though.

In sum, we hope that by providing effective automation, and making an effort to
be of service to the community, this issue becomes trivialized for all packages
sufficiently standard that they come with a distro, and a reasonable task for
administrators to perform for those packages that are bought separately from a
distro or are home grown.

--------------040201070400010001030209--
