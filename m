From: Hans Reiser <reiser@namesys.com>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Mon, 02 Aug 2004 11:18:08 -0700
Message-ID: <410E8560.8060907@namesys.com>
References: <410D96DC.1060405@namesys.com> <200408021112.08981.christian.mayrhuber@gmx.net> <87r7qpo3dj.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87r7qpo3dj.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

Hubert Chan wrote:

>>>>>>"Christian" == Christian Mayrhuber <christian.mayrhuber@gmx.net> writes:
>>>>>>            
>>>>>>
>
>Christian> Linux VServer might be a project that already tries to
>Christian> accomplish this task.
>
>After poking around the linux-veserver.org page, it sounds like Linux
>VServer is completely different from what Hans/Namesys is trying to do.
>Linux VServer still uses chroot.  From what I understand about views,
>you don't need to set up a chroot; applications run under the same
>filesystem as everything else.  You just need to, for example, say that
>apache is allowed to read from /etc/apache/*, /var/www, /usr/lib, etc.,
>and is allowed to write to /var/log/apache/*.  Then, even though apache
>is running under the same filesystem, it won't even be able to see, say
>/etc/passwd.
>
>  
>
Thanks for being more eloquent than what I was going to say.;-)
