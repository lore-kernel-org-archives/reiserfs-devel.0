From: Stephen Smalley <sds@epoch.ncsc.mil>
Subject: Re: Using fs views to isolate untrusted processes: I need an
	assistant architect in the USA for Phase I of a DARPA funded linux kernel
	project
Date: Thu, 26 Aug 2004 09:59:23 -0400
Message-ID: <1093528762.9280.121.camel@moss-spartans.epoch.ncsc.mil>
References: <410D96DC.1060405@namesys.com>
	 <Pine.LNX.4.44.0408251624540.5145-100000@chimarrao.boston.redhat.com>
	 <20040825205618.GA7992@hockin.org> <412D0339.3080601@sun.com>
	 <412D83D9.2050503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412D83D9.2050503@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Mike Waychison <Michael.Waychison@sun.com>, Tim Hockin <thockin@hockin.org>, Rik van Riel <riel@redhat.com>, lkml <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2004-08-26 at 02:31, Hans Reiser wrote:
> Everybody who takes a 3 minute read of SELinux keeps saying it has, but 
> it hasn't quite, not when you look at the details.  SELinux is not 
> written by filesystem folks, and there are scalability details that matter.

I don't quite see the point about filesystem folks.
With regard to scalability, there is ongoing work in that area, and
patches on lkml that are being discussed even now, so that is hardly a
show stopper.

> > What is needed (if it doesn't already
> > exist) is a tool to gather these 'viewprints' automagically.
> 
> It doesn't exist, and viewprints are also not stored with executables 
> either, so it is not process oriented.
> 
> People think the problem is allowing the OS to enact fine grained 
> security.  It is not.  The problem is allowing the user to enact fine 
> grained security, and without a lot of work to automate it, users will 
> continue to be unable to bear that time cost.

Users don't want to think about fine grained security at all, and
automated schemes will inevitably generate policies that are insecure ;)

SELinux already has a significant corpus of policy that has been
developed over time, most of it contributed by external contributors,
with > 190 different program domains in the current example policy.  It
has the obvious simple tool for generating policy from audit messages
produced during a run of a program, but that tool has certainly not been
a good source for secure policy.  It has tools for analyzing policies,
including information flow and goal checking, although much work still
remains to be done here.  Much better investment to work on improving
SELinux in these areas than re-inventing the wheel...

-- 
Stephen Smalley <sds@epoch.ncsc.mil>
National Security Agency

