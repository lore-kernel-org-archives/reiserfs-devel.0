From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4 corruption on initial copy
Date: Sat, 2 Sep 2006 10:26:34 +0000 (UTC)
Message-ID: <edbm8q$ana$1@sea.gmane.org>
References: <ed9412$2r9$1@sea.gmane.org> <44F8B5B1.1020009@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29790-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Fri, 01 Sep 2006 17:35:29 -0500, David Masover wrote:

> Peter wrote:
> 
>> 2) I did run badblocks on the dest, and it was clean. 3) I am using the
>> patch from 2.6.17.3 and in my kernel, I have full preempt and cfq
>> scheduling.
> 
> What about the kernel on the livecd?


Anticipatory
Voluntary

Plus, it is smp, so there are some additional options checked. Should I
have preempt=none with reiser4?

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

