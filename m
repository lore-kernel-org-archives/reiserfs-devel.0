From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Fri, 16 Aug 2002 16:58:43 +0200
Message-ID: <20020816145843.GC3591@merlin.emma.line.org>
References: <200208152007.42370.degerrit@web.de> <200208152253.40413.vitaly@namesys.com> <200208152329.40707.degerrit@web.de> <200208161205.00550.vitaly@namesys.com> <3D5CBF08.4010308@web.de> <m3ptwjw00q.fsf@merlin.emma.line.org> <3D5CFA0B.3030107@web.de> <m3wuqqq4dg.fsf@merlin.emma.line.org> <3D5D0B24.2030806@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11211-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D5D0B24.2030806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, 16 Aug 2002, Hans Reiser wrote:

> A colleague of mine back when I was part of a sysadmin department used 
> to write to every block on the drive before installing the OS on it.  I 
> think he was right to do so.  I have considered having mkreiserfs ask 
> the user if he wants to do that.

badblocks has options to do so, so just running badblocks with the right
options should be sufficient. 
