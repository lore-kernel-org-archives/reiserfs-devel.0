From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Mon, 11 Sep 2006 10:09:44 +0000 (UTC)
Message-ID: <ee3cl8$5fo$1@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <45047190.2040101@slaphack.com>
	<ee1vth$dgb$2@sea.gmane.org> <200609111130.39647.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29849-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Mon, 11 Sep 2006 11:30:39 +0400, Vladimir V. Saveliev wrote:

> Hello
> 
> On Monday 11 September 2006 01:26, Peter wrote:
>> On Sun, 10 Sep 2006 15:12:00 -0500, David Masover wrote:
>> > Peter wrote:
>> >> Using: gentoo
>> >> kernel 2.6.17.11 with beyond patchset
>> >> reiser patch 2.6.17-3
>> >> reiser4progs 1.0.5
>> >>
>> >> At the end of the gentoo shutdown script is a short function which
>> >> remounts / as ro.
>> >
>> > There's also one in the Gentoo startup script, which attempts to remount
>> > / ro, then remount it rw.  I commented that out, because it was causing
>> > similar problems.  I figure if it runs sync when it shuts down, that's
>> > good enough.
>>
>> The errors I note only occur on shutdown (halt.sh) not startup. 
> 
> Sorry, I am confused. In the first mail you said:
> "On reboot or after a poweroff, root does not mount properly, and after
> some modules are loaded, there are segfaults when running init scripts."
> 
> This looks like  you have problems on startup. Would you, please, describe the 
> sequence of operations which leads to the problem with more details.
> 
Yes, it is confusing. I may be incorrect. It is my BELIEF that the error
is caused by an improper shutdown, not an improper startup. This is
because after the error, typing CTRL-D to continue merely unmounts the /
volume and reboots again. Next time the system runs fine. If it was a
startup problem, wouldn't it occur every time then? If you recall, when I
wrote about this with teh Sabayon Linux CD issue, it was not unmounting
volumes or syncing them properly which led to a similar problem on
startup. That's why I thought the mount -o remount,ro / command was the
culprit. I think the only way to nail this down will be to create a
separate partition, identical in all ways, except with reiserfs or ext3
instead. See what happens then.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

